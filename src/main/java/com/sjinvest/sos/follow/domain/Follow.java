package com.sjinvest.sos.follow.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Follow")
public class Follow {
	private int userSeq;
	private int followUserSeq;
}