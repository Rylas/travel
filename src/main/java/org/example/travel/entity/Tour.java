package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Getter
@Entity
@Setter
@Table(name = "tours")
public class Tour {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tourID;

    private String nameTour;
    private String description;
    private String banner;
    private String firstImage;
    private String secondImage;
    private String thirdImage;
    private Date departureDate;
    private Date expectedDate;
    private int priceAdult;
    private int priceChild6_10;
    private int priceChild2_5;
    private int priceChild2;
    private int maxPeople;
    private int minPeople;
    private boolean status = false;
    private String transport;
    private int numberBooked;
    private int numberViewed;
    private boolean isHot = false;
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne
    @JoinColumn(name = "discountID")
    private Discount discount;

    @ManyToOne
    @JoinColumn(name = "enterpriseID")
    private Enterprise enterprise;

    @ManyToMany
    @JoinTable(
            name = "tour_location",
            joinColumns = @JoinColumn(name = "tourID"),
            inverseJoinColumns = @JoinColumn(name = "locationID")
    )
    private Set<Location> locations = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Booking> bookings = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Review> reviews = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Schedule> schedules = new HashSet<>();

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
