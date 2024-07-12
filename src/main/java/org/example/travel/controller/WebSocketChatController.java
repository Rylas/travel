package org.example.travel.controller;

import org.example.travel.dto.MessageDTO;
import org.example.travel.entity.*;
import org.example.travel.service.ChatRoomService;
import org.example.travel.service.MessageService;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@Controller
public class WebSocketChatController {
    @Autowired
    private MessageService messageService;
    @Autowired
    private ChatRoomService chatRoomService;
    @Autowired
    private UserService userService;
    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    // Send message to the admin or user
    @MessageMapping("/chat")
    @SendToUser("/queue/messages")
    public void send(MessageDTO message) throws Exception {
        ChatRoom chatRoom = chatRoomService.getChatRoomByID(message.getSenderID());
        if (chatRoom == null) {
            chatRoom = new ChatRoom();
            chatRoom.setUser(userService.getUserByUserID(message.getSenderID()));
            chatRoom.setAdmin(userService.getUserByUserID(1L));
            chatRoom = chatRoomService.saveChatRoom(chatRoom);
        }
        Message newMessage = new Message();
        newMessage.setTimestamp(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())));
        newMessage.setContent(message.getContent());
        newMessage.setUser(userService.getUserByUserID(message.getSenderID()));
        newMessage.setChatRoom(chatRoom);
        messageService.saveMessage(newMessage);

        // Gửi tin nhắn tới người nhận
        messagingTemplate.convertAndSendToUser(message.getSender(), "/queue/messages", message);
    }


}
