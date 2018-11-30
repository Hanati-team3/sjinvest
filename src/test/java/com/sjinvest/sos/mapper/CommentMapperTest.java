package com.sjinvest.sos.mapper;

import java.sql.SQLException;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.mapper.CommentMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTest {

	@Inject
	private CommentMapper mapper;//	@Test
	
//	@Test
	public void testWrite() throws SQLException {
		log.info(mapper);
		Comment comment = new Comment();
		comment.setUserSeq(2);
		comment.setFeedSeq(9);
		comment.setCommentContent("테스트용 작업");
		mapper.write(comment);
	}

//	@Test
	public void testList() throws SQLException {
		log.info(mapper);
		mapper.listByFeed(9);
	}
	
//	@Test
	public void testUpdate() throws SQLException {
		log.info(mapper);
		Comment comment = new Comment();
		comment.setCommentSeq(4);
		comment.setCommentContent("댓글 수정합니다.");
		mapper.updateComment(comment);
	}
	@Test
	public void testDelete() throws SQLException {
		log.info(mapper);
//		mapper.deleteComment(6);
		mapper.deleteCommentByFeed(9);
	}
}