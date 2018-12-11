package com.sjinvest.sos.feed.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sjinvest.sos.comment.mapper.CommentMapper;
import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.mapper.CompanyMapper;
import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.domain.SearchParam;
import com.sjinvest.sos.feed.mapper.FeedMapper;
import com.sjinvest.sos.like.mapper.LikeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FeedServiceImpl implements FeedService {

	@Inject
	private FeedMapper feedMapper;
	@Inject
	private CommentMapper commentMapper;
	@Inject
	private LikeMapper likeMapper;
	@Inject
	private CompanyMapper companyMapper;
	
	
	@Override
	public boolean write(Feed feed) {
		try {
			feedMapper.write(feed);
		}catch(Exception e) {
			log.info(e);
			return false;
		}
		return true;
	}

	@Transactional
	@Override
	public boolean deleteFeed(int feedSeq) {
		commentMapper.deleteCommentByFeed(feedSeq);
		likeMapper.deleteByFeed(feedSeq);
		return (feedMapper.deleteFeed(feedSeq)==1);
	}

	@Override
	public boolean updateFeed(Feed feed) {
		return (feedMapper.updateFeed(feed)==1);
	}

	@Override
	public boolean increaseShare(int feedSeq) {
		Map<String, Integer> data = new HashMap<String, Integer>();
		data.put("feedSeq", feedSeq);
		data.put("feedShareCnt", 1);
		return (feedMapper.increaseShare(data)==1);
	}

	@Override
	public List<Feed> listAll() {
		return feedMapper.listAll();
	}

	@Override
	public List<Feed> listBySearchPage(Map<String, Object> map) {
		return feedMapper.listBySearchPage(map);
	}

	@Override
	public List<Feed> listBySearchPage(SearchParam searchParam) {
		Map<String, Object> data = new HashMap<String, Object>();
		if(searchParam.getStartNum()!=0) {
			data.put("startNum", searchParam.getStartNum());
		}
		if(searchParam.getEndNum()!=0) {
			data.put("endNum", searchParam.getEndNum());
		}
		if(searchParam.getUserSeq()!=0) {
			data.put("userSeq", searchParam.getUserSeq());
		}
		if(searchParam.getKeywords() != null &&searchParam.getKeywords().size()>0) {
			data.put("keywords", searchParam.getKeywords());
		}
		return feedMapper.listBySearchPage(data);
	}

	@Override
	public List<Feed> listBySearchPageByFieldNumber(SearchParam searchParam, int fieldNumber) {
		Map<String, Object> data = new HashMap<String, Object>();
		if(searchParam.getStartNum()!=0) {
			data.put("startNum", searchParam.getStartNum());
		}
		if(searchParam.getEndNum()!=0) {
			data.put("endNum", searchParam.getEndNum());
		}
		if(searchParam.getUserSeq()!=0) {
			data.put("userSeq", searchParam.getUserSeq());
		}
		List<String> keywords = new ArrayList<String>();
		List<Company> companyList = companyMapper.readByFieldNumber(fieldNumber);
		for (Company company : companyList) {
			keywords.add("$"+company.getCompanyName());
		}
		data.put("keywords", keywords);
		return feedMapper.listBySearchPage(data);
	}

	@Override
	public List<Feed> listBySearchPageByFieldName(SearchParam searchParam, String fieldName) {
		Map<String, Object> data = new HashMap<String, Object>();
		if(searchParam.getStartNum()!=0) {
			data.put("startNum", searchParam.getStartNum());
		}
		if(searchParam.getEndNum()!=0) {
			data.put("endNum", searchParam.getEndNum());
		}
		if(searchParam.getUserSeq()!=0) {
			data.put("userSeq", searchParam.getUserSeq());
		}
		List<String> keywords = new ArrayList<String>();
		List<Company> companyList = companyMapper.readByFieldName(fieldName);
		for (Company company : companyList) {
			keywords.add("$"+company.getCompanyName());
		}
		data.put("keywords", keywords);
		return feedMapper.listBySearchPage(data);
	}

	@Override
	public List<Feed> listBySearchPageByFieldName(int startNum, int endNum, List<Integer> userSeqList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userSeqList", userSeqList);
		return feedMapper.listBySearchPageByUser(map);
	}

	@Override
	public boolean decreaseReply(int feedSeq) {
		return feedMapper.decreaseReply(feedSeq);
	}

}
