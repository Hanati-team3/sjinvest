package com.sjinvest.sos.comment.mapper;

import java.util.List;

import com.sjinvest.sos.comment.domain.Comment;

public interface CommentMapper {
	public void write(Comment comment);	
	public List<Comment> listByFeed(int feed_seq);
	public int updateComment(Comment comment);
	public int deleteComment(int commentSeq);
	public int deleteCommentByFeed(int feedSeq);
}