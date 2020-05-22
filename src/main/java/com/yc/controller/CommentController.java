package com.yc.controller;

import com.yc.model.Comment;
import com.yc.model.CommentAndUserCustom;
import com.yc.model.User;
import com.yc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/comment")
@PropertySource("classpath:app.properties")
public class CommentController {
    @Value("${nginx.pic.head}")
    private String headPicPath;

    @Autowired
    CommentService commentService;

    @PostMapping("/addComment")
    @ResponseBody
    public CommentAndUserCustom addComment(HttpSession session, String commentContent, Integer blogId) throws Exception{
        User user = (User) session.getAttribute("user");
        Date nowDate = new Date();
        Comment comment = new Comment(commentContent, nowDate, user.getId(), blogId);
        commentService.addComment(comment);

        return new CommentAndUserCustom(headPicPath, commentContent, nowDate, user.getId(), user.getHeadPic(), user.getName());
    }


}
