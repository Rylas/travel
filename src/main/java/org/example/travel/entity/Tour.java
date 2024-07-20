package org.example.travel.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDate;
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
    private int duration;
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
    private String linkVideo;
    private boolean isGroup = false;

    @ManyToOne
    @JoinColumn(name = "discountID")
    @JsonBackReference
    private Discount discount;

    @ManyToOne
    @JoinColumn(name = "enterpriseID")
    @JsonBackReference
    private Enterprise enterprise;

    @ManyToMany
    @JoinTable(
            name = "tour_location",
            joinColumns = @JoinColumn(name = "tourID"),
            inverseJoinColumns = @JoinColumn(name = "locationID")
    )
    @JsonBackReference
    private Set<Location> locations = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private Set<Booking> bookings = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private Set<Review> reviews = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonBackReference
    private Set<Schedule> schedules = new HashSet<>();

    @PrePersist
    protected void onCreate() {
        createdAt = new Date(System.currentTimeMillis());
        updatedAt = new Date(System.currentTimeMillis());
    }

    @PreUpdate
    protected void onUpdate() {

        updatedAt = new Date(System.currentTimeMillis());
        checkAndUpdateDepartureDate();
    }

    // Tự động cập nhập departureDate mỗi khi tới hạn duration (ngày)
    private void checkAndUpdateDepartureDate() {
        LocalDate now = LocalDate.now();
        if (departureDate != null && now.minusDays(duration).isAfter(departureDate.toLocalDate())) {
            departureDate = Date.valueOf(now.plusDays(1));
        }
    }

}
