package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.notice.domain.Notice;
import com.sjinvest.sos.notice.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTest {

	@Inject
	private NoticeMapper mapper;
	
//	@Test
	public void testCreate() throws SQLException {
		Notice notice = new Notice();
		notice.setNoticeContent("확인");
		notice.setNoticeType(1);
		notice.setUserSeq(2);
		mapper.create(notice);
	}
//	@Test
	public void testDelete() throws SQLException {
		mapper.deleteNotice(5);
	}
//	@Test
	public void testDeleteByUser() throws SQLException {
		mapper.deleteNoticeByUser(2);
	}
//	@Test
	public void testCheck() throws SQLException {
		mapper.notCheckedNoticeByUser(2);
	}
//	@Test
	public void testisReadedAll() throws SQLException {
		mapper.isReadedAll();
	}
	@Test
	public void testisReaded() throws SQLException {
		mapper.isReaded(7);
	}
}