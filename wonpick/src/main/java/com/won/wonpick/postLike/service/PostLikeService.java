package com.won.wonpick.postLike.service;

import com.won.wonpick.postLike.model.vo.PostLike;

public interface PostLikeService {

	int postLikeCount(int postId);

	int userPostLike(PostLike pl);

	int selectUserPostLike(PostLike pl);

	int deletePostLike(PostLike pl);

	

}
