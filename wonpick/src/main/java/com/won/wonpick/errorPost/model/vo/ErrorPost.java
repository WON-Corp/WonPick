package com.won.wonpick.errorPost.model.vo;

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
public class ErrorPost {
	
	private int errorPostId;
	private String errorPostTitle;
	private String userId;
	private String postingDate;
	private String errorContent;
	 private String responsed;

}
