package com.sjinvest.sos.feed.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Feed")
public class Feed {
	private int feedSeq;
	private int userSeq;
	private String feedRegdate;
	private String feedUpdateDate;
	private String feedContent;
	private int feedLikeCnt;
	private int feedShareCnt;
	private String feedPicture;
	private int feedOriginalSeq;
}