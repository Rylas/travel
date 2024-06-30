package org.example.travel.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Time;

@Entity
@Getter
@Setter
@Table(name = "schedules")
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduleID;
    private Time timeStart;
    private Time timeEnd;
    private Date date;
    private String title;
    private String description;

    @ManyToOne
    @JoinColumn(name = "tourID")
    private Tour tour;

    @ManyToOne
    @JoinColumn(name = "locationID")
    private Location location;
}
