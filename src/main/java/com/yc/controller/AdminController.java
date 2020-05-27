package com.yc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.model.AdminUser;
import com.yc.model.Blog;
import com.yc.model.Log;
import com.yc.model.User;
import com.yc.service.AdminService;
import com.yc.service.BlogService;
import com.yc.service.LogService;
import com.yc.service.UserService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
@PropertySource("classpath:app.properties")
public class AdminController {

    @Value("${nginx.pic.head}")
    private String headPicPath;

    @Autowired
    AdminService adminService;

    @Autowired
    BlogService blogService;

    @Autowired
    UserService userService;

    @Autowired
    LogService logService;

    @GetMapping("/")
    public String goLogin() {
        return "admin/admin_login";
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(HttpSession session, AdminUser adminUser) throws Exception {
        AdminUser adminUser1 = adminService.getAdminUserByAccount(adminUser.getAccount());
        if (adminUser1 != null && adminUser1.getPassword().equals(adminUser.getPassword())) {
            session.setAttribute("admin", adminUser1);
            return "success";
        } else {
            return "fail";
        }
    }

    @GetMapping("/index")
    public String index(){
        return "admin/admin_index";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) throws Exception {
        session.removeAttribute("admin");
        return "redirect:/admin/";
    }

    @GetMapping("/manageUser")
    public String manageUser(Model model, Integer pageIndex) throws Exception {
        int pageIndexEx = pageIndex == null ? 1 : pageIndex;
        PageHelper.startPage(pageIndexEx, 5);
        List<User> users = adminService.getAllUser();

        PageInfo<User> pageInfo = new PageInfo<>(users);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("headPicPath", headPicPath);

        return "admin/manage_user";
    }

    @PostMapping("/searchUser")
    public String searchUser(Model model, String username) throws Exception{
        List<User> users = adminService.getUserByUsername(username);
        model.addAttribute("users", users);
        model.addAttribute("headPicPath", headPicPath);
        return "admin/manage_user";
    }

    @PostMapping("/delUser")
    @ResponseBody
    public String delUser(Integer userId) throws Exception{
        adminService.deleteUserByUserId(userId);
        return "success";
    }

    @GetMapping("/changePwd")
    public String changePwd(Model model, Integer userId) throws Exception{
        User user = userService.getUserByUserId(userId);
        model.addAttribute("user", user);
        return "admin/change_password";
    }

    @PostMapping("/changePwd")
    public String submitChange(Integer userId, String newPass) throws Exception{
        String newPassword = newPass==null||newPass.equals("") ? "111111":newPass;
        String salt = RandomStringUtils.randomAlphanumeric(5);
        SimpleHash simpleHash = new SimpleHash("md5", newPassword, salt, 3);
        String enPass = simpleHash.toString();
        adminService.updateUserPassword(userId, salt, enPass);
        return "redirect:/admin/manageUser";
    }

    @GetMapping("/manageBlog")
    public String manageBlog(Model model, Integer pageIndex) throws Exception {
        int pageIndexEx = pageIndex == null ? 1 : pageIndex;
        PageHelper.startPage(pageIndexEx, 5);
        List<Blog> blogs = adminService.getAllBlog();
        PageInfo<Blog> pageInfo = new PageInfo<>(blogs);

        model.addAttribute("pageInfo", pageInfo);
        return "admin/manage_blog";
    }

    @PostMapping("/searchBlog")
    public String searchBlog(Model model, String title) throws Exception{
        List<Blog> blogs = adminService.getBlogByTitle(title);
        model.addAttribute("blogs", blogs);
        return "admin/manage_blog";
    }

    @PostMapping("/deleteBlog")
    @ResponseBody
    public String deleteBlog(Integer blogId) throws Exception{
        blogService.deleteBlog(blogId);
        return "success";
    }

    @GetMapping("/systemLog")
    public String systemLog(Model model) throws Exception {
        List<Log> logs = logService.getAllLog();
        model.addAttribute("logs", logs);
        return "admin/system_log";
    }


}
