package org.example.travel.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "booking_details")
public class BookingDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bookingDetailID;
    private String nameParticipant;
    private boolean gender;
    private int age;

    @ManyToOne
    @JoinColumn(name = "bookingID")
    private Booking booking;
}
