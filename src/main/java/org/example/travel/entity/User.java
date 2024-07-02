package org.example.travel.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

// Tạo một table có tên là users
@Getter
@Entity
@Setter
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userID;

    private String firstName;

    private String lastName;

    @Column(nullable = false, unique = true)
    private String email;

    private String password;

    private Boolean isActive = false;

    private String phone;

    private String avatar = "avatar-default.png";

    private String address;
    private String token;
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne
    @JoinColumn(name = "enterpriseID")
    private Enterprise enterprise;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Message> messages = new HashSet<>();

//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
//    private Set<Booking> bookings = new HashSet<>();
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Review> reviews = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "roleID")
    private Role role;
    public User() {
        this.role = new Role(3L, "user");
    }

    @OneToMany
    @JoinColumn(name = "userID")
    private Set<Booking> bookings = new HashSet<>();

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private Ban ban;


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

