package com.won.wonpick.setalert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.setalert.model.vo.SetAlert;

@Repository
public class SetAlertDao {

	 public int updateAlertSettings(SqlSessionTemplate sqlSession, SetAlert setAlert) {
	        return sqlSession.update("setAlertMapper.updateAlertSettings", setAlert);
    }

    public SetAlert getAlertSettings(SqlSessionTemplate sqlSession, String userId) {
        return sqlSession.selectOne("setAlertMapper.getAlertSettings", userId);
    }

    public ArrayList<SetAlert> selectAlertList(SqlSessionTemplate sqlSession, String userId) {
        return (ArrayList) sqlSession.selectList("setAlertMapper.selectAlertList", userId);
    }
}
