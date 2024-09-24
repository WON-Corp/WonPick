package com.won.wonpick.alert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.alert.model.vo.Alert;
import com.won.wonpick.setalert.model.vo.SetAlert;

@Repository	
public class AlertDao {

	public ArrayList<Alert> selectAlertList(SqlSessionTemplate sqlSession, String userId) {
		
		SetAlert setting = (SetAlert)sqlSession.selectOne("setAlertMapper.selectAlertList", userId);
		
		if(setting.getPostAlert().equals("Y")) {
			setting.setPostAlert("LIKE");
		};
		if(setting.getCommentAlert().equals("Y")) {
			setting.setCommentAlert("POST");
		};
		if(setting.getCommentLikeAlert().equals("Y")) {
			setting.setCommentLikeAlert("CLIK");
		};
		if(setting.getPickAlert().equals("Y")) {
			setting.setPickAlert("PICK");
		};
		System.out.println(setting);
		
		ArrayList list = (ArrayList)sqlSession.selectList("alertMapper.selectSaveList", setting);
		System.out.println(list);
		return list;
	}

}
