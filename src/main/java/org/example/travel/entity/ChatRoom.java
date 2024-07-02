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
@Table(name = "chat_rooms")
public class ChatRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long chatRoomID;
    private boolean status = true;
    private Date createdAt;

    @OneToMany
    @JoinColumn(name = "chatRoomID")
    private Set<Message> messages = new HashSet<>();

    // User and admin
    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    @ManyToOne
    @JoinColumn(name = "adminID")
    private User admin;

    @PrePersist
    protected void onCreate() {
        createdAt = new Date(System.currentTimeMillis());
    }
}
