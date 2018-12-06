package com.sjinvest.sos.stock.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sjinvest.sos.stock.domain.News;

public class StockNewsCrawler {
	public List<News> getTotalNews() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String todayDate = date.format(calendar.getTime());
		List<News> result = new ArrayList<News>();
		String URL = "https://finance.naver.com/news/mainnews.nhn?date="+todayDate;
		try {
			Connection.Response response = Jsoup.connect(URL)
			        .method(Connection.Method.GET)
			        .execute();
			Document newsDocument = response.parse();
			Elements newsList = newsDocument.getElementsByClass("newsList");
			Elements newsListLi = newsList.get(0).getElementsByTag("li");
			for(Element eachNews : newsListLi) {
				Element thisNews = eachNews.getElementsByTag("dl").get(0);
				News news = new News();
				Element articleSubject = thisNews.getElementsByClass("articleSubject").get(0);
				Element articleSummary = thisNews.getElementsByClass("articleSummary").get(0);
				news.setTitle(articleSubject.getElementsByTag("a").text());
				news.setLink("https://finance.naver.com"+articleSubject.getElementsByTag("a").get(0).attr("href"));
				news.setSource(articleSummary.getElementsByClass("press").get(0).text());
				news.setDate(articleSummary.getElementsByClass("wdate").get(0).text());
				articleSummary.getElementsByClass("press").get(0).remove();
				articleSummary.getElementsByClass("wdate").get(0).remove();
				articleSummary.getElementsByClass("bar").get(0).remove();
				news.setHeadLine(articleSummary.text());
				result.add(news);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;

	}
	public List<News> getCompanyNews(String companyNumber) {
		List<News> result = new ArrayList<News>();
//		String URL = "https://finance.naver.com/item/news.nhn?code="+companyNumber;
		String URL = "https://search.naver.com/search.naver?query=%ED%95%98%EB%82%98%EA%B8%88%EC%9C%B5%EC%A7%80%EC%A3%BC&where=news&ie=utf8&sm=nws_hty";
		System.out.println(URL);
		try {
			Connection.Response response = Jsoup.connect(URL)
			        .method(Connection.Method.GET)
			        .execute();
			Document newsDocument = response.parse();
			System.out.println(newsDocument.html());
			Elements newsList = newsDocument.getElementsByClass("tb_cont");
			System.out.println("test");
			System.out.println(newsList.get(0).html());
//			Elements newsListLi = newsList.get(0).getElementsByTag("li");
//			for(Element eachNews : newsListLi) {
//				Element thisNews = eachNews.getElementsByTag("dl").get(0);
//				News news = new News();
//				Element articleSubject = thisNews.getElementsByClass("articleSubject").get(0);
//				Element articleSummary = thisNews.getElementsByClass("articleSummary").get(0);
//				news.setTitle(articleSubject.getElementsByTag("a").text());
//				news.setLink("https://finance.naver.com"+articleSubject.getElementsByTag("a").get(0).attr("href"));
//				news.setSource(articleSummary.getElementsByClass("press").get(0).text());
//				news.setDate(articleSummary.getElementsByClass("wdate").get(0).text());
//				articleSummary.getElementsByClass("press").get(0).remove();
//				articleSummary.getElementsByClass("wdate").get(0).remove();
//				articleSummary.getElementsByClass("bar").get(0).remove();
//				news.setHeadLine(articleSummary.text());
//				result.add(news);
//			}
		} catch (IOException e) { 
			e.printStackTrace();
			System.out.println(e);
		}
		return result;

	}
	public static void main(String[] args) {
		StockNewsCrawler crawler = new StockNewsCrawler();
//		crawler.getTotalNews();
		crawler.getCompanyNews("005380");
	}
}
