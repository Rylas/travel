package org.example.travel.service;

import org.example.travel.entity.Payment;
import org.example.travel.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    // Add payment
    public void addPayment(Payment payment) {
        paymentRepository.save(payment);
    }

    // Get payment by id
    public Payment getPaymentById(Long paymentID) {
        return paymentRepository
                .findById(paymentID)
                .orElse(null);
    }

    // Delete payment
    public void deletePayment(Long paymentID) {
        paymentRepository.deleteById(paymentID);
    }

    // Update payment
    public void updatePayment(Payment payment) {
        paymentRepository.save(payment);
    }

    // Get all payments
    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }
}
