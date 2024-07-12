package org.example.travel.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Ban;
import org.example.travel.entity.Enterprise;
import org.example.travel.entity.User;
import org.example.travel.repository.UserRepository;
import org.example.travel.service.BanService;
import org.example.travel.service.MailService;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.util.List;
import java.util.UUID;

@Controller
public class AuthenticationController {
    @Autowired
    private MailService mailService;

    @Autowired
    private UserService userService;

    @Autowired
    private BanService banService;

    // Hiển thị trang đăng nhập
    @GetMapping("/login")
    public String loginPage(HttpSession session){
        if (session.getAttribute("user") != null){
            return "redirect:/";
        }
        return "authentication/login";
    }

    // Hiển thị trang đăng ký
    @GetMapping("/register")
    public String registerPage(HttpSession session){
        if (session.getAttribute("user") != null){
            return "redirect:/";
        }
        return "authentication/register";
    }

    // Hiển thị trang quên mật khẩu
    @GetMapping("/forgot-password")
    public String forgotPasswordPage(){
        return "authentication/forgot-password";
    }

    // Hàm thực hiện đăng nhập
    @PostMapping("/login")
    public String checkLogin(User user, RedirectAttributes ra, HttpSession httpSession) {
        user.setPassword(encryptMD5(user.getPassword()));
        User userCheck = userService.login(user.getEmail(), user.getPassword());
        if (userCheck != null) {
            Ban ban = banService.getBanByUserID(userCheck.getUserID());
            if (ban != null){
                ra.addFlashAttribute("errorMsg", "Tài khoản của bạn đã bị khóa! Vui lòng liên lạc với chúng tôi qua email: example@gmail.com hoặc chat với admin để được giải quyết. Xin cảm ơn!");
                return "redirect:/login";
            }
            if (userCheck.getIsActive()) {
                httpSession.setAttribute("user", userCheck);
                Enterprise enterprise = userService.getEnterpriseByUserID(userCheck.getUserID());
                if (enterprise != null) {
                    httpSession.setAttribute("enterprise", enterprise);
                }
                return "redirect:/";
            }  {
                ra.addFlashAttribute("errorMsg", "Tài khoản chưa được kích hoạt để sử dụng");
                return "redirect:/login";
            }
        } else {
            ra.addFlashAttribute("errorMsg", "Thông tin đăng nhập không chính xác!");
            return "redirect:/login";
        }
    }

    @PostMapping("/admin/user/add")
    public String addUserAdmin(User user) {
        String password = encryptMD5(user.getPassword());
        user.setPassword(password);
        userService.saveUser(user);
        return "redirect:/admin/user";
    }

    // Phần Đăng ký
    @PostMapping("/register")
    // RedirectAttributes dùng để truyền tham số điều hướng trang web (ví dụ: lời nhắn)
    // HttpServletRequest dùng để lấy thông tin request từ client
    public String register(User user, @RequestParam("confirmPassword") String confirmPassword, RedirectAttributes ra, HttpServletRequest request) {
        if (confirmPassword.isEmpty() || !user.getPassword().equals(confirmPassword)) {
            ra.addFlashAttribute("msg", "Mật khẩu không khớp, vui lòng kiểm tra lại!");
            return "redirect:/register";
        }

        User userCheck = userService.findByEmail(user.getEmail());
        if (userCheck != null) {
            ra.addFlashAttribute("msg", "Email đã tồn tại trong hệ thống!");
            return "redirect:/register";
        }

        String hashPassword = encryptMD5(user.getPassword()); // Mã hóa mật khẩu hiện tại
        user.setPassword(hashPassword);

        // Sinh mã token
        String token = UUID.randomUUID().toString();
        user.setToken(token);

        if (userService.saveUser(user) == null){
            ra.addFlashAttribute("msg", "Đăng ký không thành công, vui lòng thử lại!");
            return "redirect:/register";
        }
        String message = "Cảm ơn bạn đã đăng ký trở thành thành viên của chúng tôi.\n" +
                "Vui lòng sử dụng đường dẫn say để kích hoạt tài khoản của bạn: http://" + request.getServerName() + ":" + request.getServerPort() +
                request.getContextPath() + "/active/" + token;
        String subject = "Kích hoạt tài khoản";
        mailService.sendActivationEmail(user.getEmail(), subject, message, "Kích hoạt tài khoản","Kích hoạt tài khoản", "http://localhost:8080/active/" + token);

        ra.addFlashAttribute("successMsg", "Đăng ký thành công, chúng tôi đã gửi một mã kích hoạt tài khoản đến email của bạn. Vui lòng kích hoạt để có thể đăng nhập!");
        return "redirect:/login";
    }

