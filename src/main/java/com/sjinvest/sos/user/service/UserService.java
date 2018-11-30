package com.sjinvest.sos.user.service;

import java.util.List;

import com.sjinvest.sos.user.domain.User;


public interface UserService {
	public boolean regist(User user);
	public boolean withdrawal(int userSeq);
	public User certify(String userId, String userPw);
	public boolean isExistId(String userId);
	public boolean isExistNickname(String userNickname);
	public User readById(String userId);
	public User readBySeq(int userSeq);
	public boolean updateUser(User user);
	public boolean resetMoney(int userSeq);
	public List<User> readBySeqList(List<Integer> userSeqList);
}
