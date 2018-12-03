package com.sjinvest.sos.stock.domain;

import java.util.List;

import lombok.Data;
@Data
public class TimeSeries {
	private List<String> label;
	private List<List<Double>> data;
}