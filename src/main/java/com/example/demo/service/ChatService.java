package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.WebSocket.WebSocketChatHandler;
import com.example.demo.repository.ChatRepository;
import com.example.demo.vo.Chat;

@Service
public class ChatService {

    @Autowired
    private ChatRepository chatRepository;

    @Autowired
    private WebSocketChatHandler webSocketChatHandler; // WebSocket 핸들러 주입

    public List<Chat> chatList() {
        return chatRepository.chatList();
    }

    // 채팅 내용을 데이터베이스에 저장하고 WebSocket 클라이언트에게 전송
    public void write(int loginedMemberId, String body) {
        chatRepository.write(loginedMemberId, body); // 데이터베이스에 채팅 메시지 저장
        Chat newChat = chatRepository.update(); // 새로운 채팅 메시지 가져오기

        // 새로운 채팅 메시지를 모든 WebSocket 클라이언트에 전송
        webSocketChatHandler.sendMessageToAllSessions(newChat);
    }
}