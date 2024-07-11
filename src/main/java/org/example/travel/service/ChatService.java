package org.example.travel.service;

import org.example.travel.dto.ChatRoomDTO;
import org.example.travel.mapper.ChatRoomMapper;
import org.example.travel.repository.ChatRoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ChatService {

    @Autowired
    private ChatRoomRepository chatRoomRepository;

    @Transactional(readOnly = true)
    public List<ChatRoomDTO> getAllChatRooms(long userID) {
        return chatRoomRepository.findByUserUserIDAndStatusTrue(userID).stream()
                .map(ChatRoomMapper::toDto)
                .collect(Collectors.toList());
    }
}

