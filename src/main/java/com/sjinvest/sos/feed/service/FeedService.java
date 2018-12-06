package com.sjinvest.sos.feed.service;

import java.util.List;
import java.util.Map;

import com.sjinvest.sos.feed.domain.Feed;
import com.sjinvest.sos.feed.domain.SearchParam;

public interface FeedService {
	// 피드 쓰기
	public boolean write(Feed feed);
	// 피드 지우기
	public boolean deleteFeed(int feedSeq);
	// 피드 수정
	public boolean updateFeed(Feed feed);
	// 피드 공유 수 증가시키기
	public boolean increaseShare(int feedSeq);
	// 피드 전체 목록 가져오기
	public List<Feed> listAll();
	// 피드 검색(map 구조로 검색 param 넘기기, 넣는 값은 SearchParam 참조)
	public List<Feed> listBySearchPage(Map<String, Object> map);
	// 피드 검색(SearchParam 으로)
	public List<Feed> listBySearchPage(SearchParam searchParam);
	// 피드 검색(업종번호로 검색)
	public List<Feed> listBySearchPageByFieldNumber(SearchParam searchParam, int fieldNumber);
	// 피드 검색(업종명으로 검색)
	public List<Feed> listBySearchPageByFieldName(SearchParam searchParam, String fieldName);
}
