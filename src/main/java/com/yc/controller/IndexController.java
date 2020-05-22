package com.yc.controller;


import com.yc.model.BlogAndUserCustom;
import com.yc.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@PropertySource("classpath:app.properties")
public class IndexController {

    @Value("${nginx.pic.head}")
    private String headPicPath;

    @Resource
    BlogService blogService;

    @RequestMapping("/")
    public String indexPage(HttpSession session, Model model) throws Exception{
        model.addAttribute("headPicPath", headPicPath);

        List<BlogAndUserCustom> blogAndUsers = blogService.getTenBlogAndUser();

        for (BlogAndUserCustom blogAndUser : blogAndUsers) {
            Integer commentNum = blogService.getCommentNumByBlogId(blogAndUser.getBlogId());
            blogAndUser.setCommentNum(commentNum);
            Integer blogLikeNum = blogService.getBlogLikeNumByBlogId(blogAndUser.getBlogId());
            blogAndUser.setLikeNum(blogLikeNum);
        }

        model.addAttribute("blogAndUsers", blogAndUsers);

        return "index";
    }

    @GetMapping("/byType")
    public String byType(String type, Model model) throws Exception{
        model.addAttribute("headPicPath", headPicPath);

        List<BlogAndUserCustom> tenBlogAndUserByType = blogService.getTenBlogAndUserByType(type);

        for (BlogAndUserCustom blogAndUserCustom : tenBlogAndUserByType) {
            Integer commentNum = blogService.getCommentNumByBlogId(blogAndUserCustom.getBlogId());
            blogAndUserCustom.setCommentNum(commentNum);
            Integer blogLikeNum = blogService.getBlogLikeNumByBlogId(blogAndUserCustom.getBlogId());
            blogAndUserCustom.setLikeNum(blogLikeNum);
        }

        model.addAttribute("blogAndUsers", tenBlogAndUserByType);

        return "index";
    }

}
