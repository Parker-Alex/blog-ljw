package com.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/blog")
public class WebpageController {

//    登录处理器
    @RequestMapping("/login")
    public String login(){
        return "blog/login";
    }

    @RequestMapping(value = {"/loginOut","/index"})
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "blog/home";
    }
}
