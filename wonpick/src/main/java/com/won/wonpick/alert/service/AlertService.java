package com.won.wonpick.alert.service;

import java.util.ArrayList;

import com.won.wonpick.alert.model.vo.Alert;

public interface AlertService {

	ArrayList<Alert> selectAlertList(String userId);

}
