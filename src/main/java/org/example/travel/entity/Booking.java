package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cglib.core.Local;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private LocalDateTime bookingDate;
    private int numberOfPeople;
    private double totalAmount;
    private String message;
    private boolean status;
    private String phone;
    private String email;
    private String paymentMethod;
    private LocalDateTime paymentDate;
    private LocalDateTime cancelDate;
    private LocalDateTime refundDate;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String voucher;


    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @ManyToOne
    @JoinColumn(name = "tourId")
    private Tour tour;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Payment> payments = new HashSet<>();
}
