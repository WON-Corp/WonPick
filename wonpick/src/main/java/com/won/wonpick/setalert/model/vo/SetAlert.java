package com.won.wonpick.setalert.model.vo;

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
public class SetAlert {

    private String userId;
    private String postAlert;
    private String pickAlert;
    private String commentAlert;
    private String commentLikeAlert;
}
