package com.won.wonpick.setalert.service;

import java.util.ArrayList;

import com.won.wonpick.setalert.model.vo.SetAlert;

public interface SetAlertService {
    

	int updateAlertSettings(SetAlert setAlert);

    SetAlert getAlertSettings(String userId);

    ArrayList<SetAlert> selectAlertList(String userId);
}
