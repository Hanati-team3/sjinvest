package com.sjinvest.sos.point.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Point")
public class Point {
	private int pointSeq;
	private int userSeq;
	private String pointContent;
	private int pointAmount;
	private String pointDate;
}