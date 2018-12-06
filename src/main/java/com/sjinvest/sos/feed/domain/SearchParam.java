package com.sjinvest.sos.feed.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SearchParam {
	private int startNum;	//페이지 시작번호
	private int endNum;		//페이지 마지막 번호
	private int userSeq;	//유저 번호
	List<String> keywords;	//회사들 이름
}