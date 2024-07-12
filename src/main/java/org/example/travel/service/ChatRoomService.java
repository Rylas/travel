package org.example.travel.service;

import org.example.travel.entity.ChatRoom;
import org.example.travel.repository.ChatRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatRoomService {
    @Autowired
    private ChatRoomRepository chatRoomRepository;

    public ChatRoom getChatRoomByUserIDAndStatusTrue(Long userID) {
        return chatRoomRepository.findByUserIDAndStatusTrue(userID);
    }

    public ChatRoom saveChatRoom(ChatRoom chatRoom) {
        return chatRoomRepository.save(chatRoom);
    }

    public ChatRoom getChatRoomByID(Long chatRoomID) {
        return chatRoomRepository.findById(chatRoomID).orElse(null);
    }

    // getAllChatRooms
    public List<ChatRoom> getAllChatRooms() {
        return chatRoomRepository.findAll();
    }
}
