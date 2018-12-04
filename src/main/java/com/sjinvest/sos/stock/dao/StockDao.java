package com.sjinvest.sos.stock.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sjinvest.sos.stock.domain.Stock;


public class StockDao {
	
	final static String apiURL = "http://54.180.117.83:8000/stock/com?";
	
	public static Stock getStockInfo(String companyNumber, String companyName) {
		String urlString = apiURL + "code="+companyNumber;
		Stock stock = new Stock();
		try {
			URL url = new URL(urlString);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			
            urlConnection.setRequestMethod("GET");
            InputStream in = urlConnection.getInputStream();
          
            BufferedReader in2 = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

            
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonMap = mapper.readTree(in);
            JsonNode code = jsonMap.get("code");
            
            
            System.out.println(code.toString().replaceAll("\"", ""));
            
            String line = "";
            while((line = in2.readLine()) != null) { 
            	System.out.println(line);
            }
            stock = mapper.readValue(new URL(urlString), Stock.class);

            //            JSONObject json = new JSONObject(getStringFromInputStream(in));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stock;
	}
	public static void main(String[] args) {
		System.out.println(getStockInfo("086790","아모레퍼시픽"));
	}
}