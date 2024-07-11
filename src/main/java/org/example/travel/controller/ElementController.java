package org.example.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ElementController {
    @GetMapping("/about")
    public String about() {
        return "element/about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "element/contact";
    }

    @GetMapping("/blog")
    public String blog() {
        return "element/blog";
    }

    @GetMapping("/singleBlog")
    public String singleBlog() {
        return "element/single-blog";
    }
}
