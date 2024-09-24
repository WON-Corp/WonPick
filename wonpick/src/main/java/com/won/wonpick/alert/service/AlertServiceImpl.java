package com.won.wonpick.alert.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.alert.model.dao.AlertDao;
import com.won.wonpick.alert.model.vo.Alert;
import com.won.wonpick.setalert.model.vo.SetAlert;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AlertServiceImpl implements AlertService{
	
	private final SqlSessionTemplate sqlSession;
	private final AlertDao aDao;
	@Override
	public ArrayList<Alert> selectAlertList(String userId) {
		return aDao.selectAlertList(sqlSession, userId);
	}

}
