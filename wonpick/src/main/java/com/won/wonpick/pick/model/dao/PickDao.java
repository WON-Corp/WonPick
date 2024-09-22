package com.won.wonpick.pick.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.pick.model.vo.Pick;

@Repository	
public class PickDao {

	public int selectMyPick(SqlSessionTemplate sqlSession, Pick p) {
		return sqlSession.selectOne("pickMapper.selectMyPick", p);
	}

	public int insertPick(SqlSessionTemplate sqlSession, Pick p) {
		sqlSession.insert("pickMapper.insertAlert",p);
		return sqlSession.insert("pickMapper.insertPick",p);
	}

	public int deletePick(SqlSessionTemplate sqlSession, Pick p) {
		return sqlSession.delete("pickMapper.deletePick", p);
	}

	public int selectPicked(SqlSessionTemplate sqlSession, Pick p) {
		return sqlSession.selectOne("pickMapper.selectPicked",p);
	}

	public int selectPick(SqlSessionTemplate sqlSession, Pick p) {
		return sqlSession.selectOne("pickMapper.selectPick", p);
	}
}
