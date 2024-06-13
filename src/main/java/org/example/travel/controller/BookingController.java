package org.example.travel.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.Booking;
import org.example.travel.entity.Tour;
import org.example.travel.entity.User;
import org.example.travel.service.BookingService;
import org.example.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;

@Controller
public class BookingController {
    @Autowired
    private BookingService bookingService;

    @Autowired
    private TourService tourService;

    @Autowired
    private JavaMailSender javaMailSender;


    @GetMapping("/bookTour/{id}")
    public String bookTour(@PathVariable("id") int id, Model model, HttpSession session) {
        if (session.getAttribute("user") == null) {
            model.addAttribute("errorMsg", "You need to login to use this feature!");
            return "redirect:/login";
        }
        model.addAttribute("tour", tourService.getTourById((long) id));
        return "tour/book-tour";
    }

    // Thực hiện việc booking
    @PostMapping("/bookTour")
    public String handleBookTour(@RequestParam("tourId") String tourId, Booking booking, Model model, HttpSession session) {
        // Lưu người dùng book tour
        User user = (User) session.getAttribute("user");
        booking.setUser(user);
        // Lưu tour được book
        tourService.incCustomer(Long.parseLong(tourId));
        Tour tour = tourService.getTourById(Long.parseLong(tourId));
        booking.setTour(tour);
        int price = Integer.parseInt(tour.getPrice());
        int totalAmount = booking.getNumberOfPeople() * price;
        booking.setTotalAmount(totalAmount);
        bookingService.addBooking(booking);
        model.addAttribute("message", "Booking successfully!");
        return "redirect:/cash";
    }

    @GetMapping("/booking/edit")
    public String editBooking(@RequestParam("id") Long id, Model model){
        model.addAttribute("booking", bookingService.getBookingById(id));
        return "booking/edit";
    }

    @PostMapping("/booking/edit")
    public String handleEditBooking(Booking booking){
        bookingService.addBooking(booking);
        return "redirect:/cash";
    }

    @GetMapping("/booking/cancel")
    public String cancelBooking(@RequestParam("id") Long id){
        // Set cancel date
        bookingService.setCancelDate(id);
        bookingService.cancelBooking(id);
        return "redirect:/cash";
    }


    // Admin

    @GetMapping("/admin/booking")
    public String cashPage(Model model){
        model.addAttribute("bookings", bookingService.getAllBookings());
        return "booking/admin-list";
    }

    @GetMapping("/admin/booking/detail/{id}")
    public String bookingDetail(@PathVariable("id") Long id, Model model){
        model.addAttribute("booking", bookingService.getBookingById(id));
        return "booking/detail";
    }

    @GetMapping("/admin/booking/delete")
    public String deleteBooking(@RequestParam("id") Long id){
        sendActivationEmail(bookingService.getBookingById(id).getUser().getEmail(),
                "Đơn đặt tour của bạn đã bị hủy! Thông tin tour: " + bookingService.getBookingById(id).getTour().getName());
        bookingService.deleteBooking(id);
        return "redirect:/admin/booking";
    }

    @GetMapping("/admin/booking/approve")
    public String approveBooking(@RequestParam("id") Long id){
        sendActivationEmail(bookingService.getBookingById(id).getUser().getEmail(),
                "Bạn đã đặt tour thành công! Thông tin tour: " + bookingService.getBookingById(id).getTour().getName());
        bookingService.approveBooking(id);
        return "redirect:/admin/booking";
    }

    private void sendActivationEmail(String mail, String msg) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(mail);
        message.setSubject("Kích hoạt tài khoản");
        message.setText(msg);
        javaMailSender.send(message);
    }
}
