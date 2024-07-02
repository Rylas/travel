package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.User;
import org.example.travel.service.BookingService;
import org.example.travel.service.FileStorageService;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private FileStorageService fileStorageService;
    @Autowired
    private BookingService bookingService;

    // Hàm xem thông tin của người dùng
    @GetMapping("/information")
    public String informationPage(HttpSession session, RedirectAttributes ra){
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "Bạn cần đăng nhập để sử dụng chức năng này!");
            return "redirect:/login";
        }
        return "profile/info-account";
    }

    // Hiển thị trang thay đổi mật khẩu
    @GetMapping("/change-password")
    public String changePasswordPage(HttpSession session, RedirectAttributes ra){
        if(session.getAttribute("user") != null){ // Kiểm tra xem người dùng đã đăng nhập hay chưa để sử dụng chức năng
            return "authentication/change-password";
        }
        ra.addFlashAttribute("errorMsg", "Bạn cần đăng nhập để sử dụng chức năng này!");
        return "redirect:/login";
    }

    // Hàm thực hiện thay đổi thông tin của người dùng
    @PostMapping("/changeInfo")
    public String changeInfo(User user, HttpSession session){
        User userSession = (User) session.getAttribute("user");
        userSession.setEmail(user.getEmail());
        userSession.setFirstName(user.getFirstName());
        userSession.setLastName(user.getLastName());
        userSession.setPhone(user.getPhone());
        userService.saveUser(userSession);
        session.setAttribute("user", userSession);
        return "redirect:/information";
    }

    // Hàm thực hiện thay đổi avatar của người dùng
    @PostMapping("/changeAvatar")
    public String changeAvatar(@RequestParam("avatar") MultipartFile avatarFile,
                               HttpSession session) {
        if (!avatarFile.isEmpty()) {
            String avatarUrl = fileStorageService.storeFile(avatarFile);

            User user = (User) session.getAttribute("user");
            user.setAvatar(avatarUrl);

            userService.updateAvatar(user);

            session.setAttribute("user", user);
        }

        return "redirect:/information";
    }

    @GetMapping("/cash")
    public String cash(HttpSession session, RedirectAttributes ra, Model model){
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "Bạn cần đăng nhập để sử dụng chức năng này!");
            return "redirect:/login";
        }
        User user = (User) session.getAttribute("user");
        model.addAttribute("bookings", bookingService.getBookingsByUserId(user.getUserID()));
        return "user/cash";
    }
}
