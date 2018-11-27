package com.sjinvest.sos.notice.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Notice")
public class Notice {
	private int noticeSeq;
	private int userSeq;
	private String noticeContent;
	private int noticeIsChecked;
	private String noticeDate;
	private int noticeType;
}