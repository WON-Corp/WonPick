package com.won.wonpick.pick.service;

import com.won.wonpick.pick.model.vo.Pick;

public interface PickService {

	int selectMyPick(Pick p);

	int insertPick(Pick p);

	int deletePick(Pick p);

	int selectPicked(Pick p);

	int selectPick(Pick p);
}
