package org.example.travel.mapper;

import org.example.travel.dto.MessageDTO;
import org.example.travel.entity.Message;

public class MessageMapper {
    public static MessageDTO toDto(Message message) {
        MessageDTO messageDTO = new MessageDTO();
        messageDTO.setId(message.getMessageID());
        messageDTO.setContent(message.getContent());
        messageDTO.setSender(message.getUser().getFirstName() + " " + message.getUser().getLastName());
        // Format the timestamp to HH:mm:ss dd-MM-yyyy
        String timestamp = message.getTimestamp().toString();
        messageDTO.setTimestamp(timestamp.substring(11, 19) + " " + timestamp.substring(8, 10) + "-" + timestamp.substring(5, 7) + "-" + timestamp.substring(0, 4));
        messageDTO.setRole(message.getUser().getRole().getRoleName());
        return messageDTO;
    }
}
