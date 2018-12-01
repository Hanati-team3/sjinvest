package com.sjinvest.sos.stock.service;

import java.util.List;
import java.util.Map;

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
	@Autowired
	private StockDao stockDao;
	
	@Override
	public Stock getStockInfo(String companyNumber, String companyName) {
		return stockDao.getStockInfo(companyNumber, companyName);
	}

	@Override
	public TimeSeries getTimeSeries(String companyNumber, String type) {
		// TODO Auto-generated method stub
		return stockDao.getTimeSeries(companyNumber, type);
	}

	@Override
	public List<News> getNewsList(String companyName) {
		// TODO Auto-generated method stub
		return stockDao.getNewsList(companyName);
	}

	@Override
	public List<Stock> stockRealtime() {
		// TODO Auto-generated method stub
		return stockDao.stockRealtime();
	}

	@Override
	public List<Holding> stockMyHoldingWidget() {
		// TODO Auto-generated method stub
		return stockDao.stockMyHoldingWidget();
	}

	@Override
	public List<Map<String, Object>> stockFieldAmount() {
		// TODO Auto-generated method stub
		return stockDao.stockFieldAmount();
	}

	@Override
	public List<Map<String, Object>> stockFieldDayBefore() {
		// TODO Auto-generated method stub
		return stockDao.stockFieldDayBefore();
	}

	@Override
	public List<Stock> getStockList(List<String> companyNumberList) {
		// TODO Auto-generated method stub
		return stockDao.getStockList(companyNumberList);
	}

	@Override
	public List<TimeSeries> getTimeSeriesList(List<String> companyNumberList, String type) {
		// TODO Auto-generated method stub
		return stockDao.getTimeSeriesList(companyNumberList, type);
	}

	@Override
	public Stock getStockKospiInfo() {
		// TODO Auto-generated method stub
		return stockDao.getStockKospiInfo();
	}

	@Override
	public TimeSeries getStockKospiTimeSeries() {
		// TODO Auto-generated method stub
		return stockDao.getStockKospiTimeSeries();
	}

	@Override
	public List<Map<String, Object>> stockTop(String type) {
		// TODO Auto-generated method stub
		return stockDao.stockTop(type);
	}

	@Override
	public List<News> stockIndexNews() {
		// TODO Auto-generated method stub
		return stockDao.stockIndexNews();
	}

}
