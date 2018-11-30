package com.sjinvest.sos.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.follow.mapper.FollowMapper;
import com.sjinvest.sos.holding.mapper.HoldingMapper;
import com.sjinvest.sos.interest.mapper.InterestMapper;
import com.sjinvest.sos.like.mapper.LikeMapper;
import com.sjinvest.sos.notice.mapper.NoticeMapper;
import com.sjinvest.sos.setting.mapper.SettingMapper;
import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Inject
	private UserMapper userMapper;
	@Inject
	private SettingMapper settingMapper;
	@Inject
	private InterestMapper interestMapper;
	@Inject
	private LikeMapper likeMapper;
	@Inject
	private FollowMapper followMapper;
	@Inject
	private HoldingMapper holdingMapper;
	@Inject
	private NoticeMapper noticeMapper;
	
	@Transactional
	@Override
	public boolean regist(User user) {
		try {
		userMapper.create(user);
		User thisUser = userMapper.readById(user.getUserId());
		settingMapper.create(thisUser.getUserSeq());
		}catch(Exception e) {
			log.info(e);
			return false;
		}
		return true;
	}

	@Transactional
	@Override
	public boolean withdrawal(int userSeq) {
		try {
			settingMapper.delete(userSeq);
			interestMapper.deleteByUser(userSeq);
			likeMapper.deleteByUser(userSeq);
			followMapper.deleteFollowByUser(userSeq);
			holdingMapper.deleteHoldingByUser(userSeq);
			noticeMapper.deleteNoticeByUser(userSeq);
			userMapper.deleteByUserSeq(userSeq);
		}catch(Exception e) {
			log.info(e);
			return false;
		}
		return true;
	}

	@Override
	public User certify(String userId, String userPw) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("userId", userId);
		data.put("userPw", userPw);
		return userMapper.certify(data);
	}

	@Override
	public boolean isExistId(String userId) {
		return (userMapper.isExistId(userId) == null);
	}

	@Override
	public boolean isExistNickname(String userNickname) {
		return (userMapper.isExistNickname(userNickname) == null);
	}

	@Override
	public User readById(String userId) {
		return userMapper.readById(userId);
	}

	@Override
	public User readBySeq(int userSeq) {
		return userMapper.readBySeq(userSeq);
	}

	@Override
	public boolean updateUser(User user) {
		return (userMapper.updateUser(user)==1);
	}

	@Override
	public boolean resetMoney(int userSeq) {
		User user = new User();
		user.setUserSeq(userSeq);
		user.setUserMoney(50000000);
		return (userMapper.updateUser(user)==1);
	}

	@Override
	public List<User> readBySeqList(List<Integer> userSeqList) {
		return userMapper.readBySeqList(userSeqList);
	}
}
