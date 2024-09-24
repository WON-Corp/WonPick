package com.won.wonpick.setalert.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.won.wonpick.setalert.model.dao.SetAlertDao;
import com.won.wonpick.setalert.model.vo.SetAlert;

@Service
public class SetAlertServiceImpl implements SetAlertService {

    private final SqlSessionTemplate sqlSession;
    private final SetAlertDao setAlertDao;

    @Autowired
    public SetAlertServiceImpl(SqlSessionTemplate sqlSession, SetAlertDao setAlertDao) {
        this.sqlSession = sqlSession;
        this.setAlertDao = setAlertDao;
    }

    @Override
    public int updateAlertSettings(SetAlert setAlert) {
        return setAlertDao.updateAlertSettings(sqlSession, setAlert);
    }

    @Override
    public SetAlert getAlertSettings(String userId) {
        return setAlertDao.getAlertSettings(sqlSession, userId);
    }

    @Override
    public ArrayList<SetAlert> selectAlertList(String userId) {
        return setAlertDao.selectAlertList(sqlSession, userId);
    }
}
