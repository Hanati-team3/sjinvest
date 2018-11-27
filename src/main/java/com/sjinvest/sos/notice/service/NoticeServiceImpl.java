package com.sjinvest.sos.notice.service;

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

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	@Override
	public boolean Create(Notice notice) {
		try {
			mapper.create(notice);
		}catch(Exception e) {
			return false;
		}
		return true;
	}
}
