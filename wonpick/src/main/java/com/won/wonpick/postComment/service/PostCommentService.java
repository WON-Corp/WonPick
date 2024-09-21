package com.won.wonpick.postComment.service;

import java.util.ArrayList;

import com.won.wonpick.postComment.model.vo.PostComment;

public interface PostCommentService {

	int postCommentCount(int postId);

	ArrayList<PostComment> postCommentList(int postId);

	int insertComment(PostComment pc);

	int selectCommentPick(PostComment pc);

	int insertCommentPick(PostComment pc);

	int deleteCommentPick(PostComment pc);

}
