package org.example.travel.controller;

import org.example.travel.entity.*;
import org.example.travel.service.ChatRoomService;
import org.example.travel.service.MessageService;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

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

    //Get all messages from the chat room
//    @MessageMapping("/chat/getMessages")
//    @SendTo("/topic/messages")


    @MessageMapping("/chat")
    public void sendMessage(ChatMessage chatMessage) {
        MessageResponseSocket messageResponseSocket = new MessageResponseSocket();
        if (chatMessage.getSenderID() == null) {
            messageResponseSocket.setStatus("error");
            messageResponseSocket.setContent("You must login to chat");
            messagingTemplate.convertAndSendToUser(chatMessage.getSenderID().toString(), "/queue/messages", messageResponseSocket);
            return;
        }
        User sender = userService.getUserByUserID(chatMessage.getSenderID());
        User receiver = userService.getUserByUserID(chatMessage.getUserID());
        if (sender == null || receiver == null) {
            messageResponseSocket.setStatus("error");
            messageResponseSocket.setContent("User not found");
            messagingTemplate.convertAndSendToUser(chatMessage.getSenderID().toString(), "/queue/messages", messageResponseSocket);
            return;
        }
        Message message = new Message();
        message.setContent(chatMessage.getContent());
        ChatRoom chatRoom = chatRoomService.getChatRoomByUserIDAndStatusTrue(receiver.getUserID());
        if (chatRoom == null) {
            chatRoom = new ChatRoom();
            chatRoom.setUser(receiver);
            chatRoomService.saveChatRoom(chatRoom);
        }
        message.setChatRoom(chatRoom);
        message.setUser(receiver);
        messageService.saveMessage(message);
        messageResponseSocket.setStatus("success");
        messageResponseSocket.setContent(message.getContent());
        messageResponseSocket.setTimestamp(message.getTimestamp());
        messageResponseSocket.setSender(message.getUser().getFirstName() + " " + message.getUser().getLastName());

        // Gửi tin nhắn đến người nhận
        if (Objects.equals(chatMessage.getSenderID(), chatMessage.getUserID())) {
            messagingTemplate.convertAndSendToUser("1", "/queue/messages", messageResponseSocket);
        } else {
            messagingTemplate.convertAndSendToUser(chatMessage.getUserID().toString(), "/queue/messages", messageResponseSocket);
        }
    }
}
