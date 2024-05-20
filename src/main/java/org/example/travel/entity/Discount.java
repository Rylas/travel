package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "discounts")
@Getter
@Setter
public class Discount implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long discountId;

    private String code;
    private LocalDateTime createdAt;
    private String description;
    private LocalDateTime expiredAt;
    private boolean status;
    private String type;
    private LocalDateTime updatedAt;
    private String value;

    @ManyToOne
    @JoinColumn(name = "enterpriseId", insertable = false, updatable = false)
    private Enterprise enterprise;

    @ManyToOne
    @JoinColumn(name = "tourId", insertable = false, updatable = false)
    private Tour tour;
}
