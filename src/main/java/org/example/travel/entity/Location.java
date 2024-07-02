package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "locations")
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long locationID;
    private String nameLocation;
    private String description;
    private String banner;

    private String firstImage;
    private String secondImage;
    private String thirdImage;
    private boolean status = false;
    private boolean isHot = false;
    private int numberViewed = 0;
    private Date createdAt;
    private Date updatedAt;

//    @OneToMany(mappedBy = "location", cascade = CascadeType.ALL, orphanRemoval = true)
//    private Set<Review> reviews = new HashSet<>();

    @ManyToMany(mappedBy = "locations")
    private Set<Tour> tours = new HashSet<>();

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
