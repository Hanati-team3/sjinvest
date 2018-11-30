package com.sjinvest.sos.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.notice.domain.Notice;
import com.sjinvest.sos.notice.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;

	@Override
	public boolean create(Notice notice) {
		try{
			mapper.create(notice);
		}catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteNotice(int noticeSeq) {
		return (mapper.deleteNotice(noticeSeq)==1);
	}

	@Override
	public List<Notice> listByUser(int userSeq) {
		return mapper.listByUser(userSeq);
	}

	@Override
	public int notCheckedNoticeByUser(int userSeq) {
		return mapper.notCheckedNoticeByUser(userSeq);
	}

	@Override
	public boolean isReaded(int noticeSeq) {
		return (mapper.isReaded(noticeSeq)==1);
	}

	@Override
	public boolean isReadedAll() {
		try{
			mapper.isReadedAll();
		}catch (Exception e) {
			return false;
		}
		return true;
	}
	

}
