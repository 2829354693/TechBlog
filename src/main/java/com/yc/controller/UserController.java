package com.yc.controller;

import com.yc.model.Blog;
import com.yc.model.BlogAndUserCustom;
import com.yc.model.User;
import com.yc.service.BlogService;
import com.yc.service.UserService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;

@Controller
@PropertySource("classpath:app.properties")
@RequestMapping("/user")
public class UserController {

    @Value("${nginx.pic.head}")
    private String headPicPath;

    @Value("${pic.head.store}")
    private String headPicStorePath;

    @Autowired
    UserService userService;

    @Autowired
    BlogService blogService;

    @GetMapping("/login")
    public String goLogin(){
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(HttpSession session, User user) throws Exception{
        if (userService.isUserEixst(user.getAccount())){
            List<User> users = userService.getUserByAccount(user.getAccount());
            SimpleHash simpleHash = new SimpleHash("md5", user.getPassword(), users.get(0).getSalt(), 5);
            if (users.get(0).getPassword().equals(simpleHash.toString())){
                session.setAttribute("user", users.get(0));
                return "success";
            }else {
                return "fail";
            }
        }else {
            return "noAccount";
        }
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) throws Exception{
        session.removeAttribute("user");
        return "redirect:/";
    }

    @PostMapping("/register")
    @ResponseBody
    public String register(@RequestBody User user, HttpSession session) throws Exception{
        if (!userService.isUserEixst(user.getAccount())){
            String salt = RandomStringUtils.randomAlphanumeric(5);
            SimpleHash simpleHash = new SimpleHash("md5", user.getPassword(), salt, 5);
            String encryptPassword = simpleHash.toString();

            String signature = "这个人很懒，什么都没有写。";
            User regUser = new User(user.getAccount(), encryptPassword, salt, "bloger", signature, null, new Date());

            userService.addUser(regUser);

//            session.setAttribute("user", regUser);
            return "success";
        }else {
            return "accountExist";
        }
    }

    @GetMapping("/userCenter")
    public String userCenter(HttpSession session, Model model) throws Exception{
        User user =(User) session.getAttribute("user");
        if (user==null){
            return "error";
        }
        model.addAttribute("headPicPath", headPicPath);
        return "user/user_center";
    }

    @PostMapping("/updateUser")
    public String updateUser(HttpSession session, User updateUser, MultipartFile preHeadPic) throws Exception{
        User user =(User) session.getAttribute("user");
        if (user==null){
            return "error";
        }
        updateUser.setId(user.getId());

        if (preHeadPic != null && preHeadPic.getOriginalFilename() != null && preHeadPic.getOriginalFilename().length() > 0){
            String originalFilename = preHeadPic.getOriginalFilename();
            String newFileName = RandomStringUtils.randomAlphanumeric(10)+originalFilename.substring(originalFilename.lastIndexOf("."));
            File newHeadPic = new File(headPicStorePath, newFileName);
            preHeadPic.transferTo(newHeadPic);
            updateUser.setHeadPic(newFileName);
        }

        if (!updateUser.getPassword().equals("")){
            String salt = RandomStringUtils.randomAlphanumeric(5);
            SimpleHash simpleHash = new SimpleHash("md5", updateUser.getPassword(), salt, 5);
            String encryptPassword = simpleHash.toString();

            updateUser.setPassword(encryptPassword);
            updateUser.setSalt(salt);
        }else {
            updateUser.setPassword(null);
        }

        userService.updateUser(updateUser);
        List<User> users = userService.getUserByAccount(user.getAccount());
        session.removeAttribute("user");
        session.setAttribute("user", users.get(0));
        return "redirect:/user/userCenter";
    }

    @GetMapping("/write")
    public String write() throws Exception{
        return "user/user_write";
    }

    @PostMapping("/submitBlog")
    @ResponseBody
    public String submitBlog(HttpSession session, Blog blog) throws Exception{
        User user =(User) session.getAttribute("user");

        blog.setTime(new Date());
        blog.setUserId(user.getId());
        blog.setReadNum(0);
        blogService.insertBlog(blog);
        return "success";
    }

    @GetMapping("/myBlog")
    public String myBlog(HttpSession session, Model model) throws Exception{
        User user =(User) session.getAttribute("user");
        if (user==null){
            return "error";
        }

        List<BlogAndUserCustom> allBlogByUserId = userService.getAllBlogByUserId(user.getId());

        for (BlogAndUserCustom blog : allBlogByUserId) {
            Integer commentNum = blogService.getCommentNumByBlogId(blog.getBlogId());
            blog.setCommentNum(commentNum);
            Integer blogLikeNum = blogService.getBlogLikeNumByBlogId(blog.getBlogId());
            blog.setLikeNum(blogLikeNum);
        }

        model.addAttribute("headPicPath", headPicPath);
        model.addAttribute("blogAndUsers", allBlogByUserId);
        return "user/user_blog";
    }


}
