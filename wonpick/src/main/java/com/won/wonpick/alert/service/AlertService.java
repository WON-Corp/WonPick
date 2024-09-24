package com.won.wonpick.alert.service;

import java.util.ArrayList;

import com.won.wonpick.alert.model.vo.Alert;
import com.won.wonpick.setalert.model.vo.SetAlert;

public interface AlertService {

	ArrayList<Alert> selectAlertList(String userId);

}
