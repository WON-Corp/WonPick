package com.won.wonpick.errorPost.service;

import java.util.ArrayList;

import com.won.wonpick.errorPost.model.vo.ErrorPost;

public interface ErrorPostService {

	int insertError(ErrorPost ep);

	ArrayList<ErrorPost> selectErrorPostList(ErrorPost ep);

}
