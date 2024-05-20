package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.example.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private TourService tourService;

    @GetMapping("/admin")
    public String adminPage(){
        return "admin/index";
    }


}
