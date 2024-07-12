package org.example.travel.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessage {
    private String content;
    private Long userID;
    private Long senderID;
}
