package com.sjinvest.sos.notice.mapper;

import java.util.List;

import com.sjinvest.sos.notice.domain.Notice;

public interface NoticeMapper {
	public void create(Notice notice);
	public int deleteNotice(int noticeSeq);
	public List<Notice> listByUser(int userSeq);
	public int deleteNoticeByUser(int userSeq);
	public int notCheckedNoticeByUser(int userSeq);
	public int isReaded(int noticeSeq);
	public int isReadedAll();
}