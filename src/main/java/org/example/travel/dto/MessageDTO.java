package org.example.travel.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDTO {
    private Long id;
    private String content;
    private String sender;
    private Long senderID;
    private String role;
    private String timestamp;
}

