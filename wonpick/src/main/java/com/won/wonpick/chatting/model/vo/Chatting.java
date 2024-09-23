package com.won.wonpick.chatting.model.vo;

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
public class Chatting {
	
	private int chattingId;
	private String senderId;
	private String receiverId;
	private String chattingContent;
	private String chattingTime;

}
