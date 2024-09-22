package com.won.wonpick.alert.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.won.wonpick.alert.model.vo.Alert;
import com.won.wonpick.alert.service.AlertService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/alert")
public class AlertController {
	
	private final AlertService aService;
	
	 @RequestMapping("/notification")
	    public String messagePage() {
	        return "notification/notification";
	    }
	
	@ResponseBody
	@RequestMapping(value="/alertList", produces="application/json;charset=UTF-8")
	public String selectAlertList(String userId) {
		ArrayList<Alert> list = aService.selectAlertList(userId);
		
		return new Gson().toJson(list);
	}
	

}
