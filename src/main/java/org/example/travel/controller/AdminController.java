package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.example.travel.service.MailService;
import org.example.travel.service.RoleService;
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
    private MailService mailService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;


    @GetMapping("/admin")
    public String adminPage(HttpSession session, RedirectAttributes ra){
        User user = (User) session.getAttribute("user");
        if(user == null){
            ra.addFlashAttribute("errMsg", "Please login to use this utils");
            return "redirect:/login";
        }
        String role = user.getRole().getRoleName();
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
        User user = userService.getUserByUserID(id);
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
    public String addUserAdmin(Model model) {
        model.addAttribute("listRoles", roleService.getAllRoles());
        return "user/new-user-admin";
    }

    @GetMapping("/admin/user/ban")
    public String banUserAdmin(@RequestParam("id") Long id, Model model) {
        User user = userService.getUserByUserID(id);
        model.addAttribute("userBan", user);
        return "user/ban-user";
    }
    @PostMapping("/admin/user/ban")
    public String banUser(@RequestParam("id") Long id, @RequestParam("reason") String reason) {
        System.out.println(2);
        userService.banUser(id, reason);
        // URL sẽ là địa chỉ của trang web mà người dùng sẽ được chuyển hướng
        mailService.sendActivationEmail(userService.getUserByUserID(id).getEmail(), "Tài khoản của bạn đã bị cấm", "Tài khoản của bạn đã bị cấm. Lý do: " + reason + ". Vui lòng liên hệ với admin hoặc qua email example@gmail.com để được cung cấp thông tin và giải quyết vấn đề.",
                "Thông báo cấm tài khoản","Liên hệ với admin", "http://localhost:8080/contact");
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/unban")
    public String unbanUser(@RequestParam("id") Long id) {
        userService.unbanUser(id);
        return "redirect:/admin/user";
    }
}
