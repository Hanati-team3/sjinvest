package com.sjinvest.sos.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.mapper.CommentMapper;
import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.mapper.FeedMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@NoArgsConstructor
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentMapper commentMapper;
	@Inject
	private FeedMapper feedMapper;

	@Transactional
	@Override
	public boolean Write(Comment comment) {
		try {
			commentMapper.write(comment);
			Map<String, Integer> data = new HashMap<String, Integer>();
			data.put("feedSeq", comment.getFeedSeq());
			data.put("feedReplyCnt", 1);
			feedMapper.increaseReply(data);
		}catch(Exception e){
			return false;
		}
		return true;
	}

	@Override
	public List<Comment> listByFeed(int feed_seq) {
		return commentMapper.listByFeed(feed_seq);
	}

	@Override
	public boolean updateComment(Comment comment) {
		return (commentMapper.updateComment(comment)==1);
	}
	
	@Transactional
	@Override
	public boolean deleteComment(Comment comment) {
		boolean result = (commentMapper.deleteComment(comment.getCommentSeq())==1);
		if(result) {
			Map<String, Integer> data = new HashMap<String, Integer>();
			data.put("feedSeq", comment.getFeedSeq());
			data.put("feedReplyCnt", -1);
			feedMapper.increaseReply(data);
		}
		return result;
	}

	@Override
	public void deleteCommentByFeed(int feedSeq) {
		feedMapper.deleteFeed(feedSeq);
	}
}
