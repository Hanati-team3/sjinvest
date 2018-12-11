package com.sjinvest.sos.stock.dao;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sjinvest.sos.stock.domain.News;

import lombok.extern.log4j.Log4j;

@Log4j
public class StockEachNewsCrawler {

	public List<News> convertNews(List<String> companyList, JsonNode jsonMap) {
		List<News> result = new ArrayList<News>();
		for (int i = 0; i < companyList.size(); i++) {
			String companyNumber = companyList.get(i);
			JsonNode company = jsonMap.get(companyNumber);
			List<News> eachCompanyNewsList = new ArrayList<News>();
			for (JsonNode objNode : company) {
				News news = new News();
				news.setTitle(objNode.get("title").asText());
				news.setLink(objNode.get("url").asText());
				news.setDate(objNode.get("date").asText());
				news.setHeadLine(objNode.get("headline").asText());
				news.setSource(objNode.get("source").asText());
				eachCompanyNewsList.add(news);
			}
			result = union(result, eachCompanyNewsList);
		}
		Collections.sort(result, new Comparator<News>() {
			@Override
			public int compare(News n1, News n2) {
				return n2.getDate().compareTo(n1.getDate());
			}
		});

		return result;
	}

	public List<News> getNews(List<String> companyNumberList) {
		String apiURL = "http://192.168.0.129:8000/stock/news?";
		String urlString = apiURL + "code=" + convertListToString(companyNumberList);
		System.out.println(urlString);
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			InputStream in = urlConnection.getInputStream();
			ObjectMapper mapper = new ObjectMapper();
			JsonNode jsonMap = mapper.readTree(in);
			return convertNews(companyNumberList, jsonMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String convertListToString(List<String> companyNumber) {
		String result = "";
		for (int i = 0; i < companyNumber.size(); i++) {
			result = result + companyNumber.get(i);
			result = result + "+";
		}
		if (companyNumber.size() == 0) {
			return "004170";
		}
		return result.substring(0, result.length() - 1);
	}

	public List<News> union(List<News> list1, List<News> list2) {
		Set<News> set = new HashSet<News>();
		set.addAll(list1);
		set.addAll(list2);
		return new ArrayList<News>(set);
	}

	public static void main(String[] args) {
		List<String> companyNumberList = new ArrayList<String>();
		companyNumberList.add("086790");
		companyNumberList.add("005450");
		companyNumberList.add("005930");
		companyNumberList.add("008350");
		companyNumberList.add("068270");
		companyNumberList.add("215600");
		companyNumberList.add("000660");
		companyNumberList.add("000660");
		companyNumberList.add("000660");
		companyNumberList.add("000660");
		StockEachNewsCrawler senr = new StockEachNewsCrawler();
		List<News> news = senr.getNews(companyNumberList);
		for(News thiss : news) {
			System.out.println(thiss);
		}
		System.out.println(news.size());
	}
}