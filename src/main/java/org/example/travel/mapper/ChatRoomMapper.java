package org.example.travel.mapper;

import org.example.travel.dto.ChatRoomDTO;
import org.example.travel.entity.ChatRoom;

import java.util.stream.Collectors;

public class ChatRoomMapper {
    public static ChatRoomDTO toDto(ChatRoom chatRoom) {
        ChatRoomDTO chatRoomDTO = new ChatRoomDTO();
        chatRoomDTO.setId(chatRoom.getChatRoomID());
        chatRoomDTO.setName(chatRoom.getUser().getFirstName() + " " + chatRoom.getUser().getLastName());
        chatRoomDTO.setMessages(
                chatRoom.getMessages().stream()
                        .map(MessageMapper::toDto)
                        .collect(Collectors.toList())
        );
        return chatRoomDTO;
    }
}

