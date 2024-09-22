package com.won.wonpick.pick.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.pick.model.dao.PickDao;
import com.won.wonpick.pick.model.vo.Pick;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PickServiceImpl implements PickService{
	
	private final SqlSessionTemplate sqlSession;
	private final PickDao pDao;
	@Override
	public int selectMyPick(Pick p) {
		return pDao.selectMyPick(sqlSession, p);
	}
	@Override
	public int insertPick(Pick p) {
		return pDao.insertPick(sqlSession, p);
	}
	@Override
	public int deletePick(Pick p) {
		return pDao.deletePick(sqlSession, p);
	}
	@Override
	public int selectPicked(Pick p) {
		return pDao.selectPicked(sqlSession, p);
	}
	@Override
	public int selectPick(Pick p) {
		return pDao.selectPick(sqlSession, p);
	}

}
