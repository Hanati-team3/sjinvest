package com.sjinvest.sos.stock.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.sjinvest.sos.holding.domain.Holding;
import com.sjinvest.sos.stock.dao.StockDao;
import com.sjinvest.sos.stock.dao.StockNewsCrawler;
import com.sjinvest.sos.stock.domain.AskingPrice;
import com.sjinvest.sos.stock.domain.Kospi;
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
			label.add("\""+i+"월"+"\"");
			data.add(random.nextInt(200)*1.1);
		}
		Map<String, List<Double>> datas = new HashMap<String, List<Double>>();
		datas.put("companyNumber", data);
		timeSeries.setLabel(label);
		timeSeries.setData(datas);
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
		News news2 = new News();
		news2.setDate("2018-12-01");
		news2.setHeadLine("뉴스 헤드라인입니다. 오늘 이 카페에는 사람이 많네요. 여기저기 크리스마스 분위기가 풍기는 예쁜 카페입니다. 많이 시끄럽지도 않아요");
		news2.setLink("www.naver.com");
		news2.setSource("수현일보");
		news2.setTitle("달라지는 것 테스트합니다.");
		newsList.add(news2);
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
		holding2.setHoldingAmount(random.nextInt(1000));
		holding2.setHoldingRateOfReturn(random.nextDouble()*50);
		holding2.setHoldingSeq(7);
		holding2.setHoldingTotalMoney(random.nextInt(100000));
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
		data2.put("fieldName", "미디어산업");
		data2.put("fieldAmount",random.nextInt(10000000));
		result.add(data2);
		Map<String, Object> data3 = new HashMap<String, Object>();
		data3.put("fieldName", "은행");
		data3.put("fieldAmount",random.nextInt(10000000));
		result.add(data3);
		Map<String, Object> data4 = new HashMap<String, Object>();
		data4.put("fieldName", "호텔경영");
		data4.put("fieldAmount",random.nextInt(10000000));
		result.add(data4);
		Map<String, Object> data5 = new HashMap<String, Object>();
		data5.put("fieldName", "식음료");
		data5.put("fieldAmount",random.nextInt(10000000));
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
		data2.put("fieldName", "미디어산업");
		data2.put("fieldAmount",random.nextInt(10000));
		data2.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data2);
		Map<String, Object> data3 = new HashMap<String, Object>();
		data3.put("fieldName", "은행");
		data3.put("fieldAmount",random.nextInt(10000));
		data3.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data3);
		Map<String, Object> data4 = new HashMap<String, Object>();
		data4.put("fieldName", "호텔경영");
		data4.put("fieldAmount",random.nextInt(10000));
		data4.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data4);
		Map<String, Object> data5 = new HashMap<String, Object>();
		data5.put("fieldName", "식음료");
		data5.put("fieldAmount",random.nextInt(10000));
		data5.put("dayBeforeRate", (random.nextDouble()*100)-50);
		result.add(data5);
		return result;
	}
	// 회사 번호 리스트로 회사 주식 정보 리스트 받기
	@Override
	public List<Stock> getStockList(List<String> companyNumberList){
		List<Stock> stockList = new ArrayList<Stock>();
		for(int i = 0; i < companyNumberList.size(); i++) {
			stockList.add(getStockInfo("000000","아모레퍼시픽"));
		}
		return stockList;
	}
	// 회사 번호 리스트로 회사 시계열 정보 리스트 받기
	@Override
	public TimeSeries getTimeSeriesListByOne(List<String> companyNumberList, String type){
		TimeSeries timeSeries = new TimeSeries();
		for(int i = 0; i < companyNumberList.size(); i++) {
			Map<String, List<Double>> existDatas = timeSeries.getData();
			existDatas.put(companyNumberList.get(i), getTimeSeries(companyNumberList.get(i), type).getData().get(1));
			timeSeries.setData(existDatas);
		}
		return timeSeries;
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
		StockNewsCrawler crawler = new StockNewsCrawler();
		List<News> newsList = crawler.getTotalNews().subList(0, 5);
		return newsList;
	}
	@Override
	public List<AskingPrice> getAskingPrice(String companyNumber) {
		Random random = new Random();
		List<AskingPrice> result = new ArrayList<AskingPrice>();
		int price = random.nextInt(10000)+50000;
		for(int i = 0; i < 5; i++) {
			AskingPrice askingPrice = new AskingPrice();
			askingPrice.setType(0);
			askingPrice.setQuantity(random.nextInt(1000));
			askingPrice.setPrice(price);
			price = price - random.nextInt(1000);
			result.add(askingPrice);
		}
		for(int i = 0; i < 5; i++) {
			AskingPrice askingPrice = new AskingPrice();
			askingPrice.setType(1);
			askingPrice.setQuantity(random.nextInt(1000));
			askingPrice.setPrice(price);
			price = price - random.nextInt(1000);
			result.add(askingPrice);
		}
		return result;
	}
	@Override
	public List<TimeSeries> getTimeSeriesList(List<String> companyNumberList, String type) {
		List<TimeSeries> timeSeriesList = new ArrayList<TimeSeries>();
		for(int i = 0; i < companyNumberList.size(); i++) {
			timeSeriesList.add(getTimeSeries(companyNumberList.get(i), type));
		}
		return timeSeriesList;
	}
	@Override
	public Map<String, Object> getCompanyData(String companyNumber, int type) {
		StockDao stockDao = new StockDao();
		String[] date = getDate(type);
		return stockDao.getStockTotal(companyNumber, date[0], date[1], type);
	}
	//index에 필요한 값 전달.
	@Override
	public Map<String, Object> getForIndex(List<Holding> holdingList, List<String> interestCompanyNumberList, int rank) {
		StockDao stockDao = new StockDao();
		List<String> holdingCompanyNumberList = new ArrayList<String>();
		for (Holding holding : holdingList) {
			holdingCompanyNumberList.add(holding.getCompanyNumber());
		}
		List<String> companyNumberList = union(holdingCompanyNumberList, interestCompanyNumberList);
		Map<String, Object> result = stockDao.forIndex(companyNumberList, rank);
		List<Stock> stockList = (List<Stock>) result.get("stockList");
		result.remove("stockList");
		int stockTotal = 0;
		for (Holding holding : holdingList) {
			int holdingPrice = searchPrice(holding.getCompanyNumber(), stockList);
			holding.setRealTimePrice(holdingPrice);
			holding.setHoldingReturn((holdingPrice*holding.getHoldingAmount())-holding.getHoldingTotalMoney());
			holding.setHoldingRateOfReturn(holding.getHoldingReturn()/holding.getHoldingTotalMoney());
			stockTotal = stockTotal + (holdingPrice*holding.getHoldingAmount());
		}
		System.out.println(300);
		Map<String, Object> holdingWidgetMap = new Hashtable<String, Object>();
		holdingWidgetMap.put("holdingList", holdingList);
		holdingWidgetMap.put("stockTotal", stockTotal);
		result.put("holdingWidget", holdingWidgetMap);
/*		Map<String, Stock> interestMap = new HashMap<String, Stock>();
		for(String interestCompanyNumber : interestCompanyNumberList) {
			interestMap.put(interestCompanyNumber, searchStock(interestCompanyNumber, stockList));
		}*/
		System.out.println(400);
		List<Stock> interestList = new ArrayList<>();
		for(String interestCompanyNumber : interestCompanyNumberList) {
			interestList.add(searchStock(interestCompanyNumber, stockList));
		}
			
		System.out.println(500);
		result.put("interestList", interestList);
		return result;
	}
	public String[] getDate(int type) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String endDate = date.format(calendar.getTime());
		String startDate = "";
		switch (type) {
		case 1:
			startDate = date.format(calendar.getTime());
			break;
		case 2:
			calendar.add(Calendar.MONTH,-1);
			startDate = date.format(calendar.getTime());
			calendar.add(Calendar.MONTH,1);
			break;
		case 3:
			calendar.add(Calendar.MONTH, -3);
			startDate = date.format(calendar.getTime());
			calendar.add(Calendar.MONTH, 3);
			break;
		default:
			calendar.add(Calendar.YEAR, -1);
			startDate = date.format(calendar.getTime());
			calendar.add(Calendar.YEAR, 1);
			break;
		}
		String[] returnValue = new String[2];
		returnValue[0] = startDate;
		returnValue[1] = endDate;
		return returnValue;
	}
	public List<String> union(List<String> list1, List<String> list2){
	    Set<String> set = new HashSet<String>();
	    set.addAll(list1);
	    set.addAll(list2);
	    return new ArrayList<String>(set);
	}
	public int searchPrice(String companyNumber, List<Stock> stockList) {
		for(Stock stock : stockList) {
			if(stock.getStockCode().equals(companyNumber)) {
				return stock.getStockPrice();
			}
		}
		return 0;
	}
	public Stock searchStock(String companyNumber, List<Stock> stockList) {
		for(Stock stock : stockList) {
			if(stock.getStockCode().equals(companyNumber)) {
				return stock;
			}
		}
		return null;
	}
	@Override
	public Map<String, Object> getForSearchResult(List<String> companyNumberList) {
		StockDao stockDao = new StockDao();
		return stockDao.forSearch(companyNumberList);
	}
	@Override

	public TimeSeries getChartData(List<String> companyNumberList, int type, int kind) {
		StockDao stockDao = new StockDao();
		String[] date = getDate(type);
		return stockDao.getChartData(companyNumberList, date[0], date[1], type);
	}
	@Override
	public Map<String, Object> getKospiChartDate(int type) {
		StockDao stockDao = new StockDao();
		String[] date = getDate(type);
		return stockDao.getKospiChartData(date[0],date[1],type);
	}
	@Override
	public Kospi getKospiData() {
		StockDao stockDao = new StockDao();
		return (Kospi)stockDao.getKospiChartData("20181101", "20181101", 5).get("kospi");
	}
}
