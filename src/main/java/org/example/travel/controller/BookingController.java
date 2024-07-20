package org.example.travel.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.example.travel.entity.*;
import org.example.travel.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Controller
public class BookingController {
    @Autowired
    private BookingService bookingService;

    @Autowired
    private TourService tourService;

    @Autowired
    private MailService mailService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private VoucherService voucherService;

    @Autowired
    private EnterpriseService enterpriseService;

    @Autowired
    private GroupTourService groupTourService;


    @GetMapping("/bookTour/{id}")
    public String bookTour(@PathVariable("id") long id, Model model, HttpSession session, RedirectAttributes ra) {
        if (session.getAttribute("user") == null) {
            ra.addFlashAttribute("errorMsg", "Bạn cần đăng nhập để sử dụng chức năng này!");
            return "redirect:/login";
        }
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("tour", tourService.getTourByTourID(id));
        model.addAttribute("payments", paymentService.getAllPayments());
        return "tour/book-tour";
    }



    // Thực hiện việc booking
    @PostMapping("/bookTour/{id}")
    public ResponseEntity<Map<String, String>> handleBookTour(RedirectAttributes ra, @RequestParam("tourID") String tourID,
                                                              @RequestParam("voucher") String voucherCode, @RequestParam("paymentID") long paymentID, Booking booking, Model model, HttpSession session) {
        // Lưu người dùng book tour
        User user = (User) session.getAttribute("user");
        if (user == null) {
            ra.addFlashAttribute("errorMsg", "Bạn cần đăng nhập để sử dụng chức năng này!");
            return ResponseEntity.ok(Map.of("status", "0", "message", "Bạn cần đăng nhập để sử dụng chức năng này!"));
        }

        LocalDate departureDate = booking.getDepartureDate().toLocalDate();
        LocalDate expectedDate = booking.getExpectedDate().toLocalDate();
        if (departureDate.isBefore(LocalDate.now())) {
            return ResponseEntity.ok(Map.of("status", "0", "message", "Ngày khởi hành không hợp lệ!"));
        }

        if (expectedDate.isBefore(LocalDate.now())) {
            return ResponseEntity.ok(Map.of("status", "0", "message", "Ngày trở về không hợp lệ!"));
        }

        if (departureDate.isAfter(expectedDate)) {
            return ResponseEntity.ok(Map.of("status", "0", "message", "Ngày khởi hành không thể sau ngày trở về!"));
        }



        booking.setUser(user);
        booking.setPayment(paymentService.getPaymentById(paymentID));
        int totalPeople = booking.getTotalAdults() + booking.getTotalChildren2() + booking.getTotalChildren2_5() + booking.getTotalChildren6_10();
        if (totalPeople == 0) {
            return ResponseEntity.ok(Map.of("status", "0", "message", "Số người không hợp lệ!"));
        }
        if (totalPeople > tourService.getTourByTourID(Long.parseLong(tourID)).getMaxPeople()) {
            return ResponseEntity.ok(Map.of("status", "0", "message", "Số người vượt quá số lượng cho phép!"));
        }
        booking.setTotalPeople(totalPeople);
        // Lưu tour được book
        tourService.incCustomer(Long.parseLong(tourID), totalPeople);
        Voucher voucher = voucherService.getVoucherByVoucherCode(voucherCode);
        booking.setVoucherCode(voucher);
        Tour tour = tourService.getTourByTourID(Long.parseLong(tourID));
        booking.setTour(tour);
        int totalAmount = getTotalAmount(booking, tour, voucher);
        booking.setTotalPrice(totalAmount);
        booking.setStatus("Unpaid");
        Booking newBooking = bookingService.addBooking(booking);
        return ResponseEntity.ok(Map.of("status", "1", "message", "Đặt tour thành công, vui lòng thanh toán!", "bookingID", newBooking.getBookingID().toString()));
    }

    @GetMapping("/booking/edit")
    public String editBooking(@RequestParam("id") Long id, Model model){
        Booking booking = bookingService.getBookingById(id);
        Tour tour = booking.getTour();
        model.addAttribute("tour", tour);
        model.addAttribute("booking", bookingService.getBookingById(id));
        model.addAttribute("payments", paymentService.getAllPayments());
        return "booking/edit";
    }

    @PostMapping("/booking/edit")
    public String handleEditBooking(@RequestParam("voucher") String voucherCode, Booking booking){
        Voucher voucher = voucherService.getVoucherByVoucherCode(voucherCode);
        Booking oldBooking = bookingService.getBookingById(booking.getBookingID());
        oldBooking.setTotalAdults(booking.getTotalAdults());
        oldBooking.setTotalChildren2(booking.getTotalChildren2());
        oldBooking.setTotalChildren2_5(booking.getTotalChildren2_5());
        oldBooking.setTotalChildren6_10(booking.getTotalChildren6_10());
        oldBooking.setTotalPeople(booking.getTotalAdults() + booking.getTotalChildren2() + booking.getTotalChildren2_5() + booking.getTotalChildren6_10());
        oldBooking.setVoucherCode(voucher);
        oldBooking.setName(booking.getName());
        oldBooking.setEmail(booking.getEmail());
        oldBooking.setPhone(booking.getPhone());
        oldBooking.setAddress(booking.getAddress());
        oldBooking.setNote(booking.getNote());
        oldBooking.setDepartureDate(booking.getDepartureDate());
        oldBooking.setExpectedDate(booking.getExpectedDate());
        oldBooking.setPayment(booking.getPayment());
        Tour tour = tourService.getTourByTourID(oldBooking.getTour().getTourID());

        int totalAmount = getTotalAmount(booking, tour, voucher);
        oldBooking.setTotalPrice(totalAmount);

        bookingService.updateBooking(oldBooking);
        return "redirect:/cash";
    }

