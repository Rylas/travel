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
@Table(name = "enterprises")
public class Enterprise
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long enterpriseID;

    private String nameEnterprise;
    private String description;
    private String banner;
    private String logo;
    private String address;
    private String phone;
    private String email;
    private String website;
    private boolean status = false;
    private Date createdAt;
    private Date updatedAt;

    @OneToMany
    @JoinColumn(name = "enterpriseID")
    private Set<Discount> discounts = new HashSet<>();

    @OneToMany
    @JoinColumn(name = "enterpriseID")
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
