package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.example.travel.service.TourService;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Objects;

@Controller
public class AdminController {
    @Autowired
    private TourService tourService;

    @Autowired
    private UserService userService;


    @GetMapping("/admin")
    public String adminPage(HttpSession session, RedirectAttributes ra){
        User user = (User) session.getAttribute("user");
        if(user == null){
            ra.addFlashAttribute("errMsg", "Please login to use this utils");
            return "redirect:/login";
        }
        String role = user.getRole();
        if (!Objects.equals(role, "admin")) {
            return "redirect:/";
        }
        return "admin/index";
    }

    @GetMapping("/admin/user")
    public String userAdmin(Model model) {
        model.addAttribute("users", userService.getAllUser());
        return "user/list-user-admin";
    }

    @GetMapping("/admin/user/edit")
    public String editUserAdmin(Model model, @RequestParam("id") Long id) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "user/edit-user-admin";
    }

    @GetMapping("/admin/user/delete")
    public String deleteUserAdmin(@RequestParam("id") Long id) {
        userService.deleteUser(id);
        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/edit")
    public String editUserAdmin(User user) {
        userService.saveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/add")
    public String addUserAdmin() {
        return "user/new-user-admin";
    }

    @PostMapping("/admin/user/add")
    public String addUserAdmin(User user) {
        userService.saveUser(user);
        return "redirect:/admin/user";
    }
}
