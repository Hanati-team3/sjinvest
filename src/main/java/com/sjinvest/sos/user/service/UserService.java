package com.sjinvest.sos.user.service;

import java.util.List;

import com.sjinvest.sos.user.domain.User;


public interface UserService {
	// 유저 가입
	public boolean regist(User user);
	// 유저 탈퇴
	public boolean withdrawal(int userSeq);
	// 아이디 비번으로 유저 확인
	public User certify(String userId, String userPw);
	// 아이디 존재 여부 확인
	public boolean isExistId(String userId);
	// 닉네임 존재 
	public boolean isExistNickname(String userNickname);
	// 아이디로 유저 가져오기
	public User readById(String userId);
	// 유저 번호로 유저 가져오기
	public User readBySeq(int userSeq);
	// 유저 정보 변경
	public boolean updateUser(User user);
	// 유저 돈 리셋
	public boolean resetMoney(int userSeq);
	// 유저 번호 목록으로 유저 목록 가져오기
	public List<User> readBySeqList(List<Integer> userSeqList);
	// 포인트로 top 유저 목록 가져오기
	public List<User> pointTop(int num);
	// 유저 검색(자동완성기능)
	public List<String> findUser(String term);
	// 유저 검색
	public int searchUser(String text);
}