    // Hàm thực hiện kích hoạt tài khoản khi đăng ký tài khoản
    @GetMapping("/active/{token}")
    public String validateRegister(@PathVariable("token") String token, Model model, RedirectAttributes ra){
        User user = userService.findByToken(token);
        if (user != null) {
            userService.activateAccount(user.getUserID());
            ra.addFlashAttribute("successMsg", "Kích hoạt thành công tài khoản, vui lòng đăng nhập để sử dụng!");
            return "redirect:/login";
        } else {
            model.addAttribute("errMsg", "Đã có lỗi! ");
            return "redirect:/error";
        }
    }

    // Hàm thực hiện gửi token đến email để khôi phục mật khẩu
    @PostMapping("/forgot-password")
    public String forgotPassword(User user, RedirectAttributes ra, HttpServletRequest request) {
        User userCheck = userService.findByEmail(user.getEmail());
        if (userCheck != null) {
            String token = UUID.randomUUID().toString();
            userCheck.setToken(token);
            userService.saveUser(userCheck);
            String message = "Có vẻ như bạn đã yêu cầu khôi phục mật khẩu.\n" +
                    " Nếu không phải là bạn thì vui lòng bỏ qua email này.\n" +
                    " Bạn hãy sử dụng đường dẫn để khôi phục mật khẩu của mình: http://" + request.getServerName() + ":" + request.getServerPort() +
                    request.getContextPath() + "/forgot/" + token;
            String subject = "Khôi phục mật khẩu";
            mailService.sendActivationEmail(userCheck.getEmail(), subject, message, "Khôi phục mật khẩu","Khôi phục mật khẩu", "http://localhost:8080/forgot/" + token);
            ra.addFlashAttribute("successMsg", "Chúng tôi đã gửi một email để khôi phục mật khẩu của bạn!");
            return "redirect:/login";
        } else {
            ra.addFlashAttribute("msg", "Email không tồn tại trong hệ thống!");
            return "redirect:/forgot-password";
        }
    }

    // Hàm xác thực token để thực hiện đổi mật khẩu khi quên mật khẩu
    @GetMapping("/forgot/{token}")
    public String forgotPassword(@PathVariable("token") String token, Model model){
        User user = userService.findByToken(token);
        if (user != null && user.getIsActive()) {
            model.addAttribute("token", token);
            return "authentication/change-forgot-password";
        } else {
            model.addAttribute("errMsg", "Đã có lỗi!");
            return "redirect:/error";
        }
    }

    // Thực hiện thay đổi mật khẩu khi quên mật khẩu
    @PostMapping("/change-forgot-password")
    public String changeForgotPassword(User user, RedirectAttributes ra, Model model) {
        System.out.println("test: " + user);
        User userCheck = userService.findByToken(user.getToken());
        if (userCheck != null) {
            userCheck.setPassword(encryptMD5(user.getPassword()));
            userCheck.setToken(null);
            userService.saveUser(userCheck);
            ra.addFlashAttribute("successMsg", "Đổi mật khẩu thành công, vui lòng đăng nhập để sử dụng!");
            return "redirect:/login";
        } else {
            ra.addFlashAttribute("errMsg", "Đã có lỗi!");
            return "redirect:/error";
        }
    }

    // Đăng xuất
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }

    // Hàm thực hiện việc thay đổi mật khẩu
    @PostMapping("/change-password")
    public String changePassword(@RequestParam("currentPassword") String oldPassword, @RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword, HttpSession httpSession, RedirectAttributes ra) {
        if (!newPassword.equals(confirmPassword)) {
            ra.addFlashAttribute("errMsg", "Mật khẩu xác nhận không khớp!");
            return "redirect:/change-password";
        }
        User currentUser = (User) httpSession.getAttribute("user");
        User user = userService.getUserByUserID(currentUser.getUserID());
        if (user.getPassword().equals(encryptMD5(oldPassword))) {
            user.setPassword(encryptMD5(newPassword));
            userService.saveUser(user);
            ra.addFlashAttribute("msg", "Đổi mật khẩu thành công!");
            return "redirect:/";
        } else {
            ra.addFlashAttribute("errMsg", "Mật khẩu cũ không đúng!");
            return "redirect:/change-password";
        }
    }

    // Hàm mã hóa mật khẩu bằng thuật toán MD5
    public String encryptMD5(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(text.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            StringBuilder hashText = new StringBuilder(no.toString(16));
            while (hashText.length() < 32) {
                hashText.insert(0, "0");
            }
            return hashText.toString();
        }catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    // Hàm để gửi email kèm token để kích hoạt tài khoản hoặc quên mật khẩu

}
