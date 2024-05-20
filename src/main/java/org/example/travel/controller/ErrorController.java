package org.example.travel.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {
    // Hàm để chỉnh sửa lại trang hiển thị khi request bị lỗi
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        return "error/error-404";
    }
}
