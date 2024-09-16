package com.won.wonpick.postComment.model.vo;

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
public class PostComment {
	private int postCommentId;
	private String userId;
	private String userPfImg;
	private int postId;
	private String postComment;
	private String commentTime;
	private String status;
}
