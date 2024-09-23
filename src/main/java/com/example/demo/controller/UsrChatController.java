package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ChatService;
import com.example.demo.vo.Chat;

@Controller
public class UsrChatController {

    @Autowired
    private ChatService chatService;

    // 채팅 내용 추가
    @RequestMapping("/usr/chat/write")
    @ResponseBody
    public void write(int loginedMemberId, String body) {
        chatService.write(loginedMemberId, body); // 데이터베이스에 저장 후, WebSocket을 통해 클라이언트에 전송
    }
}