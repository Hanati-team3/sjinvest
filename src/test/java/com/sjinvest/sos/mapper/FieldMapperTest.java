package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.field.domain.Field;
import com.sjinvest.sos.field.mapper.FieldMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FieldMapperTest {

	@Inject
	private FieldMapper fieldMapper;//	@Test
	
	@Test
	public void testRead() throws SQLException {
		log.info(fieldMapper);
		Field field = fieldMapper.readByNumber(1000);
		log.info(field);
		
		field=fieldMapper.readByName("화장품");
		log.info(field);
	}
	@Test
	public void testList() throws SQLException {
		log.info(fieldMapper);
		log.info(fieldMapper.list());
	}
}