    private static int getTotalAmount(Booking booking, Tour tour, Voucher voucher) {
        int totalAmount = booking.getTotalAdults() * tour.getPriceAdult() + booking.getTotalChildren2() * tour.getPriceChild2() + booking.getTotalChildren2_5() * tour.getPriceChild2_5() + booking.getTotalChildren6_10() * tour.getPriceChild6_10();
        if (voucher != null) {
            int discount = 0;
            if (!voucher.isTypeSale()){
                discount = voucher.getValue();
            } else {
                discount = totalAmount * voucher.getValue() / 100;
            }
            if (discount > voucher.getMaxDesValue()){
                discount = voucher.getMaxDesValue();
            }
            totalAmount -= discount;
        }
        return totalAmount;
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

    @GetMapping("/enterprise/booking")
    public String enterpriseBookingPage(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        Enterprise enterprise = enterpriseService.getEnterpriseById(user.getEnterprise().getEnterpriseID());
        if (enterprise == null){
            return "redirect:/";
        }
        model.addAttribute("bookings", bookingService.getBookingsByEnterprise(enterprise.getEnterpriseID()));
        return "enterprise/booking";
    }

    @GetMapping("/admin/booking/detail/{id}")
    public String bookingDetail(@PathVariable("id") Long id, Model model){
        model.addAttribute("booking", bookingService.getBookingById(id));
        return "booking/detail";
    }

    @GetMapping("/admin/booking/delete")
    public String deleteBooking(@RequestParam("id") Long id){
        String mailAddress = bookingService.getBookingById(id).getUser().getEmail();
        String subject = "Thông báo hủy đơn đặt tour";
        String message = "Đơn đặt tour của bạn đã bị hủy! Thông tin tour: " + bookingService.getBookingById(id).getTour().getNameTour();
        mailService.sendActivationEmail(mailAddress, subject, message, "Thông Báo Hủy Tour","Xem chi tiết", "http://localhost:8080/booking/detail/" + id);
        bookingService.deleteBooking(id);
        return "redirect:/admin/booking";
    }

    @GetMapping("/admin/booking/approve")
    public String approveBooking(@RequestParam("id") Long id){
        String mailAddress = bookingService.getBookingById(id).getUser().getEmail();
        String subject = "Thông báo xác nhận đơn đặt tour";
        String message = "Đơn đặt tour của bạn đã được xác nhận! Thông tin tour: " + bookingService.getBookingById(id).getTour().getNameTour();
        mailService.sendActivationEmail(mailAddress, subject, message, "Thông Báo Xác Nhận","Xem chi tiết", "http://localhost:8080/booking/detail/" + id);
        Booking booking = bookingService.getBookingById(id);
        booking.setStatus("Approved");
        List<GroupTour> groupTours = groupTourService.getGroupTourByTourTourIDAndStatus(bookingService.getBookingById(id).getTour().getTourID(), "Waiting");
        if (groupTours.isEmpty()){
            GroupTour groupTour = new GroupTour();
            groupTour.setTour(booking.getTour());
            groupTour.setEnterprise(booking.getTour().getEnterprise());
            groupTour.setStartDate(booking.getDepartureDate());
            groupTour.setEndDate(booking.getExpectedDate());
            if(booking.getTour().isGroup()){
                groupTour.setMaxPeople(booking.getTour().getMaxPeople());
            } else {
                groupTour.setMaxPeople(booking.getTotalPeople());
            }
            groupTour.setCurrentPeople(booking.getTotalPeople());
            groupTour.setStatus("Waiting");
            groupTourService.updateGroupTour(groupTour);
            booking.setGroupTour(groupTour);
            bookingService.updateBooking(booking);
        } else {
            for (GroupTour groupTour : groupTours){
                if (groupTour.getCurrentPeople() + booking.getTotalPeople() <= groupTour.getMaxPeople()){
                    if (groupTour.getCurrentPeople() + booking.getTotalPeople() == groupTour.getMaxPeople()){
                        groupTour.setStatus("In Process");
                    }
                    groupTour.setCurrentPeople(groupTour.getCurrentPeople() + booking.getTotalPeople());

                    booking.setGroupTour(groupTour);

                    bookingService.updateBooking(booking);
                    groupTourService.updateGroupTour(groupTour);
                    break;
                }
            }
        }
        return "redirect:/admin/booking";
    }

    @GetMapping("/admin/booking/cancel")
    public String cancelBookingAdmin(@RequestParam("id") Long id){
        String mailAddress = bookingService.getBookingById(id).getUser().getEmail();
        String subject = "Thông báo hủy đơn đặt tour";
        String message = "Đơn đặt tour của bạn đã bị hủy! Thông tin tour: " + bookingService.getBookingById(id).getTour().getNameTour();
        mailService.sendActivationEmail(mailAddress, subject, message, "Thông Báo Hủy Tour","Xem chi tiết", "http://localhost:8080/booking/detail/" + id);
        bookingService.cancelBooking(id);
        return "redirect:/admin/booking";
    }

    @GetMapping("/admin/booking/pending")
    public String pendingBookingAdmin(@RequestParam("id") Long id) {
        String mailAddress = bookingService.getBookingById(id).getUser().getEmail();
        String subject = "Thông báo đơn đặt tour đang chờ xác nhận";
        String message = "Đơn đặt tour của bạn đang chờ xác nhận! Thông tin tour: " + bookingService.getBookingById(id).getTour().getNameTour();
        mailService.sendActivationEmail(mailAddress, subject, message, "Thông Báo Đang Chờ Xác Nhận","Xem chi tiết", "http://localhost:8080/booking/detail/" + id);
        bookingService.pendingBooking(id);
        return "redirect:/admin/booking";

    }
}
