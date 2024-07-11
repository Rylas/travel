package org.example.travel.controller;

import jakarta.servlet.http.HttpSession;
import org.example.travel.dto.ChatRoomDTO;
import org.example.travel.entity.ChatRoom;
import org.example.travel.entity.Message;
import org.example.travel.entity.User;
import org.example.travel.service.ChatRoomService;
import org.example.travel.service.ChatService;
import org.example.travel.service.MessageService;
import org.example.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@RestController
@RequestMapping("/api/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @GetMapping("/rooms/{id}")
    public List<ChatRoomDTO> getAllChatRooms(@PathVariable long id) {
        try {
            return chatService.getAllChatRooms(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}

