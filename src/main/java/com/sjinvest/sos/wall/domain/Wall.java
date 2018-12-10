package com.sjinvest.sos.wall.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Wall")
public class Wall {
	private int wallSeq;
	private int userSeq;
	private String wallRegdate;
	private String wallUpdateDate;
	private String wallContent;
	private int wallLikeCnt;
	private int wallShareCnt;
	private int wallReplyCnt;
	private String wallPicture;
	private int wallOriginalSeq;
	private int writerUserSeq;
}