package org.example.travel.controller;

import org.example.travel.dto.ChatRoomDTO;
import org.example.travel.entity.Location;
import org.example.travel.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ChatController {

    @Autowired
    private ChatService chatService;
    @Autowired
    private LocationService locationService;

    @GetMapping("/chat/rooms/{id}")
    public List<ChatRoomDTO> getAllChatRooms(@PathVariable long id) {
        try {
            return chatService.getAllChatRooms(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



}

