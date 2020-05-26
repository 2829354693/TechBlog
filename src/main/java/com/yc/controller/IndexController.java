package com.yc.controller;


import com.github.pagehelper.PageInfo;
import com.yc.model.BlogAndUserCustom;
import com.yc.service.BlogService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    public String indexPage(Model model, Integer pageIndex) throws Exception{
        model.addAttribute("headPicPath", headPicPath);

        Integer pageIndexEx = pageIndex == null?1:pageIndex;
        List<BlogAndUserCustom> blogAndUsers = blogService.getPageBlogAndUser(pageIndexEx, 5);

        List<BlogAndUserCustom> blogAndUserCustoms = blogService.addCommentAndLikeNum(blogAndUsers);

        PageInfo<BlogAndUserCustom> pageInfo = new PageInfo<>(blogAndUserCustoms);
        model.addAttribute("topTen", blogService.getTopTenBlog());
        model.addAttribute("pageInfo", pageInfo);

        return "index";
    }

    @GetMapping("/byType")
    public String byType(String type, Model model) throws Exception{
        model.addAttribute("headPicPath", headPicPath);

        List<BlogAndUserCustom> tenBlogAndUserByType = blogService.getTenBlogAndUserByType(type);

        model.addAttribute("topTen", blogService.getTopTenBlog());
        model.addAttribute("blogAndUsers", blogService.addCommentAndLikeNum(tenBlogAndUserByType));

        return "index";
    }

    //首页模糊查询博客(zh)
    @PostMapping("/filterBlog")
    public String filterBlog(String titlePart, Model model) throws Exception {

        List<BlogAndUserCustom> blogSearched = blogService.getBlogbyFuzzyFilter(titlePart);

        model.addAttribute("topTen", blogService.getTopTenBlog());
        model.addAttribute("headPicPath", headPicPath);
        model.addAttribute("blogAndUsers", blogService.addCommentAndLikeNum(blogSearched));
        return "index";
    }
}
