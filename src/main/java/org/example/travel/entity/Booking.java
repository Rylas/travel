package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bookingID;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String note;
    private Date departureDate;
    private Date expectedDate;
    private Date createdAt;
    private Date updatedAt;
    private Date canceledAt;
    private Date refundDate;
    private String status = "Pending";
    private int totalPrice;
    private int totalPeople;
    private int totalChildren6_10;
    private int totalChildren2_5;
    private int totalChildren2;
    private int totalAdults;



    @ManyToOne
    @JoinColumn(name = "paymentID")
    private Payment payment;

    @ManyToOne
    @JoinColumn(name = "tourID")
    private Tour tour;

    @ManyToOne
    @JoinColumn(name = "voucherCode")
    private Voucher voucherCode;

    @OneToMany(mappedBy = "booking")
    private List<BookingDetail> bookingDetails;

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    @ManyToOne
    @JoinColumn(name = "groupTourID")
    private GroupTour groupTour;

    @PrePersist
    protected void onCreate() {
        createdAt = new Date(System.currentTimeMillis());
        updatedAt = new Date(System.currentTimeMillis());
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date(System.currentTimeMillis());
    }
}
