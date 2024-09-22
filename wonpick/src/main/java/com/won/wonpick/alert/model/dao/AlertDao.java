package com.won.wonpick.alert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.alert.model.vo.Alert;

@Repository	
public class AlertDao {

	public ArrayList<Alert> selectAlertList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("alertMapper.selectSaveList", userId);
	}

}
