package com.sjinvest.sos.like.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Like")
public class Like {
	private int userSeq;
	private int feedSeq;
}