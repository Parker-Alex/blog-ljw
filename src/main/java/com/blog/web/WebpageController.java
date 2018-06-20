package com.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class WebpageController {

//    登录处理器
    @RequestMapping("/login")
    public String login(){
        return "blog/login";
    }

}
