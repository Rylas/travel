package org.example.travel.utils;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class CheckPermission {
public CheckPermission() {
    }

    public static boolean checkAdmin(HttpSession session, RedirectAttributes ra) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ra.addFlashAttribute("errMsg", "Please login to use this utils");
            return false;
        }
        String role = user.getRole().getRoleName();
        if (!role.equals("admin")) {
            ra.addFlashAttribute("errMsg", "You don't have permission to access this page");
            return false;
        }
        return true;
    }
}
