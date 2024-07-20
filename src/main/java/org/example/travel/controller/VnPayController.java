package org.example.travel.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.example.travel.entity.Booking;
import org.example.travel.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("/payment")
public class VnPayController {
    @Autowired
    private PaymentService paymentService;

    @PostMapping("/pay")
    public ResponseEntity<Map<String, String>> processPayment(@RequestParam("amount") String amount,
                                                                @RequestParam("bankCode") String bankCode,
                                                                @RequestParam("language") String language,
                                                                @RequestParam("currency") String currency,
                                                              @RequestParam("bookingID") String bookingID,
                                                              HttpServletRequest req) throws IOException {

        if (Objects.equals(currency, "USD")) {
            float amountFloat = Float.parseFloat(amount);
            int amountInt = (int) (amountFloat * 25455);
            amount = String.valueOf(amountInt);
            currency = "VND";
            language = "en";
        }

        String paymentUrl = paymentService.getRequest(amount, bankCode, language, currency, Long.parseLong(bookingID), req);
        Map<String, String> response = new HashMap<>();
        response.put("code", "00");
        response.put("message", "success");
        response.put("data", paymentUrl);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/return")
    public ResponseEntity<Map<String, String>> vnpayReturn(
            @RequestParam String vnp_ResponseCode,
            @RequestParam String vnp_TransactionNo,
            @RequestParam String vnp_TxnRef,
            @RequestParam String vnp_OrderInfo,
            @RequestParam String vnp_Amount,
            @RequestParam String vnp_BankCode,
            @RequestParam String vnp_CardType,
            @RequestParam String vnp_PayDate,
            @RequestParam String vnp_TransactionStatus, Model model) {

        Map<String, String> response = new HashMap<>();
        response.put("vnp_ResponseCode", vnp_ResponseCode);
        response.put("vnp_TransactionNo", vnp_TransactionNo);
        response.put("vnp_TxnRef", vnp_TxnRef);
        response.put("vnp_OrderInfo", vnp_OrderInfo);
        response.put("vnp_Amount", vnp_Amount);
        response.put("vnp_BankCode", vnp_BankCode);
        response.put("vnp_CardType", vnp_CardType);
        response.put("vnp_PayDate", vnp_PayDate);
        response.put("vnp_TransactionStatus", vnp_TransactionStatus);
        model.addAttribute("response", response);

        return ResponseEntity.ok(response);
    }

}
