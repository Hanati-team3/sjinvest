package com.sjinvest.sos.notice.service;

import java.util.List;

import com.sjinvest.sos.notice.domain.Notice;

public interface NoticeService {
	// 알림 만들기
	public boolean create(Notice notice);
	// 알림 지우기
	public boolean deleteNotice(int noticeSeq);
	// 해당 유저 알림 목록 가져오기
	public List<Notice> listByUser(int userSeq);
	// 확인 안 한 알림 수 확인
	public int notCheckedNoticeByUser(int userSeq);
	// 읽음 처리
	public boolean isReaded(int noticeSeq);
	// 모두 읽음 처리
	public boolean isReadedAll();
}
