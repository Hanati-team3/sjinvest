package com.sjinvest.sos.comment.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Comment")
public class Comment {
	private int commentSeq;
	private int feedSeq;
	private int userSeq;
	private String commentRegdate;
	private String commentUpdateDate;
	private String commentContent;
}