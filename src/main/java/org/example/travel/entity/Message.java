package org.example.travel.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "messages")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long messageID;
    private String content;
    private Timestamp timestamp;

    @ManyToOne
    @JoinColumn(name = "chatRoomID")
    private ChatRoom chatRoom;

    @ManyToOne
    @JoinColumn(name = "userID")
    private User user;

    @PrePersist
    protected void onCreate() {
        timestamp = Timestamp.valueOf(LocalDateTime.now());
    }
}
