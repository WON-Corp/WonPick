package com.won.wonpick.post.model.vo;

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
public class Post {
	
	private int postId;
	private String userId;
	private String userPfImg;
	private String postTitle;
	private String postContent;
	private String postingTime;
	private int count;
	private String imgFile;
	private String status;
	
}
