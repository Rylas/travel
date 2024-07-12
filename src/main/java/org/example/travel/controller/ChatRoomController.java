package org.example.travel.controller;

import org.example.travel.entity.ChatRoom;
import org.example.travel.service.ChatRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ChatRoomController {
    @Autowired
    private ChatRoomService chatRoomService;
    @GetMapping("/admin/message")
    public String adminMessage(Model model) {
        List<ChatRoom> chatRooms = chatRoomService.getAllChatRooms();
        model.addAttribute("chatRoomList", chatRooms);
        return "admin/ChatAdmin";
    }
}
