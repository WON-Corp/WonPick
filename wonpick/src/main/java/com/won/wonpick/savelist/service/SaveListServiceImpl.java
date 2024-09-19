package com.won.wonpick.savelist.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.won.wonpick.savelist.model.dao.SaveListDao;
import com.won.wonpick.savelist.model.vo.SaveList;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SaveListServiceImpl implements SaveListService{

	private final SqlSessionTemplate sqlSession;
	private final SaveListDao sDao;
	
	

	@Transactional
	@Override
	public int insertSaveList(SaveList s) {
		// TODO Auto-generated method stub
	
		return sDao.insertSaveList(sqlSession,s);
	}
	
	public int selectSaveList(SaveList s) {
		return sDao.selectSaveList(sqlSession,s);
	}
	
	@Override
	public int deleteSaveList(SaveList s) {
		return sDao.deleteSaveList(sqlSession,s);
	}
	
}
