package com.sjinvest.sos.stock.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.stock.domain.AskingPrice;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.TimeSeries;


public interface StockService {
	public Stock getStockInfo(String companyNumber, String companyName);
	// 회사 번호와 회사 이름으로 차트 정보 가져오기
	public TimeSeries getTimeSeries(String companyNumber, String type);
	// 회사 이름으로 뉴스 리스트 가져오기
	public List<News> getNewsList(String companyName);
	// 실시간 매매량 top10 주식 정보
	public List<Stock> stockRealtime();
	// 소유 종목 정보
	public List<Holding> stockMyHoldingWidget();
	// 업종별 거래량
	public List<Map<String, Object>> stockFieldAmount();
	// 업종별 전일 대비
	public List<Map<String, Object>> stockFieldDayBefore();
	// 회사 번호 리스트로 회사 주식 정보 리스트 받기
	public List<Stock> getStockList(List<String> companyNumberList);
	// 회사 번호 리스트로 회사 시계열 정보 리스트 받기
	public List<TimeSeries> getTimeSeriesList(List<String> companyNumberList, String type);
	// 코스피 정보 받기
	public Stock getStockKospiInfo();
	// 코스피 시계열 받기
	public TimeSeries getStockKospiTimeSeries();
	// 주식 탑 5 or 3 type별로 받기(Rising, Falling, Foreing, Institution)
	public List<Map<String, Object>> stockTop(String type);
	// 전체 주식 뉴스 top5
	public List<News> stockIndexNews();
	// 회사 번호로 호가 받아오기
	public List<AskingPrice> getAskingPrice(String companyNumber);
}
