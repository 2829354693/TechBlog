package com.yc.controller;


import com.github.pagehelper.PageInfo;
import com.yc.model.BlogAndUserCustom;
import com.yc.service.BlogService;
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
    public String indexPage(HttpSession session, Model model, Integer pageIndex) throws Exception{
        model.addAttribute("headPicPath", headPicPath);

        Integer pageIndexEx = pageIndex == null?1:pageIndex;
        List<BlogAndUserCustom> blogAndUsers = blogService.getPageBlogAndUser(pageIndexEx, 5);

        for (BlogAndUserCustom blogAndUser : blogAndUsers) {
            Integer commentNum = blogService.getCommentNumByBlogId(blogAndUser.getBlogId());
            blogAndUser.setCommentNum(commentNum);
            Integer blogLikeNum = blogService.getBlogLikeNumByBlogId(blogAndUser.getBlogId());
            blogAndUser.setLikeNum(blogLikeNum);
        }

        PageInfo<BlogAndUserCustom> pageInfo = new PageInfo<>(blogAndUsers);
        model.addAttribute("topTen", blogService.getTopTenBlog());
        model.addAttribute("pageInfo", pageInfo);

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

        model.addAttribute("topTen", blogService.getTopTenBlog());
        model.addAttribute("blogAndUsers", tenBlogAndUserByType);

        return "index";
    }

}
