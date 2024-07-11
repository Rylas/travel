package org.example.travel.entity;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@Setter
public class MessageResponseSocket {
    private String status;
    private String content;
    private String sender;
    private Timestamp timestamp;

}
