package org.example.travel.controller;

import org.example.travel.entity.Payment;
import org.example.travel.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

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
}
