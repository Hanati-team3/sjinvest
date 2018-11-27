package com.sjinvest.sos.user.mapper;

import com.sjinvest.sos.user.domain.User;

public interface UserMapper {
	public String create(User user);
	public User readByUserName(String userName);
}