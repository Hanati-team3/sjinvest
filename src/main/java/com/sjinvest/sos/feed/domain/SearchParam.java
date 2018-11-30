package com.sjinvest.sos.feed.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Feed")
public class SearchParam {
	private int startNum;
	private int endNum;
	private int userSeq;
	List<String> keywords;
}