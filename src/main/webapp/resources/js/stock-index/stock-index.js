
/** 2초마다 업종별 정보, 관심종목의 Stock정보(차트빼고), 코스피의 Stock정보(차트빼고), 열려진 탭의 Top 정보 업데이트 */
function indexUpdate(indexParam) {
	if(INDEX.flag) {
		$.ajax({
			type : "POST",
			url : "index/update",
			dataType : "json",
			contentType: "application/json; charset=utf-8",
			data : JSON.stringify(indexParam),
			success : function(stockData) {
				console.log("stockData .. ");
				console.log(stockData);
				if(!(INDEX.isEmptyInterest)) setInterestCard(stockData.interestList);
				setKospiCard(stockData.kospiStock);
				setTopTab(stockData.topTab, stockData.topTabOption);
				setTimeout(indexUpdate(setIndexParam()), 2000);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
}

/* tab을 클릭하면 발생하는 일회성 데이터 요청 */
function topTabUpdate(target) {
	var tabOption;
	// 활성화된 탭 검사
	switch(target.split('#')[1]) {
	//상승률 상위 5
	case INDEX.tabList[0] :
		console.log("tab 1");
		tabOption = 1;
		break;
	// 하락률 상위 5
	case INDEX.tabList[1] :
		console.log("tab 2");
		tabOption = 2;
		break;
	// 외국인 순매수 3
	case INDEX.tabList[2] :
		console.log("tab 3");
		tabOption = 3;
		break;
	// 기관 순매수 3
	case INDEX.tabList[3] :
		console.log("tab 4");
		tabOption = 4;
		break;
	// 거래량 20
	case INDEX.tabList[4] :
		console.log("tab 5");
		tabOption = 5;
		break;
	// 시가총액 20
	case INDEX.tabList[5] :
		console.log("tab 6");
		tabOption = 6;
		break;
	}
	
	$.ajax({
		type : "POST",
		url : "index/tab/"+tabOption,
		dataType : "json",
		contentType: "application/json; charset=utf-8",
		success : function(topData) {
			console.log("topData .. ");
			console.log(topData);
			setTopTab(topData, tabOption);
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

/** 차트데이터 요청을 보내서 차트를 업데이트하는 함수 */
//companyNumberList
function allChartUpdate(interestCompanyNumberList, kospiOption) {
	console.log('interestCompanyNumberList : ' + interestCompanyNumberList);
	console.log('kospiOption : ' + kospiOption);
	if(INDEX.flag) {
		$.ajax({
			type : "POST",
			url : "index/chart",
			datatype: 'json',
			traditional: true,
			data : JSON.stringify({
				"interestCompanyNumberList" : interestCompanyNumberList,
				"kospiOption" : kospiOption
			}),
			contentType: "application/json; charset=utf-8",
			success : function(chartData) {
				console.log("chartData .. ");
				console.log(chartData);
				// 코스피 차트 그리기
				//runKospiChart(getKospiFromRequest(), true);
				// 관심종목 차트 그리기
				//runInterestChart(getInterestFromRequest(), true);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

}

/** 업종별 거래량 카드 업데이트 */ 
function updateField() {
	console.log('updateField....');
	if(INDEX.flag) {
		$.ajax({
			type : "GET",
			url : "index/field",
			datatype: 'json',
			contentType: "application/json; charset=utf-8",
			success : function(fieldList) {
				console.log("fieldList .. ");
				console.log(fieldList);
				console.log([fieldList[0][1], fieldList[1][1], fieldList[2][1], fieldList[3][1], fieldList[4][1] ]);
				// 파이차트 업데이트
				INDEX.fieldChartEl.data.datasets[0].data = [ fieldList[0][1], fieldList[1][1], fieldList[2][1], fieldList[3][1], fieldList[4][1] ];
				INDEX.fieldChartEl.update(0);
				var sum = 0;
				// 데이터 필드 업데이트
				$('.stock-index-trend li').each(function(index, item){
					var eachValue = Number(fieldList[index][1]);
					$(item).find(".count-stat").text( numberWithCommas((eachValue / 1000).toFixed(0)) + "K");
					sum += Number(eachValue);
				});
				console.log('sum : ' + sum);
				$('.stock-index-trend .chart-js-pie-color div').html( numberWithCommas((sum / 1000).toFixed(0)) + "K <span>5개 업종의 거래량 합</span>");
				setTimeout(updateField(), 6000);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	};
}

/** 관심종목 카드 데이터 */
function setInterestCard(interestList) {
	$(".stock-my-interest .swiper-wrapper .swiper-slide").each(function(index, item){
		for (var i = 0; i < interestList.length; i++) {
			if($(item).find(".company-name a").text() == interestList[i].stockName) {
				$(item).find(".company-stock").text(interestList[i].stockPrice.toLocaleString());
				$(item).find(".indicator").html("전일대비 " + interestList[i].stockChange.toLocaleString() + 
						"&nbsp;&nbsp;" + interestList[i].stockDiff +"%");
				if(interestList[i].stockDiff > 0) {
					$(item).find(".company-stock").removeClass('minus').addClass('plus');
					$(item).find(".indicator").removeClass('minus').addClass('plus');
				}
				else {
					$(item).find(".company-stock").removeClass('plus').addClass('minus');
					$(item).find(".indicator").removeClass('plus').addClass('minus');
				}
				break;
			}
		}
	});
}

/** 관심종목 카드 차트 */
function runInterestChart(interestListChart, isFirst) {
	var lineStackedCharts = document.getElementsByName("interest-line-stacked-chart");
	if(lineStackedCharts == null) {
		console.log("인터레스트 차트 없음");
		return;
	}
	window.chartList = lineStackedCharts;
	// 각 차트에 대해 
	for (var i = 0; i < lineStackedCharts.length; i++) {
		var lineStackedChart = lineStackedCharts[i];
		// 각 interest 항목에 대해
		for(var j = 0; j < interestListChart.dataList.length;  j++) {
			if(lineStackedChart.getAttribute("target") == interestListChart.nameList[j]) {
				var eachData = interestListChart.dataList[j];
			    var ctx_ls = lineStackedChart.getContext("2d");
			    var data_ls = {
			        labels: interestListChart.label,
			        datasets: [
			            {
			                label: " 원 ",
			                backgroundColor: "rgba(57,169,255,0.35)",
			                borderColor: "#38a9ff",
			                borderWidth: 2,
			                pointBorderColor: "#38a9ff",
			                pointBackgroundColor: "#fff",
			                pointBorderWidth: 1,
			                pointRadius: 1,
			                pointHoverRadius: 1,
			                data: eachData
			            }]
			    };

			    var myLineStackedEl = new Chart(ctx_ls, {
			        type: 'line',
			        data: data_ls,
			        options: {
			            legend: {
			                display: false
			            },
			            responsive: true,
			            scales: {
			                xAxes: [{
			                    gridLines: {
			                        color: "#f0f4f9"
			                    },
			                    ticks: {
			                        fontColor: '#888da8'
			                    }
			                }],
			                yAxes: [{
			                    gridLines: {
			                        display: false
			                    },
			                    ticks: {
			                        fontColor: '#888da8'
			                    }
			                }]
			            }
			        }
			    });
			    myLineStackedEl.update();
				break;
			}
			else {
			}
		}
	}
}

/** 코스피 카드 데이터 설정 */
function setKospiCard(kospiStock) {
	var statList = $(".stock-kospi-card .text-stat").find('.count-stat');
	$(statList[0]).text(kospiStock.price.toLocaleString());
	$(statList[1]).text(kospiStock.high.toLocaleString());
	$(statList[2]).text(kospiStock.low.toLocaleString());
	$(statList[3]).text(kospiStock.lastPrice.toLocaleString());
	$(statList[4]).text(kospiStock.volume.toLocaleString());
}

/** 코스피 카드 차트 설정*/
function runKospiChart(kospiTimeSeries, isFirst) {
	var lineChart = document.getElementById("kospi-line-chart");
	/*
	 *  Yearly Line Graphic
	 * 26-Statistics.html
	 */
	if (lineChart !== null) {
	    var ctx_lc = lineChart.getContext("2d");
	    var data_lc = {
	        labels: kospiTimeSeries.label,
	        datasets: [
	            {
	                label: " - Comments",
	                borderColor: "#ffdc1b",
	                borderWidth: 4,
	                pointBorderColor: "#ffdc1b",
	                pointBackgroundColor: "#fff",
	                pointBorderWidth: 3,
	                pointRadius: 1,
	                pointHoverRadius: 1,
	                fill: false,
	                lineTension:0,
	                data: kospiTimeSeries.data
	            }]
	    };
	    
	    INDEX.config = {
		        type: 'line',
		        data: data_lc,
		        options: {
		            legend: {
		                display: false
		            },
		            responsive: true,
		            scales: {
		                xAxes: [{
		                	/*type: 'time',*/
		                    ticks: {
		                        fontColor: '#888da8'/*,
		                        stepSize: 10,
		                        unitStepSize: 10*/
		                    },
		                    gridLines: {
		                        color: "#f0f4f9"
		                    }/*,
		                    time: { 
			                    unit: 'second', 
			                    unitStepSize: '60', 
			                    format: "HHmmss", 
			                    displayFormats: { 
			                    	second: 'H:mm'
			                    } 
		                    }*/
		                }],
		                yAxes: [{
		                    gridLines: {
		                        color: "#f0f4f9"
		                    },
		                    ticks: {
		                        fontColor: '#888da8'
		                    }
		                }]
		            }
		        }
		    }
	    if(isFirst) {
		    lineChartEl = new Chart(ctx_lc, INDEX.config);
	    }
	    else {
	    	lineChartEl.update();
	    }
	}
}

/** 상위 종목 카드 설정 함수 */
function setTopTab(topTab, topTabOption) {
	var activeTab = $(".stock-top-tab .tab-content").find('.active');
	if($(activeTab).attr('id') != INDEX.tabList[topTabOption - 1]) {
		console.log('다른 탭 요청 들어옴');
		return;
	}
	// 활성화된 탭 검사
	switch($(activeTab).attr('id')) {
	//상승률 상위 5
	case INDEX.tabList[0] :
		runOneBarChart(topTab, 'rising-rate-chart');
		break;
	// 하락률 상위 5
	case INDEX.tabList[1] :
		runOneBarChart(topTab, 'falling-rate-chart');
		break;
	// 외국인 순매수 3
	case INDEX.tabList[2] :
		runOneBarChart(topTab, 'foreigner-chart');
		break;
	// 기관 순매수 3
	case INDEX.tabList[3] :
		runOneBarChart(topTab, 'institution-chart');
		break;
	// 거래량 20
	case INDEX.tabList[4] :
		runOneBarChart(topTab, 'trading-amount-chart');
		break;
	// 시가총액 20
	case INDEX.tabList[5] :
		runOneBarChart(topTab, 'total-money-chart');
		break;
	}
}

/** Top10 차트 함수 */
function runOneBarChart(topTab, id) {
	var nameList = [];
	var dataList = [];
	for(var i = 0; i < topTab.length; i++) {
		nameList.push(topTab[i].stockName);
		dataList.push(topTab[i].stockValue);
	}
	var oneBarChart = document.getElementById(id);
	if (oneBarChart !== null) {
	    var ctx_ob = oneBarChart.getContext("2d");
	    var data_ob = {
	        labels: nameList,
	        datasets: [
	            {
	                backgroundColor: "#38a9ff",
	                data: dataList
	            }]
	    };

	    var oneBarEl = new Chart(ctx_ob, {
	        type: 'bar',
	        data: data_ob,

	        options: {
	            deferred: {           // enabled by default
	                delay: 200        // delay of 500 ms after the canvas is considered inside the viewport
	            },
	            tooltips: {
	                enabled:true
	            },
	            legend: {
	                display: false
	            },
	            responsive: true,
	            scales: {
	                xAxes: [{
	                    stacked: true,
	                    barPercentage:0.6,
	                    gridLines: {
	                        display: false
	                    },
	                    ticks: {
	                        fontColor: '#888da8'
	                    }
	                }],
	                yAxes: [{
	                    stacked: true,
	                    gridLines: {
	                        color: "#f0f4f9"
	                    },
	                    ticks: {
	                        beginAtZero:true,
	                        fontColor: '#888da8'
	                    }
	                }]
	            }
	        }
	    });
	}
}
