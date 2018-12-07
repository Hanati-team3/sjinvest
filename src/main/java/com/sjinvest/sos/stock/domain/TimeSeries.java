package com.sjinvest.sos.stock.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;
@Data
public class TimeSeries {
	private List<String> label;
	private List<String> dataName;
	private Map<String, List<Double>> data;
}