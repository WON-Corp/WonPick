package com.won.wonpick.notification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notification")
public class NotificationController {

    
    @RequestMapping("/notification")
    public String messagePage() {
        return "notification/notification";
    }
}