package com.sjinvest.sos.user.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "User")
public class User {
	private int userSeq;
	private String userId;
	private String userPw;
	private String userNickname;
	private String userEmail;
	private int userPoint;
	private String userDetail;
	private String userPicture;
	private String userRegdate;
	private int userMoney;
	private int userGender;
	private String userBirth;
	private String userAuthority;
}