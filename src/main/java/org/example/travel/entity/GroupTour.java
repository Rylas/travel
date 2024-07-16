package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "group_tours")
public class GroupTour {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long groupTourID;
    private Boolean status;
    private Date startDate;
    private Date endDate;
    private int maxPeople;
    private int currentPeople;
    private int price;
    private Date createdAt;
    private Date updatedAt;


    @ManyToOne
    @JoinColumn(name = "tourID")
    private Tour tour;

    @ManyToOne
    @JoinColumn(name = "enterpriseID")
    private Enterprise enterprise;

    @OneToMany(mappedBy = "groupTour", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Booking> bookings = new HashSet<>();

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
