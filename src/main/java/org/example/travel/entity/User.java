package org.example.travel.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

// Tạo một table có tên là users
@Getter
@Entity
@Setter
@Table(name = "users")
public class User {
    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;

    @Getter
    @Setter
    @Column(nullable = false)
    private String firstName;

    @Getter
    @Setter
    @Column(nullable = false)
    private String lastName;

    @Setter
    @Column(nullable = false, unique = true)
    private String email;

    @Setter
    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private Boolean isActive = false;

    @Getter
    @Setter
    @Column(nullable = false)
    private String phone;

    @Getter
    @Setter
    @Column
    private String avatar = "avatar-default.png";

    // Set default role is user
    @Getter
    @Setter
    @Column(nullable = false)
    private String role = "user";

    @Getter
    @Setter
    @Column(nullable = false)
    private String typeAccount = "user";

    private Date createdAt;
    private Date updatedAt;

    private String address;

    @Setter
    @Getter
    @Column(nullable = true)
    private String token;
    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    @ManyToOne
    @JoinColumn(name = "enterpriseId")
    private Enterprise enterprise;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Message> messages = new HashSet<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Booking> cashs = new HashSet<>();


    public User(){

    }

    public User(String id, String email, String firstName, String lastName, String password) {
        this.userId = Long.parseLong(id);
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + userId +
                ", name='" + firstName + " " + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
            ", isActive=" + isActive +
                ", avatar='" + avatar + '\'' +
                ", role='" + role + '\'' +
                ", token='" + token + '\'' +
                '}';
    }

    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
        updatedAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }
}

