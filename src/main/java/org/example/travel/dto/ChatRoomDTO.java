package org.example.travel.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ChatRoomDTO {
    private Long id;
    private String name;
    private List<MessageDTO> messages;

}

