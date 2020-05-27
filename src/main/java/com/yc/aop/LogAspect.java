package com.yc.aop;


import com.yc.mapper.LogMapper;
import com.yc.mapper.UserMapper;
import com.yc.model.Blog;
import com.yc.model.Log;
import com.yc.model.User;
import com.yc.service.LogService;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Aspect
@Component
public class LogAspect {

    @Autowired
    LogMapper logMapper;

    @Autowired
    UserMapper userMapper;

    private static final Log LOG = new Log();

    @Pointcut("execution(* com.yc.service.impl.UserServiceImpl.userLoginSuccess(..))")
    public void pointcutLogin() {
    }

    @Pointcut("execution(* com.yc.controller.UserController.logout(..))")
    public void pointcutLogout(){}

    @Pointcut("execution(* com.yc.mapper.UserMapper.insertUser(..))")
    public void pointcutRegister(){}

    @Pointcut("execution(* com.yc.mapper.BlogMapper.insertBlog(..))")
    public void pointcutSubmitBlog(){}


    @AfterReturning(value = "pointcutLogin() && args(request,session,user)", argNames = "request,session,user")
    public void userLogin(HttpServletRequest request, HttpSession session, User user) throws Exception {
        LOG.setLogName(user.getAccount());
        LOG.setLogIp(getIpAddress(request));
        LOG.setLogTime(new Date());
        LOG.setLogWay("登录操作");
        logMapper.insertLog(LOG);
    }

    @Before(value = "pointcutLogout() && args(request,session)", argNames = "request,session")
    public void userLogout(HttpServletRequest request, HttpSession session) throws Exception{
        User user = (User) session.getAttribute("user");
        LOG.setLogName(user.getAccount());
        LOG.setLogIp(getIpAddress(request));
        LOG.setLogTime(new Date());
        LOG.setLogWay("注销操作");
        logMapper.insertLog(LOG);
    }

    @After(value = "pointcutRegister() && args(user)", argNames = "user")
    public void userRegister(User user) throws Exception{
        LOG.setLogName(user.getAccount());
        LOG.setLogIp("未知");
        LOG.setLogTime(new Date());
        LOG.setLogWay("注册操作");
        logMapper.insertLog(LOG);
    }

    @AfterReturning("pointcutSubmitBlog() && args(blog)")
    public void submitBlog(Blog blog) throws Exception{
        User user = userMapper.getUserByUserId(blog.getUserId());
        LOG.setLogName(user.getAccount());
        LOG.setLogIp("未知");
        LOG.setLogTime(new Date());
        LOG.setLogWay("发布博客");
        logMapper.insertLog(LOG);
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}
