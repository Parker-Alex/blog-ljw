package com.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @RequestMapping("/add")
    public String addArticle(){
        return "blog/article_add";
    }
}
