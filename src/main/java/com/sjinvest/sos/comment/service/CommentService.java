package com.sjinvest.sos.comment.service;

import java.util.List;

import com.sjinvest.sos.comment.domain.Comment;

public interface CommentService {
	public boolean Write(Comment comment);
	public List<Comment> listByFeed(int feed_seq);
	public boolean updateComment(Comment comment);
	public boolean deleteComment(Comment comment);
}
