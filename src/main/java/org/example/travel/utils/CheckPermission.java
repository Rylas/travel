package org.example.travel.utils;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Enterprise;
import org.example.travel.entity.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Objects;

public class CheckPermission {
public CheckPermission() {
    }

    public static void checkAdmin(HttpSession session, RedirectAttributes ra) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ra.addFlashAttribute("errMsg", "Please login to use this utils");
            return;
        }
        String role = user.getRole().getRoleName();
        if (!role.equals("admin")) {
            ra.addFlashAttribute("errMsg", "You don't have permission to access this page");
        }
    }

    public static void checkLogin(HttpSession session, RedirectAttributes ra) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ra.addFlashAttribute("errMsg", "Please login to use this utils");
        }
    }

    public static boolean checkEnterprise(HttpSession session, RedirectAttributes ra) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ra.addFlashAttribute("errMsg", "Please login to use this utils");
            return false;
        }
        Enterprise enterprise = (Enterprise) session.getAttribute("enterprise");
        if (enterprise == null && !Objects.equals(user.getRole().getRoleName(), "admin")) {
            ra.addFlashAttribute("errMsg", "You don't have permission to access this page");
            return false;
        }
        return true;
    }

}
