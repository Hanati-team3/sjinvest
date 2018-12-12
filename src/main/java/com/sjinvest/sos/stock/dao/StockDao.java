package com.sjinvest.sos.stock.dao;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sjinvest.sos.stock.domain.AskingPrice;
import com.sjinvest.sos.stock.domain.Kospi;
import com.sjinvest.sos.stock.domain.News;
import com.sjinvest.sos.stock.domain.Rank;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.StockMini;
import com.sjinvest.sos.stock.domain.TimeSeries;

import lombok.extern.log4j.Log4j;

@Log4j
public class StockDao {
	
	public Map<String, Object> getStockTotal(String companyNumber) {
		String apiURL = "http://54.180.117.83:8001/stock/com?";
		Map<String, Object> result = new HashMap<String, Object>();
		String urlString = apiURL + "code="+companyNumber;
		log.info(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            result.put("stock", convertStock(jsonMap));
            result.put("askingPriceList", convertAskingPriceList(jsonMap));
            result.put("realTime", convertStockMiniList(jsonMap, "realTime"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	public Map<String, Object> getTimeSeries(String companyNumber, int type){
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	public Map<String, Object> getStockTotalList(List<String> companyNumberList){
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	public Stock convertStock(JsonNode jsonMap) {
        JsonNode stockCode = jsonMap.get("stockCode");
        JsonNode stockName = jsonMap.get("stockName");
        JsonNode stockPrice = jsonMap.get("stockPrice");
        JsonNode stockChange = jsonMap.get("stockChange");
        JsonNode stockDiff = jsonMap.get("stockDiff");
        JsonNode stockVolume = jsonMap.get("stockVolume");
        JsonNode stockHigh = jsonMap.get("stockHigh");
        JsonNode stockLow = jsonMap.get("stockLow");
        JsonNode stockVolumeBefore = jsonMap.get("stockVolumeBefore");
        JsonNode stockPer = jsonMap.get("per");
        JsonNode stockTotal = jsonMap.get("total");
        JsonNode stockClosingPrice = jsonMap.get("stockClosingPrice");
        JsonNode stockListing = jsonMap.get("listing");
        JsonNode stockListDate = jsonMap.get("listdate");
        JsonNode stockFwdvl = jsonMap.get("fwdvl");
        JsonNode stockFtradmdcha = jsonMap.get("ftradmdcha");
        JsonNode stockFtradmddiff = jsonMap.get("ftradmddiff");
        JsonNode stockFwsvl = jsonMap.get("fwsvl");
        JsonNode stockFtradmscha = jsonMap.get("ftradmscha");
        JsonNode stockFtradmsdiff = jsonMap.get("ftradmsdiff");
        JsonNode stockBfsales = jsonMap.get("bfsales");
        JsonNode stockBfnetincome = jsonMap.get("bfnetincome");
        JsonNode stockSalert = jsonMap.get("salert");
        JsonNode stockNetrt = jsonMap.get("netrt");
        Stock stock = new Stock();
        stock.setBfnetincome(stockBfnetincome.asInt());
        stock.setBfsales(stockBfsales.asInt());
        stock.setFwdvl(stockFwdvl.asInt());
        stock.setFtradmdcha(stockFtradmdcha.asInt());
        stock.setFtradmddiff(stockFtradmddiff.asDouble());
        stock.setFwsvl(stockFwsvl.asInt());
        stock.setFtradmscha(stockFtradmscha.asInt());
        stock.setFtradmsdiff(stockFtradmsdiff.asDouble());
        stock.setListdate(stockListDate.asText());
        stock.setListing(stockListing.asInt());
        stock.setNetrt(stockNetrt.asDouble());
        stock.setPer(stockPer.asDouble());
        stock.setSalert(stockSalert.asDouble());
        stock.setStockChange(stockChange.asInt());
        stock.setStockCode(stockCode.asText());
        stock.setStockDiff(stockDiff.asDouble());
        stock.setStockHigh(stockHigh.asInt());
        stock.setStockLow(stockLow.asInt());
        stock.setStockName(stockName.asText());
        stock.setStockPrice(stockPrice.asInt());
        stock.setStockVolume(stockVolume.asInt());
        stock.setStockVolumeBefore(stockVolumeBefore.asInt());
        stock.setTotal(stockTotal.asInt());
        return stock;
	}
	public Map<String, Object> convertKospi(JsonNode jsonMap) {
        JsonNode kospis = jsonMap.get("kospi");
        Map<String, Object> result = new HashMap<String, Object>();
        boolean first = true;
        if(kospis.isArray()) {
        	List<String> label = new ArrayList<String>();
        	List<String> dataName = new ArrayList<String>();
        	Map<String, List<Double>> datas = new HashMap<String, List<Double>>();
        	List<Double> data = new ArrayList<Double>();
        	for(JsonNode objNode : kospis) {
             	if(first) {
                    Kospi kospi = new Kospi();
                    kospi.setHigh(objNode.get("high").asDouble());
                    kospi.setPrice(objNode.get("price").asDouble());
                    kospi.setLow(objNode.get("low").asDouble());
                    kospi.setLastPrice(objNode.get("lastPrice").asDouble());
                    kospi.setVolume(objNode.get("volume").asInt());
                    result.put("kospiStock", kospi);
                    first = false;
             		continue;
            	}
             	label.add(objNode.get("date").asText());
             	dataName.add(objNode.get("date").asText());
             	data.add(objNode.get("close").asDouble());
        	}
        	datas.put("kospi",data);
        	TimeSeries timeSeries = new TimeSeries();
        	timeSeries.setData(datas);
        	timeSeries.setDataName(dataName);
        	timeSeries.setLabel(label);
        	result.put("kospiTimeSeries", timeSeries);
        }
        return result;
	}
	public Kospi convertKospiInpo(JsonNode jsonMap) {
        JsonNode kospiNode = jsonMap.get("kospi");
        Kospi kospi = new Kospi();
        kospi.setHigh(kospiNode.get(0).get("high").asDouble());
        kospi.setPrice(kospiNode.get(0).get("price").asDouble());
        kospi.setLow(kospiNode.get(0).get("low").asDouble());
        kospi.setLastPrice(kospiNode.get(0).get("lastPrice").asDouble());
        kospi.setVolume(kospiNode.get(0).get("volume").asInt());
        return kospi;
	}
	public List<Stock> convertStockList(JsonNode jsonMap,String nodeName){
        JsonNode ownStock = jsonMap.get(nodeName);
        List<Stock> stockList = new ArrayList<Stock>();
        if(ownStock.isArray()) {
        	for(JsonNode objNode : ownStock) {
        		stockList.add(convertStock(objNode));
        	}
        }
        return stockList;
	}
	public List<StockMini> convertStockMiniList(JsonNode jsonMap, String nodeName){
        JsonNode stockMini = jsonMap.get(nodeName);
        List<StockMini> stockMiniList = new ArrayList<StockMini>();
        if(stockMini.isArray()) {
        	for(JsonNode objNode : stockMini) {
        		StockMini thisStockMini = new StockMini();
        		thisStockMini.setForRate(objNode.get("for_rate").asDouble());
        		thisStockMini.setRate(objNode.get("rate").asDouble());
        		thisStockMini.setTotal(objNode.get("total").asInt());
        		thisStockMini.setStockName(objNode.get("stockName").asText());
        		thisStockMini.setStockCode(objNode.get("stockCode").asText());
        		stockMiniList.add(thisStockMini);
        	}
        }
        return stockMiniList;
	}
	public List<String[]> convertField(JsonNode jsonMap, List<String> fieldNameList){
        List<String[]> fieldList = new ArrayList<String[]>();
        for(String fieldName : fieldNameList) {
    		String[] temp = new String[2];
    		temp[0] = fieldName;
    		temp[1] = jsonMap.get(fieldName).asText();
    		fieldList.add(temp);
        }
        return fieldList;
	}
	public List<Rank> convertStockTop(JsonNode jsonMap){
        JsonNode rankNode = jsonMap.get("rank");
        List<Rank> rankList = new ArrayList<Rank>();
        if(rankNode.isArray()) {
        	for(JsonNode objNode : rankNode) {
        		Rank rank = new Rank();
        		rank.setStockName(objNode.get("stockName").asText());
        		rank.setStockCode(objNode.get("stockCode").asText());
        		rank.setStockValue(objNode.get("stockValue").asDouble());
        		rankList.add(rank);
        	}
        }
        return rankList;
	}
	public List<AskingPrice> convertAskingPriceList(JsonNode jsonMap){
        JsonNode askingPrice = jsonMap.get("askingPrice");
        List<AskingPrice> askingPriceList = new ArrayList<AskingPrice>();
        if(askingPrice.isArray()) {
        	for(JsonNode objNode : askingPrice) {
        		for(int i = 5; i > 0; i--) {
        			AskingPrice thisAskingPrice = new AskingPrice();
        			thisAskingPrice.setPrice(objNode.get("offerho"+i).asInt());
        			thisAskingPrice.setQuantity(objNode.get("offerrem"+i).asInt());
        			thisAskingPrice.setIncrease(objNode.get("preoffercha"+i).asInt());
        			thisAskingPrice.setType(0);
        			askingPriceList.add(thisAskingPrice);
        		}
        		for(int i = 1; i < 6; i++) {
        			AskingPrice thisAskingPrice = new AskingPrice();
        			thisAskingPrice.setPrice(objNode.get("bidho"+i).asInt());
        			thisAskingPrice.setQuantity(objNode.get("bidrem"+i).asInt());
        			thisAskingPrice.setIncrease(objNode.get("prebidcha"+i).asInt());
        			thisAskingPrice.setType(1);
        			askingPriceList.add(thisAskingPrice);
        		}
        	}
        }
        return askingPriceList;
	}
	public TimeSeries convertTimeSeries(String companyNumber, JsonNode jsonMap) {
        JsonNode period = jsonMap.get("period");
        TimeSeries timeSeries = new TimeSeries();
        List<Double> data = new ArrayList<Double>();
        List<String> dataName = new ArrayList<String>();
        if(period.isArray()) {
        	for(JsonNode objNode : period) {
        		data.add(objNode.get("close").asDouble());
        		dataName.add(objNode.get("date").asText());
        	}
        }
        Map<String, List<Double>> datas = new HashMap<String, List<Double>>();
        datas.put(companyNumber,data);
        timeSeries.setData(datas);
        timeSeries.setDataName(dataName);
        timeSeries.setLabel(dataName);
        return timeSeries;
	}
	public TimeSeries convertListTimeSeries(List<String> companyNumber, JsonNode jsonMap, int type) {
		log.info("log info.... dao convertListTimeSeries..");
		System.out.println("sysout.... dao convertListTimeSeries..");
		if(companyNumber.size() == 0) {
			return new TimeSeries();
		}
        JsonNode com = jsonMap.get("com");
        TimeSeries timeSeries = new TimeSeries();
        Map<String, List<Double>> datas = new HashMap<String, List<Double>>();
        int index = 0;
        for(JsonNode objNode : com) {
        	System.out.println(objNode);
            List<String> dataName = new ArrayList<String>();
            List<String> label = new ArrayList<String>();
            List<Double> data = new ArrayList<Double>();
        	int innerIndex = 0;
        	for(JsonNode objInNode : objNode) {
        		data.add(objInNode.get("close").asDouble());
        		if(type == 1) {
            		dataName.add("'"+objInNode.get("date").asText().substring(0,2)+":"+objInNode.get("date").asText().substring(2,3)+"0'");
            		if(innerIndex%5 == 0) {
                		label.add("'"+objInNode.get("date").asText().substring(0,2)+":"+objInNode.get("date").asText().substring(2,3)+"0'");
            		}else {
            			label.add("");
            		}
        		}else if(type == 2){
            		dataName.add("'"+objInNode.get("date").asText().substring(4, 6)+"월"+objInNode.get("date").asText().substring(6, 8)+"일'");
            		label.add("'"+objInNode.get("date").asText().substring(4, 6)+"월"+objInNode.get("date").asText().substring(6, 8)+"일'");
        		}else if(type == 3){
        			String YYYY = objInNode.get("date").asText().substring(0, 4);
        			String MM = objInNode.get("date").asText().substring(4, 6);
        			String DD = objInNode.get("date").asText().substring(6, 8);
        			int year = Integer.parseInt(YYYY);
        			int month = Integer.parseInt(MM)-1;
        			int day = Integer.parseInt(DD);
        			Calendar cal = Calendar.getInstance();
        			cal.set(year,month,day);
        			int week = cal.get(Calendar.WEEK_OF_MONTH);
        			dataName.add("'"+MM+"월 "+week+"주차"+"'");
            		label.add("'"+MM+"월 "+week+"주차"+"'");
        		}else if(type == 4){
        			String YYYY = objInNode.get("date").asText().substring(2, 4);
        			String MM = objInNode.get("date").asText().substring(4, 6);
        			dataName.add("'"+YYYY+"년 "+MM+"월"+"'");
            		label.add("'"+YYYY+"년 "+MM+"월"+"'");
        		}
        		innerIndex = innerIndex +1;
        	}
        	datas.put(companyNumber.get(index),data);
        	index = index +1;
            timeSeries.setDataName(dataName);
            timeSeries.setLabel(label);
        }
        timeSeries.setData(datas);
        System.out.println(timeSeries);
        return timeSeries;
	}
	public Map<String, Object> convertKospiListTimeSeries(JsonNode jsonMap) {
		Map<String, Object> result = new HashMap<String, Object>();
        JsonNode period = jsonMap.get("kospi");
        TimeSeries timeSeries = new TimeSeries();
        List<Double> data = new ArrayList<Double>();
        List<String> dataName = new ArrayList<String>();
        if(period.isArray()) {
        	boolean first = true;
        	for(JsonNode objNode : period) {
        		if(first) {
                    Kospi kospi = new Kospi();
                    kospi.setHigh(objNode.get("high").asDouble());
                    kospi.setPrice(objNode.get("price").asDouble());
                    kospi.setLow(objNode.get("low").asDouble());
                    kospi.setLastPrice(objNode.get("lastPrice").asDouble());
                    kospi.setVolume(objNode.get("volume").asInt());
                    result.put("kospi", kospi);
        			first=false;
        			continue;
        		}
        		data.add(objNode.get("close").asDouble());
        		dataName.add(objNode.get("date").asText());
        	}
        }
        Map<String, List<Double>> datas = new HashMap<String, List<Double>>();
        datas.put("kospi", data);
        timeSeries.setData(datas);
        timeSeries.setDataName(dataName);
        timeSeries.setLabel(dataName);
        result.put("kospiChart", timeSeries);
        return result;
	}
	public String convertListToString(List<String> companyNumber) {
		String result = "";
		for(int i = 0; i < companyNumber.size(); i++) {
			result = result+companyNumber.get(i);
			result = result+"+";
		}
		if(companyNumber.size() == 0) {
			return "004170";
		}
		return result.substring(0,result.length()-1);
	}
	public Map<String, Object> forIndex(List<String> companyNumberList,int rank){
		Map<String, Object> result = new HashMap<String, Object>();
		String apiURL = "http://54.180.117.83:8000/stock?";
		String urlString = apiURL + "code="+convertListToString(companyNumberList);
		urlString = urlString+"&rank="+rank;
		log.info("dao forIndex....");
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            result.put("realTime", convertStockMiniList(jsonMap, "realTime"));
            result.put("topTab", convertStockTop(jsonMap));
            result.put("stockList", convertStockList(jsonMap,"OwnStock"));
            result.put("kospi", convertKospiInpo(jsonMap));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;

	}
	public Map<String, Object> forSearch(List<String> companyNumberList){
		Map<String, Object> result = new HashMap<String, Object>();
		String apiURL = "http://54.180.117.83:8000/stock?";
		String urlString = apiURL + "code="+convertListToString(companyNumberList);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            result.put("realTime", convertStockMiniList(jsonMap, "realTime"));
            result.put("stockList", convertStockList(jsonMap,"OwnStock"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	public Map<String, Object> forHolding(List<String> companyNumberList){
		log.info("dao forHolding....");
		Map<String, Object> result = new HashMap<String, Object>();
		String apiURL = "http://54.180.117.83:8000/stock?";
		String urlString = apiURL + "code="+convertListToString(companyNumberList);
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            result.put("realTime", convertStockMiniList(jsonMap, "realTime"));
            result.put("stockList", convertStockList(jsonMap,"OwnStock"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	public TimeSeries getChartData(List<String> companyNumberList, String startDate, String endDate, int type) {
		log.info("dao forHolding...");
		TimeSeries result = new TimeSeries();
		String apiURL = "http://54.180.117.83:8003/stock/chart?";
		String urlString = apiURL + "code="+convertListToString(companyNumberList)+"&startDate="+startDate+"&endDate="+endDate+"&type="+type;
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            return convertListTimeSeries(companyNumberList, jsonMap, type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	public Map<String, Object> getKospiChartData(String kstartDate, String kendDate, int ktype) {
		TimeSeries result = new TimeSeries();
		String apiURL = "http://54.180.117.83:8003/stock/chart?";
		String urlString = apiURL + "kstartDate="+kstartDate+"&kendDate="+kendDate+"&ktype="+ktype;
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            return convertKospiListTimeSeries(jsonMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public Map<String, Object> getChartDataWithKospi(List<String> companyNumberList, String startDate, String endDate, int type, String kStartDate, String kEndDate, int kType) {
		Map<String, Object> map = new HashMap<String, Object>();
		TimeSeries result = new TimeSeries();
		String apiURL = "http://54.180.117.83:8003/stock/chart?";
		String urlString = apiURL + "code="+convertListToString(companyNumberList)+"&startDate="+startDate+"&endDate="+endDate+"&type="+type+"&kstartDate="+kStartDate+"&kendDate="+kEndDate+"&ktype="+kType;
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            map.put("chart", convertListTimeSeries(companyNumberList, jsonMap, type));
            map.put("kospiChart", convertKospiListTimeSeries(jsonMap).get("kospiChart"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	public List<Rank> getRank(int type) {
		String apiURL = "http://54.180.117.83:8008/rank?";
		String urlString = apiURL + "rank="+type;
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            return convertStockTop(jsonMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<String[]> getField(List<String> fieldNameList) {
		String apiURL = "http://54.180.117.83:8005/stock/field";
		String urlString = apiURL + "";
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            return convertField(jsonMap, fieldNameList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<News> getStockEachNews(List<String> companyNumberList){
		StockEachNewsCrawler senr = new StockEachNewsCrawler();
		return senr.getNews(companyNumberList);
	}
	public static void main(String[] args) {
		StockDao stockDao = new StockDao();
		List<String> companyList = new ArrayList<String>();
		companyList.add("086790");
		companyList.add("004170");
//		System.out.println(stockDao.getChartDataWithKospi(companyList, "20181208", "20181208", 1,"20181201","20181208",2));
		List<String> fieldNameList = new ArrayList<String>();
		fieldNameList.add("IT/게임");
		fieldNameList.add("은행");
		fieldNameList.add("화장품");
		fieldNameList.add("쇼핑/백화점");
		fieldNameList.add("자동차");
//		List<String[]> fields = stockDao.getField(fieldNameList);
//		for(String[] temp : fields) {
//			System.out.println(temp[0] + " " + temp[1]);
//		}
		System.out.println(stockDao.forSearch(companyList));
		
	}
}