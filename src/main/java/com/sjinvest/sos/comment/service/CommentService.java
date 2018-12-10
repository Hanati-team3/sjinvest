package com.sjinvest.sos.comment.service;

import java.util.List;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.feed.domain.Feed;

public interface CommentService {
	// 댓글 쓰기 - 댓글 객체 
	public boolean Write(Comment comment);
	// 피드 시퀀스 받아서 해당 피드 댓글 목록 가져오기
	public List<Comment> listByFeed(int feed_seq);
	// 댓글 수정
	public boolean updateComment(Comment comment);
	// 댓글 지우기
	public boolean deleteComment(Comment comment);
	// 게시글 밑 댓글 다 지우기
	public void deleteCommentByFeed(int feedSeq);
}
