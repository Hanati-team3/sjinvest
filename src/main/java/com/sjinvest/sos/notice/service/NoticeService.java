package com.sjinvest.sos.notice.service;

import java.util.List;

import com.sjinvest.sos.notice.domain.Notice;

public interface NoticeService {
	public boolean create(Notice notice);
	public boolean deleteNotice(int noticeSeq);
	public List<Notice> listByUser(int userSeq);
	public int notCheckedNoticeByUser(int userSeq);
	public boolean isReaded(int noticeSeq);
	public boolean isReadedAll();
}
