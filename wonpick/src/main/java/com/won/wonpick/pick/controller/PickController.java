package com.won.wonpick.pick.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.won.wonpick.pick.model.vo.Pick;
import com.won.wonpick.pick.service.PickService;

@Controller
@RequestMapping("/pick")
public class PickController {
	
	private final PickService pService;
	
	@Autowired
	public PickController(PickService pService) {
		this.pService = pService;
	}
	
	@ResponseBody
	@RequestMapping("/pick")
	public int pick(Pick p, HttpSession session) {		// 전달 해야함
		
		int selectMypick = pService.selectMyPick(p);
		
		if(selectMypick == 0) {
			pService.insertPick(p);
			int selectPick = pService.selectPick(p);
			
			
			return selectPick;
		}else{
			
			pService.deletePick(p);
			int selectPick = pService.selectPick(p);
			return selectPick;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/selectPicked")
	public int selectPicked(Pick p, HttpSession session) {
		int selectPicked = pService.selectPicked(p);
		return selectPicked;
	}
	@ResponseBody
	@RequestMapping("/selectPick")
	public int selectPick(Pick p, HttpSession session) {
		int selectPick = pService.selectPick(p);
		return selectPick;
	}
}
