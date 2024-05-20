package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Getter
@Entity
@Setter
@Table(name = "tours")
public class Tour {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tourId;

    private String name;

    private String description;

    private String image;

    private String banner;

    private String price;

    private Date startDate;

    private Date endDate;

    private String transport;

    private String schedule;

    private boolean status = false;

    private Date createdAt;

    private int numberCustomer = 0;

    private Date updatedAt;

    private boolean isHot = false;

    @ManyToMany
    @JoinTable(
            name = "tour_location",
            joinColumns = @JoinColumn(name = "tourId"),
            inverseJoinColumns = @JoinColumn(name = "locationId")
    )
    private Set<Location> locations = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Review> reviews = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "enterpriseId")
    private Enterprise enterprise;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Discount> discounts = new HashSet<>();

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Booking> cashs = new HashSet<>();
}
