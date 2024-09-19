package com.won.wonpick.savelist.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.savelist.model.vo.SaveList;       
@Repository
public class SaveListDao {

	public int insertSaveList(SqlSessionTemplate sqlSession, SaveList s) {
		// TODO Auto-generated method stub
	
		int result = sqlSession.insert("saveListMapper.insertSaveList", s);
		System.out.println(result);
		return result;
	}

	public int selectSaveList(SqlSessionTemplate sqlSession, SaveList s) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("saveListMapper.selectSaveList", s);
	}

}
