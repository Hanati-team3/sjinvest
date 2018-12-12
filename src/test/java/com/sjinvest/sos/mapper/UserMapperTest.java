package com.sjinvest.sos.mapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.ModelAndView;

import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Inject
	private UserMapper userMapper;

//	@Test
	public void testCreate() throws SQLException {
		log.info(userMapper);
		User user = new User();
		user.setUserId("testID");
		user.setUserNickname("tester");
		user.setUserEmail("gloomycloud@khu.ac.kr");
		user.setUserPw("test90");
		user.setUserGender(2);
		user.setUserAuthority("user");
		userMapper.create(user);
	}
	
//	@Test
	public void testRead() throws SQLException {
		log.info(userMapper);
		User user = userMapper.readById("testID");
		log.info(user);
		
		user = userMapper.readBySeq(2);
		log.info(user);
	}
//	@Test
	public void testExist() throws SQLException {
		log.info(userMapper);
		String id = userMapper.isExistId("testID");
		log.info(id);
		
		String nick = userMapper.isExistNickname("bluemoon");
		log.info(nick);
	}
//	@Test
	public void testCertify() throws SQLException {
		log.info(userMapper);
		Map<String, String> data = new HashMap<String, String>();
		data.put("userId", "suhyeon");
		data.put("userPw", "aaa");
		User user = userMapper.certify(data);
		log.info(user);
	}
//	@Test
	public void testDelete() throws SQLException {
		log.info(userMapper);
		int result = userMapper.deleteByUserId("testID");
		log.info(result);
	}
//	@Test
	public void testUpdate() throws SQLException {
		log.info(userMapper);
		User user = new User();
		user.setUserId("suhyeon");
		user.setUserPw("suhyeon9007");
		int result = userMapper.updateUser(user);
		log.info(result);
	}
//	@Test
	public void testPlusMinus() throws SQLException {
		log.info(userMapper);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("userSeq", 2);
		data.put("userPoint", 50);
		int result = userMapper.addUserPoint(data);
		log.info(result);
		log.info(userMapper.checkUserPoint(2));
		data.put("userMoney", 500000000);
		result = userMapper.addUserMoney(data);
		log.info(result);
		log.info(userMapper.checkUserMoney(2));
	}
//	@Test
	public void testUserSeqList() throws SQLException {
		log.info(userMapper);
		List<Integer> userSeqList = new ArrayList<Integer>();
		userSeqList.add(2);
		userSeqList.add(6);
		log.info(userMapper.readBySeqList(userSeqList));
	}
	
	//@Test
	public void testAllUserList() throws SQLException {
		log.info(userMapper);
		List<String> userList = userMapper.findUser("");
        log.info("size : " +  userList.size());
	}
	
}







