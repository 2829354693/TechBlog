package com.yc.controller;

import com.yc.model.Blog;
import com.yc.model.Comment;
import com.yc.model.CommentAndUserCustom;
import com.yc.model.User;
import com.yc.service.BlogService;
import com.yc.service.CommentService;
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
@PropertySource("classpath:app.properties")
@RequestMapping("/blog")
public class BlogController {

    @Value("${nginx.pic.head}")
    private String headPicPath;

    @Autowired
    BlogService blogService;

    @Autowired
    CommentService commentService;

    @GetMapping("/detail")
    public String detail(Integer blogId, Model model) throws Exception{
        blogService.updateBlogReadNum(blogId);

        Blog blog = blogService.getBlogByBlogId(blogId);

        Integer commentNum = blogService.getCommentNumByBlogId(blogId);
        Integer blogLikeNum = blogService.getBlogLikeNumByBlogId(blogId);

        List<CommentAndUserCustom> commentAndUsers = commentService.getCommentAndUsersByBlogId(blogId);

        for (CommentAndUserCustom commentAndUser : commentAndUsers) {
            Integer commentLikeNum = commentService.getCommentLikeNumByCommentId(commentAndUser.getCommentId());
            commentAndUser.setCommentLikeNum(commentLikeNum);
        }

        model.addAttribute("headPicPath", headPicPath);
        model.addAttribute("blog", blog);
        model.addAttribute("commentNum", commentNum);
        model.addAttribute("blogLikeNum", blogLikeNum);
        model.addAttribute("allComment", commentAndUsers);

        return "blog_detail";
    }

    @PostMapping("/blogLike")
    @ResponseBody
    public String blogLike(HttpSession session, Integer blogId) throws Exception{
        User user = (User) session.getAttribute("user");

        if (blogService.isUserAlreadyLikeBlog(blogId, user.getId())){
            return "alreadyLike";
        }else {
            blogService.addBlogLikeNum(blogId, user.getId());
            return "success";
        }
    }


}
