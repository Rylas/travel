package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "discounts")
@Getter
@Setter
public class Discount implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long discountID;

    private int discountPercentage;
    private Date startDate;
    private Date endDate;
    private boolean status = true;
    private Date createdAt;
    private Date updatedAt;
    private String descriptionDiscount;

    @ManyToOne
    @JoinColumn(name = "enterpriseID", insertable = false, updatable = false)
    private Enterprise enterprise;

    @OneToMany(mappedBy = "discount")
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
