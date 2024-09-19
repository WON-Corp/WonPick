package com.won.wonpick.savelist.model.vo;

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
public class SaveList {

	
	private int saveListId;
    private String userId;
    private int savePostId;
}
