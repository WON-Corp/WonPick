package com.won.wonpick.savelist.service;

import org.apache.ibatis.annotations.Mapper;
import com.won.wonpick.savelist.model.vo.SaveList;

@Mapper
public interface SaveListService {
	int insertSaveList(SaveList s);

	int selectSaveList(SaveList sList);

	int deleteSaveList(SaveList sList);

	
}
