package com.won.wonpick.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message")
public class MessageController {

    
    @RequestMapping("/message")
    public String messagePage() {
        return "message/message";
    }
}