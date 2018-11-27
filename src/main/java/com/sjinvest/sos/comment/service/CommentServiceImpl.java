package com.sjinvest.sos.comment.service;

import javax.inject.Inject;

import org.apache.ibatis.plugin.Intercepts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.comment.domain.Comment;
import com.sjinvest.sos.comment.mapper.CommentMapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@NoArgsConstructor
public class CommentServiceImpl implements CommentService {

	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;

	@Override
	public boolean Create(Comment comment) {
		try {
			mapper.create(comment);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
