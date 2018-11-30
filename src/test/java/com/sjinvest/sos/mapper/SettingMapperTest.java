package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.setting.mapper.SettingMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SettingMapperTest {

	@Inject
	private SettingMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		mapper.create(2);
	}
//	@Test
	public void testDelete() throws SQLException {
		mapper.delete(2);
	}
	@Test
	public void testUpdate() throws SQLException {
		Setting setting = new Setting();
		setting.setUserSeq(2);
		setting.setSetView(2);
		mapper.update(setting);
	}
}