package com.sjinvest.sos.user.mapper;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.user.domain.User;

public interface UserMapper {
	public void create(User user);
	public User readById(String userId);
	public User readBySeq(int userSeq);
	public String isExistId(String userId);
	public String isExistNickname(String userNickname);
	public User certify(Map<String, String> map);
	public int deleteByUserId(String userId);
	public int deleteByUserSeq(int userSeq);
	public int updateUser(User user);
	public int addUserPoint(Map<String, Object> map);
	public int checkUserPoint(int userSeq);
	public int addUserMoney(Map<String, Object> map);
	public int checkUserMoney(int userSeq);
	public List<User> readBySeqList(List<Integer> userSeqList);
	public List<User> pointTop(int num);
	public List<String> findUser(String term);
}