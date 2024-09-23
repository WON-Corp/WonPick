package com.won.wonpick.chatting.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.chatting.model.dao.ChattingDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChattingServiceImpl implements ChattingService {
	
	private final SqlSessionTemplate sqlSession;
	private final ChattingDao cDao;

}
