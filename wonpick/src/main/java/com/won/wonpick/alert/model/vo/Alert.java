package com.won.wonpick.alert.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Alert {
	private int alertId;
	private String userId;
	private String alertMessage;
	private String alertType;
}
