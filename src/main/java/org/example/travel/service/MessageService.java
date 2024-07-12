package org.example.travel.service;

import org.example.travel.entity.Message;
import org.example.travel.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    public void saveMessage(Message message) {
        messageRepository.save(message);
    }
}
