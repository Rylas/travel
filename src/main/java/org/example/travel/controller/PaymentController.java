package org.example.travel.controller;

import org.example.travel.entity.Booking;
import org.example.travel.entity.Payment;
import org.example.travel.service.BookingService;
import org.example.travel.service.PaymentService;
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
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @Autowired
    private BookingService bookingService;

    @GetMapping("/admin/payment")
    public String payment(Model model) {
        List<Payment> payments = paymentService.getAllPayments();
        model.addAttribute("payments", payments);
        return "payment/listPayment";
    }

    @GetMapping("/admin/payment/add")
    public String addPayment() {
        return "payment/add";
    }

    @GetMapping("/admin/payment/edit")
    public String editPayment(Model model, @RequestParam("id") Long id){
        model.addAttribute("payment", paymentService.getPaymentById(id));
        return "payment/edit";
    }

    @PostMapping("/admin/payment/add")
    public String processAdd(Payment payment) {
        paymentService.addPayment(payment);
        return "payment/add";
    }

    @PostMapping("/admin/payment/update")
    public String processEdit(Payment payment) {
        paymentService.updatePayment(payment);
        return "redirect:/admin/payment";
    }

    @GetMapping("/admin/payment/delete")
    public String deletePayment(@RequestParam("id") Long id) {
        paymentService.deletePayment(id);
        return "redirect:/admin/payment";
    }

    @GetMapping("/payment/result")
    public String paymentResult(
            @RequestParam("vnp_Amount") String amount,
            @RequestParam("vnp_BankCode") String bankCode,
            @RequestParam("vnp_CardType") String cardType,
            @RequestParam("vnp_OrderInfo") String orderInfo,
            @RequestParam("vnp_PayDate") String payDate,
            @RequestParam("vnp_ResponseCode") String responseCode,
            @RequestParam("vnp_TmnCode") String tmnCode,
            @RequestParam("vnp_TransactionNo") String transactionNo,
            @RequestParam("vnp_TransactionStatus") String transactionStatus,
            @RequestParam("vnp_TxnRef") String txnRef,
            @RequestParam("vnp_SecureHash") String secureHash,
            @RequestParam("bookingID") Long bookingID,
            RedirectAttributes ra
    ) {
        if (Objects.equals(responseCode, "00")) {
            Booking booking = bookingService.getBookingById(bookingID);
            booking.setStatus("Pending");
            bookingService.updateBooking(booking);
            ra.addFlashAttribute("successMsg", "Payment success!");
            return "redirect:/cash";
        }
        ra.addFlashAttribute("errorMsg", "Payment failed!");
        return "redirect:/cash";
    }

}
