package com.sjinvest.sos.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.user.domain.User;
import com.sjinvest.sos.user.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Override
	public boolean Create(User user) {
		try {
			mapper.create(user);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
