package com.team.beatify.services;

import com.team.beatify.models.Message;
import com.team.beatify.repositories.BaseRepository;
import com.team.beatify.repositories.MessageRepository;

import org.springframework.stereotype.Service;

@Service
public class MessageService extends BaseService<Message> {

    private final MessageRepository messageRepository;

    public MessageService(BaseRepository<Message> baseRepository, MessageRepository messageRepository) {
        super(baseRepository);
        this.messageRepository = messageRepository;
    }
    
    
}
