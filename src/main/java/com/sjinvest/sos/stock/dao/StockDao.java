package com.sjinvest.sos.stock.dao;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sjinvest.sos.stock.domain.AskingPrice;
import com.sjinvest.sos.stock.domain.Kospi;
import com.sjinvest.sos.stock.domain.Rank;
import com.sjinvest.sos.stock.domain.Stock;
import com.sjinvest.sos.stock.domain.StockMini;
import com.sjinvest.sos.stock.domain.TimeSeries;

import lombok.extern.log4j.Log4j;

@Log4j
public class StockDao {
	
	public Map<String, Object> getStockTotal(String companyNumber, String startDate, String endDate, int type) {
		String apiURL = "http://54.180.117.83:8008/stock/com?";
		Map<String, Object> result = new HashMap<String, Object>();
		String urlString = apiURL + "code="+companyNumber;
		if(startDate!=null && endDate!=null && type!=0) {
			urlString=urlString+"&startDate="+startDate;
			urlString=urlString+"&endDate="+endDate;
			urlString=urlString+"&type="+type;
		}
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
    		if(startDate!=null && endDate!=null && type!=0) {
                result.put("timeSeries", convertTimeSeries(companyNumber, jsonMap));
    		}
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
	public TimeSeries convertListTimeSeries(List<String> companyNumber, JsonNode jsonMap) {
        JsonNode com = jsonMap.get("com");
        TimeSeries timeSeries = new TimeSeries();
        Map<String, List<Double>> datas = new HashMap<String, List<Double>>();
        boolean first =true;
        int index = 0;
        for(JsonNode objNode : com) {
            List<String> dataName = new ArrayList<String>();
        	List<Double> data = new ArrayList<Double>();
        	for(JsonNode objInNode : objNode) {
        		data.add(objInNode.get("close").asDouble());
        		dataName.add(objInNode.get("date").asText());
        	}
        	datas.put(companyNumber.get(index),data);
        	index = index +1;
            timeSeries.setDataName(dataName);
            timeSeries.setLabel(dataName);
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
		return result.substring(0,result.length()-1);
	}
	public Map<String, Object> forIndex(List<String> companyNumberList,int rank){
		Map<String, Object> result = new HashMap<String, Object>();
		String apiURL = "http://54.180.117.83:8000/stock?";
		String urlString = apiURL + "code="+convertListToString(companyNumberList);
		urlString = urlString+"&rank="+rank;
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            System.out.println("연결");
            result.put("realTime", convertStockMiniList(jsonMap, "realTime"));
            result.put("topTab", convertStockTop(jsonMap));
            result.put("stockList", convertStockList(jsonMap,"OwnStock"));
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
	public TimeSeries getChartData(List<String> companyNumberList, String startDate, String endDate, int type) {
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
            return convertListTimeSeries(companyNumberList, jsonMap);
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
	public static void main(String[] args) {
		StockDao stockDao = new StockDao();
		List<String> companyList = new ArrayList<String>();
		companyList.add("086790");
		companyList.add("004170");
		System.out.println(stockDao.getChartData(companyList, "20181205", "20181206", 2));
	}
}