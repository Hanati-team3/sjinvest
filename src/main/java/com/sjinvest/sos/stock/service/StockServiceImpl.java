package com.sjinvest.sos.stock.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.setting.domain.Setting;
import com.sjinvest.sos.setting.mapper.SettingMapper;
import com.sjinvest.sos.stock.dao.StockDao;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.TimeSeries;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StockServiceImpl implements StockService {

	@Override
	public Stock getStockInfo(String companyNumber, String companyName) {
		Random random = new Random();
		Stock stock = new Stock();
		stock.setStockCode(companyNumber);
		stock.setPer((random.nextDouble()*160)-80);
		stock.setBps(random.nextInt(10)*10000);
		stock.setEps(random.nextInt(0100)*1000);
		stock.setPbr((random.nextDouble()*60)-30);
		stock.setStockChange(random.nextInt(1000000));
		stock.setStockDiff((random.nextDouble()*200)-100);
		int stockPrice = 40000+random.nextInt(20000)-10000;
		stock.setStockPrice(stockPrice);
		stock.setStockHigh(stockPrice+random.nextInt(5000));
		stock.setStockLow(stockPrice-random.nextInt(5000));
		stock.setStockName(companyName);
		stock.setStockVolume(50000+random.nextInt(50000));
		return stock;
	}
	// 회사 번호와 회사 이름으로 차트 정보 가져오기
	@Override
	public TimeSeries getTimeSeries(String companyNumber, String type) {
		Random random = new Random();
		TimeSeries timeSeries= new TimeSeries();
		List<String> label = new ArrayList<String>();
		List<Double> data = new ArrayList<Double>();
		for(int i = 1; i < 13; i++) {
			label.add(i+"월");
			data.add(random.nextInt(200)*1.1);
		}
		timeSeries.setLabel(label);
		timeSeries.setData(data);
		return timeSeries;
	}
	// 회사 이름으로 뉴스 리스트 가져오기
	@Override
	public List<News> getNewsList(String companyName) {
		Random random = new Random();
		List<News> newsList = new ArrayList<News>();
		News news = new News();
		news.setDate("2018-12-01");
		news.setHeadLine("뉴스 헤드라인입니다. 오늘 이 카페에는 사람이 많네요. 여기저기 크리스마스 분위기가 풍기는 예쁜 카페입니다. 많이 시끄럽지도 않아요");
		news.setLink("www.naver.com");
		news.setSource("남수현기자");
		news.setTitle("뉴스 제목입니다. 안 어울리게 락 느낌이 나는 음악");
		newsList.add(news);
		newsList.add(news);
		newsList.add(news);
		newsList.add(news);
		newsList.add(news);
		return newsList;
	}
	// 실시간 매매량 top10 주식 정보
	@Override
	public List<Stock> stockRealtime(){
		Random random = new Random();
		List<Stock> stockList = new ArrayList<Stock>();
		stockList.add(getStockInfo("000000","아모레퍼시픽"));
		stockList.add(getStockInfo("001020","코스맥스"));
		stockList.add(getStockInfo("001202","한국콜마"));
		stockList.add(getStockInfo("948213","잇츠한불"));
		stockList.add(getStockInfo("134314","제이준코스메틱"));
		stockList.add(getStockInfo("001010","아모레퍼시픽우"));
		stockList.add(getStockInfo("122322","아모레G"));
		stockList.add(getStockInfo("090909","에이블씨엔씨"));
		stockList.add(getStockInfo("111111","LG생활건강"));
		stockList.add(getStockInfo("222222","한국화장품제조"));
		return stockList;
	}
	// 소유 종목 정보
	@Override
	public List<Holding> stockMyHoldingWidget(){
		Random random = new Random();
		List<Holding> holdingList = new ArrayList<Holding>();
		Holding holding = new Holding();
		holding.setUserSeq(2);
		holding.setCompanyName("아모레퍼시픽");
		holding.setCompanyNumber("090430");
		holding.setHoldingAmount(random.nextInt(1000));
		holding.setHoldingRateOfReturn(random.nextDouble()*50);
		holding.setHoldingSeq(6);
		holding.setHoldingTotalMoney(random.nextInt(100000));
		holdingList.add(holding);
		Holding holding2 = new Holding();
		holding2.setUserSeq(2);
		holding2.setCompanyName("LG생활건강");
		holding2.setCompanyNumber("051900");
		holding.setHoldingAmount(random.nextInt(1000));
		holding.setHoldingRateOfReturn(random.nextDouble()*50);
		holding2.setHoldingSeq(7);
		holding.setHoldingTotalMoney(random.nextInt(100000));
		holdingList.add(holding2);
		Holding holding3 = new Holding();
		holding3.setUserSeq(2);
		holding3.setCompanyName("토니모리");
		holding3.setCompanyNumber("214420");
		holding3.setHoldingAmount(random.nextInt(1000));
		holding3.setHoldingRateOfReturn(random.nextDouble()*50);
		holding3.setHoldingSeq(5);
		holding3.setHoldingTotalMoney(random.nextInt(100000));
		holdingList.add(holding3);
		for(int i = 0; i < random.nextInt(5); i++) {
			Holding holding4 = new Holding();
			holding4.setUserSeq(2);
			holding4.setCompanyName(i+"번째");
			holding4.setCompanyNumber("000000");
			holding4.setHoldingAmount(random.nextInt(1000));
			holding4.setHoldingRateOfReturn(random.nextDouble()*50);
			holding4.setHoldingSeq(random.nextInt(5));
			holding4.setHoldingTotalMoney(random.nextInt(100000));
			holdingList.add(holding4);
		}
		return holdingList;
	}
	// 업종별 거래량
	@Override
	public List<Map<String, Object>> stockFieldAmount(){
		Random random = new Random();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("fieldName", "화장품");
		data.put("fieldAmount",random.nextInt(10000000));
		result.add(data);
		Map<String, Object> data2 = new HashMap<String, Object>();
		data.put("fieldName", "미디어산업");
		data.put("fieldAmount",random.nextInt(10000000));
		result.add(data2);
		Map<String, Object> data3 = new HashMap<String, Object>();
		data.put("fieldName", "은행");
		data.put("fieldAmount",random.nextInt(10000000));
		result.add(data3);
		Map<String, Object> data4 = new HashMap<String, Object>();
		data.put("fieldName", "호텔경영");
		data.put("fieldAmount",random.nextInt(10000000));
		result.add(data4);
		Map<String, Object> data5 = new HashMap<String, Object>();
		data.put("fieldName", "식음료");
		data.put("fieldAmount",random.nextInt(10000000));
		result.add(data5);
		return result;
	}
	// 업종별 전일 대비
	@Override
	public List<Map<String, Object>> stockFieldDayBefore(){
		Random random = new Random();
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("fieldName", "화장품");
		data.put("dayBeforeAmount",random.nextInt(10000));
		data.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data);
		Map<String, Object> data2 = new HashMap<String, Object>();
		data.put("fieldName", "미디어산업");
		data.put("fieldAmount",random.nextInt(10000));
		data.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data2);
		Map<String, Object> data3 = new HashMap<String, Object>();
		data.put("fieldName", "은행");
		data.put("fieldAmount",random.nextInt(10000));
		data.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data3);
		Map<String, Object> data4 = new HashMap<String, Object>();
		data.put("fieldName", "호텔경영");
		data.put("fieldAmount",random.nextInt(10000));
		data.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data4);
		Map<String, Object> data5 = new HashMap<String, Object>();
		data.put("fieldName", "식음료");
		data.put("fieldAmount",random.nextInt(10000));
		data.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data5);
		return result;
	}
	// 회사 번호 리스트로 회사 주식 정보 리스트 받기
	@Override
	public List<Stock> getStockList(List<String> companyNumberList){
		Random random = new Random();
		List<Stock> stockList = new ArrayList<Stock>();
		for(int i = 0; i < companyNumberList.size(); i++) {
			stockList.add(getStockInfo("000000","아모레퍼시픽"));
		}
		return stockList;
	}
	// 회사 번호 리스트로 회사 시계열 정보 리스트 받기
	@Override
	public List<TimeSeries> getTimeSeriesList(List<String> companyNumberList, String type){
		List<TimeSeries> timeSeriesList= new ArrayList<TimeSeries>();
		for(int i = 0; i < companyNumberList.size(); i++) {
			timeSeriesList.add(getTimeSeries("",""));
		}
		return timeSeriesList;
	}
	// 코스피 정보 받기
	@Override
	public Stock getStockKospiInfo() {
		return getStockInfo("000000","Kospi");
	}
	// 코스피 시계열 받기
	@Override
	public TimeSeries getStockKospiTimeSeries() {
		return getTimeSeries("000000", "Kospi");
	}
	// 주식 탑 5 or 3 type별로 받기(Rising, Falling, Foreing, Institution)
	@Override
	public List<Map<String, Object>> stockTop(String type){
		Random random = new Random();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		for(int i = 0; i < 5; i++) {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("companyName", "아모레퍼시픽");
			map.put("value",random.nextDouble()*100);
			resultList.add(map);
		}
		return resultList;
	}
	// 전체 주식 뉴스 top5
	@Override
	public List<News> stockIndexNews(){
		return getNewsList("");
	}
}
