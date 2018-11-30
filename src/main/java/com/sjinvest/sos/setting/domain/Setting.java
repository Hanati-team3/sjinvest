package com.sjinvest.sos.setting.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "Setting")
public class Setting {
	private int userSeq;
	private int setFeedNotice;
	private int setTradeNotice;
	private int setPrivacy;
	private int setView;
}