package com.blog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @RequestMapping("/add")
    public String addArticle(){
        return "blog/article_add";
    }

    @RequestMapping("/add_do")
    public ModelAndView addArticleDo(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("blog/main");
//        modelAndView.addObject("title",request.getAttribute("id"));
        return modelAndView;
    }
}
