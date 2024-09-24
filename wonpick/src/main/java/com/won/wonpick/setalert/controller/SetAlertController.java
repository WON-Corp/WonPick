package com.won.wonpick.setalert.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.setalert.model.vo.SetAlert;
import com.won.wonpick.setalert.service.SetAlertService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/setalert")
public class SetAlertController {

	private final SetAlertService setAlertService;


	@RequestMapping("/settings")
	public String alertSettings(HttpSession session, Model model) {
	    Member currentMember = (Member) session.getAttribute("loginUser");

	    if (currentMember == null) {
	        return "redirect:/";
	    }

	    SetAlert setAlert = setAlertService.getAlertSettings(currentMember.getUserId());
	    model.addAttribute("setAlert", setAlert);
	    return "option/setAlert";
	}

	

    @ResponseBody
    @RequestMapping(value="/alertList", produces="application/json;charset=UTF-8")
    public String selectAlertList(String userId) {
        ArrayList<SetAlert> list = setAlertService.selectAlertList(userId);

        return new Gson().toJson(list);
    }

    @ResponseBody
    @RequestMapping("/update")
    public String updateAlertSettings(SetAlert setAlert, HttpSession session) {
    	Member currentMember = (Member) session.getAttribute("loginUser");

        if (currentMember == null) {
            return "redirect:/";
        }

        setAlert.setUserId(currentMember.getUserId());

        int result = setAlertService.updateAlertSettings(setAlert);
        return result > 0 ? "Success" : "Failed";
    }
}
