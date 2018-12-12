var INDEX = {};	//stock-index 전역변수
INDEX.tabList = ["rising-rate", "falling-rate", "foreigner", "institution", "trading-amount", "total-value"];
// index update를 활성화/중지
INDEX.flag = true;
INDEX.isEmptyInterest = false;

INDEX.interestSize = 0;
INDEX.fieldChartEl = null;													/** 업종별 거래량 차트 */
INDEX.interestChartEls = [];												/** 관심종목 차트 elements들 */
INDEX.kospiChartEl = null;				
INDEX.eachTabChartEls = [false, false, false, false, false, false];	// 차트 처음 만들어지면 차트element 넣기. false이면 처음 만들어질 때.
INDEX.indexParam = {};

/* 모든 update 요청을 중지하는 함수 */
function stop() {
	INDEX.flag = false;
	console.log('stop');
}


$(document).ready(function() {

	//$('#real-container').hide();
	// interest 목록 비었을 때 처리
	if($('.swiper-container').length == 0) INDEX.isEmptyInterest = true;
	INDEX.interestSize = $('.swiper-slide').length;
	// interest 목록 길이만큼 false 넣기
	for(var i = 0; i < INDEX.interestSize; i++) {
		INDEX.interestChartEls.push(false);
	}
	//탭 클릭시 요청 발생
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		var target = $(e.target).attr("href") // activated tab
		console.log('탭요청 : ' + target);
		topTabUpdate(target);
	});
	// index 데이터 받아오기
	getFirstIndexData();
});

/** 초기 데이터를 받아오는 함수 */
function getFirstIndexData() {
	$.ajax({
		type : "GET",
		url : "indexs/first",
		dataType : "json",
		contentType: "application/json; charset=utf-8",
		success : function(data) {
			console.log("getFirstIndexData data .. ");
			console.log(data);
			setFirstIndex(data);

			$('#real-container').show();
			$('#loading-container').hide();
			setIndexParam(data.holdingWidget.holdingList, data.interestMap.interestList);
			indexUpdate();
			updateField();
			updateCharts();
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}

/** 받아온 초기 데이터를 화면에 뿌리는 함수 */
function setFirstIndex(data) {
	// 업종별 거래량 카드 설정
	setFieldAmountCard(data.fieldStock);
	// 나의 관심종목 카드 설정
	if(!INDEX.isEmptyInterest) setMyInterestCard(data.interestMap);
	// 코스피 카드의 주식정보 설정
	setKospiStock(data.kospi);
	// 코스피 카드의 차트 설정
	setKospiChart(data.kospiChart);
	// 상위 10개 탭 설정
	setTopTab(data.topTab, 0);
	//setNews(data.news);
	


	var realTimeList = $("ul#scroll li a");
	
	for(var i = 0; i < realTimeList.length; i++){
		  realTimeList.eq(i).text((i+1)+"  "+data.realTime[i].stockName+" "+numberWithCommas(data.realTime[i].total));
		  realTimeList.eq(i).attr('href','company/'+data.realTime[i].stockCode);
	}

}

/** 뉴스 설정 */
function setNews(news) {
	$('.stock-index-news li').each(function(index, item){
		$(item).find('img').attr('src','../resources/img/avatar'+(index+1)+'-sm.jpg');
		$(item).find('.notification-event a').attr('href',news[index].link);
		$(item).find('.notification-event a').attr('target',"_blank");
		$(item).find('.h6').text(news[index].source);
		$(item).find('.news-title').text(news[index].title);
		$(item).find('time').text(news[index].date);
	});
}
/** 코스피 카드 설정 */
function setKospiStock(kospiStock) {
	var statList = $(".stock-kospi-card .text-stat").find('.count-stat');
	$(statList[0]).text(kospiStock.price.toLocaleString());
	$(statList[1]).text(kospiStock.high.toLocaleString());
	$(statList[2]).text(kospiStock.low.toLocaleString());
	$(statList[3]).text(kospiStock.lastPrice.toLocaleString());
	$(statList[4]).text(kospiStock.volume.toLocaleString());
}

/** 코스피 차트 설정 */
function setKospiChart(kospiChart) {
	for(var i =0; i < kospiChart.label.length; i++) {
		if((i%5 == 0) && (i % 10 != 0)) kospiChart.label[i] = ""
		kospiChart.label[i] = kospiChart.label[i].replace("'","").replace("'","");
	}
	var lineChart = document.getElementById("kospi-line-chart");
    var ctx_lc = lineChart.getContext("2d");
    var data_lc = {
        labels: kospiChart.label,
        datasets: [
            {
                label: " 원 ",
                borderColor: "#ffdc1b",
                borderWidth: 4,
                pointBorderColor: "#ffdc1b",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 3,
                pointRadius: 1,
                pointHoverRadius: 1,
                fill: false,
                lineTension:0,
                data: kospiChart.data.kospi
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
                      ticks: {
                          fontColor: '#888da8'
                      },
                      gridLines: {
                          color: "#f0f4f9"
                      }
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
    INDEX.kospiChartEl = new Chart(ctx_lc, INDEX.config);
}

/** 코스피 차트 업데이트 */
function updateKospiChart(kospiChart) {
	for(var i = 0; i < kospiChart.label.length; i++){
		if((i%5 == 0) && (i % 10 != 0)) kospiChart.label[i] = "";
		kospiChart.label[i] = kospiChart.label[i].replace("'","").replace("'","");
	}
	INDEX.kospiChartEl.data.labels = kospiChart.label;
	INDEX.kospiChartEl.data.datasets[0].data = kospiChart.data.kospi;
	INDEX.kospiChartEl.update(0);
}

/** 나의 관심종목 카드 설정 */
function setMyInterestCard(interestMap) {
	var interestList = interestMap.interestList;
	var interestChartData = interestMap.interestChart;

	var interestCharts = document.getElementsByName("interest-line-stacked-chart");
	
	$(".stock-my-interest .swiper-wrapper .swiper-slide").each(function(index, item){
		var icon = "";
		for (var i = 0; i < interestList.length; i++) {
			if($(item).find(".company-name a").text() == interestList[i].stockName) {
			  	// 데이터 설정
				$(item).find(".hidden-stock-code").text(interestList[i].stockCode);
				$(item).find(".indicator").html("전일대비 " + interestList[i].stockChange.toLocaleString() + 
						"&nbsp;&nbsp;" + interestList[i].stockDiff +"%");
				// 전일대비 올랐음
				if(interestList[i].stockDiff > 0) {
	    			icon = "<i class='fas fa-caret-up' style='font-size:25px;'></i>&nbsp;"
					$(item).find(".company-stock").removeClass('minus').addClass('plus');
					$(item).find(".indicator").removeClass('minus').addClass('plus');
				}
				// 전일대비 내렸음
				else if(interestList[i].stockDiff < 0) {
	    			icon = "<i class='fas fa-caret-down' style='font-size:25px;'></i>&nbsp;"
					$(item).find(".company-stock").removeClass('plus').addClass('minus');
					$(item).find(".indicator").removeClass('plus').addClass('minus');
				}
				// 전일과 동일
				else {
	    			icon = "";
					$(item).find(".company-stock").removeClass('plus').removeClass('minus');
					$(item).find(".indicator").removeClass('plus').removeClass('minus');
				}
				$(item).find(".company-stock").html(icon + interestList[i].stockPrice.toLocaleString());

				
    			// 차트 설정
		  		// false면 처음 설정하는 것임
		  		if(!INDEX.interestChartEls[index]) {
					for(var j = 0; j < interestChartData.label.length; j++){
						interestChartData.label[j] = interestChartData.label[j].replace("'","").replace("'","");
					}
	    			var interestChart = interestCharts[index];
	    			var ctx_ls = interestChart.getContext("2d");
	    			var eachData = interestChartData.data[interestList[i].stockCode];
					
	    			var data_ls = {
	  			        labels: interestChartData.label,
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
	    			
				    var interestChartEl = new Chart(ctx_ls, {
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
				  	INDEX.interestChartEls[index] = interestChartEl;
		  		}
		  		// 업데이트
		  		else {
		  			var eachData = interestChartData.data[interestList[i].stockCode];
		  			INDEX.interestChartEls[index].data.labels = interestChartData.label;
		  			INDEX.interestChartEls[index].datasets[0].data = eachData;
		  			INDEX.interestChartEls[index].update(0);
		  		}
				break;
			}
		}
	});

}

/** 나의 관심종목 데이터 설정 */
function setInterestData(interestList) {
	$(".stock-my-interest .swiper-wrapper .swiper-slide").each(function(index, item){
		var icon = "";
		for (var i = 0; i < interestList.length; i++) {
			if($(item).find(".company-name a").text() == interestList[i].stockName) {
			  	// 데이터 설정
				$(item).find(".indicator").html("전일대비 " + interestList[i].stockChange.toLocaleString() + 
						"&nbsp;&nbsp;" + interestList[i].stockDiff +"%");
				// 전일대비 올랐음
				if(interestList[i].stockDiff > 0) {
	    			icon = "<i class='fas fa-caret-up' style='font-size:25px;'></i>&nbsp;"
					$(item).find(".company-stock").removeClass('minus').addClass('plus');
					$(item).find(".indicator").removeClass('minus').addClass('plus');
				}
				// 전일대비 내렸음
				else if(interestList[i].stockDiff < 0) {
	    			icon = "<i class='fas fa-caret-down' style='font-size:25px;'></i>&nbsp;"
					$(item).find(".company-stock").removeClass('plus').addClass('minus');
					$(item).find(".indicator").removeClass('plus').addClass('minus');
				}
				// 전일과 동일
				else {
	    			icon = "";
					$(item).find(".company-stock").removeClass('plus').removeClass('minus');
					$(item).find(".indicator").removeClass('plus').removeClass('minus');
				}
				$(item).find(".company-stock").html(icon + interestList[i].stockPrice.toLocaleString());
				break;
			}
		}
	});
}

/** 나의 관심종목 차트 업데이트 */
function updateInterestChart(chart) {
	var dataList = chart.data;
	window.chart = chart;
	
	$(".stock-my-interest .swiper-wrapper .swiper-slide").each(function(index, item){
		var stockCode = $(item).find(".hidden-stock-code").text();
			
		for(var i = 0; i < chart.label.length; i++){
			chart.label[i] = chart.label[i].replace("'","").replace("'","");
		}
		
		var eachData = dataList[stockCode];
		INDEX.interestChartEls[index].data.labels = chart.label;
		INDEX.interestChartEls[index].data.datasets[0].data = eachData;
		INDEX.interestChartEls[index].update(0);
			
	});
}



/** 상위 10개 탭 세팅 */
function setTopTab(rankList, index) {
	if(INDEX.tabList[index] != $(".stock-top-tab .tab-content").find('.active').attr('id').replace('#','')) {
		console.log('다른탭 요청');
		return;
	}
	
    var stockNames = [];
    var stockValues = [];
    
    for(var i = 0; i < 10; i++){
    	stockNames[i] = rankList[i].stockName;
    	stockValues[i] = rankList[i].stockValue;
    }

	// 첫 설정
	if(INDEX.eachTabChartEls[index] == false) {
		var ctx_ob = document.getElementsByName("tab-charts")[index].getContext("2d");
	    var data_ob = {
		        labels: stockNames,
		        datasets: [{
		                backgroundColor: "#38a9ff",
		                data: stockValues
		            }]
	    };

		INDEX.eachTabChartEls[index] = new Chart(ctx_ob, {
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
	
	// 업데이트
	else {
		INDEX.eachTabChartEls[index].data.labels = stockNames;
		INDEX.eachTabChartEls[index].data.datasets[0].data = stockValues;
		INDEX.eachTabChartEls[index].update(0);
	}
}


/** 업종별 거래량 카드 설정 */
function setFieldAmountCard(fieldStock) {
	// 데이터 설정
	var sum = 0;
	$('.stock-index-trend li').each(function(index, item){
		var eachValue = Number(fieldStock[index][1]);
		$(item).find(".fieldName").text(fieldStock[index][0]);
		$(item).find(".count-stat").text( numberWithCommas((eachValue / 1000).toFixed(0)) + "K");
		sum += Number(eachValue);
	});
	$('.stock-index-trend .chart-js-pie-color div').html( numberWithCommas((sum / 1000).toFixed(0)) + "K <span>5개 업종의 거래량 합</span>");
	
	// 처음이면 차트 그리기
	if(INDEX.fieldChartEl == null) {
		setFieldAmountChart(fieldStock);
	}
	// 아니면 차트 업데이트
	else {
		INDEX.fieldChartEl.data.labels = [ fieldStock[0][0], fieldStock[1][0], fieldStock[2][0], fieldStock[3][0], fieldStock[4][0] ];
		INDEX.fieldChartEl.data.datasets[0].data = [ fieldStock[0][1], fieldStock[1][1], fieldStock[2][1], fieldStock[3][1], fieldStock[4][1] ];
		INDEX.fieldChartEl.update(0);
	}
}

/** 업종별 거래량 차트 그리기 */
function setFieldAmountChart(fieldStock) {
	var fieldChart = document.getElementById("field-chart");
    var ctx_pc = fieldChart.getContext("2d");
    var data_pc = {
        labels: [fieldStock[0][0], fieldStock[1][0], fieldStock[2][0], fieldStock[3][0], fieldStock[4][0]],
        datasets: [
            {
                data: [fieldStock[0][1], fieldStock[1][1], fieldStock[2][1], fieldStock[3][1], fieldStock[4][1]],
                borderWidth: 0,
                backgroundColor: [
                    "#7c5ac2",
                    "#08ddc1",
                    "#ff5e3a",
                    "#ffdc1b",
                    "#38a9ff"
                ]
            }]
    };

    INDEX.fieldChartEl  = new Chart(ctx_pc, {
        type: 'doughnut',
        data: data_pc,
        options: {
            deferred: {           // enabled by default
                delay: 300        // delay of 500 ms after the canvas is considered inside the viewport
            },
            cutoutPercentage:93,
            legend: {
                display: false
            },
            animation: {
                animateScale: false
            }
        }
    });
}

/** 요청 파라미터 세팅 */
function setIndexParam(holdingList, interestList) {
	var activeTabId = $(".stock-top-tab .tab-content").find('.active').attr('id');
	switch(activeTabId) {
	//상승률 상위 5
	case INDEX.tabList[0] :
		INDEX.indexParam.tabOption = 1;
		break;
	// 하락률 상위 5
	case INDEX.tabList[1] :
		INDEX.indexParam.tabOption = 2;
		break;
	// 외국인 순매수 3
	case INDEX.tabList[2] :
		INDEX.indexParam.tabOption = 3;
		break;
	// 기관 순매수 3
	case INDEX.tabList[3] :
		INDEX.indexParam.tabOption = 4;
		break;
	// 거래량 20
	case INDEX.tabList[4] :
		INDEX.indexParam.tabOption = 5;
		break;
	// 시가총액 20
	case INDEX.tabList[5] :
		INDEX.indexParam.tabOption = 6;
		break;
	}
	INDEX.indexParam.holdingList = holdingList;
	INDEX.indexParam.interestCompanyNumberList = [];
	for(var i = 0; i < interestList.length; i++) {
		INDEX.indexParam.interestCompanyNumberList.push(interestList[i].stockCode);
	}
}


/** 2초마다 업종별 정보, 관심종목의 Stock정보(차트빼고), 코스피의 Stock정보(차트빼고), 열려진 탭의 Top 정보 업데이트 */
function indexUpdate() {
	if(INDEX.flag) {
		$.ajax({
			type : "POST",
			url : "index/update",
			dataType : "json",
			contentType: "application/json; charset=utf-8",
			data : JSON.stringify(INDEX.indexParam),
			success : function(updateData) {
				console.log("updateData .. ");
				console.log(updateData);
				setInterestData(updateData.interestList);
				setKospiStock(updateData.kospi);
				setTopTab(updateData.topTab, updateData.topTabOption -1);
				setTimeout(indexUpdate, 2000);
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
	INDEX.indexParam.tabOption = tabOption;
	
	$.ajax({
		type : "POST",
		url : "index/tab/" + tabOption,
		dataType : "json",
		contentType: "application/json; charset=utf-8",
		success : function(rankList) {
			setTopTab(rankList, Number(tabOption) -1);
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}


/** 업종별 거래량 카드 업데이트 */ 
function updateField() {
	if(INDEX.flag) {
		$.ajax({
			type : "GET",
			url : "index/field",
			datatype: 'json',
			contentType: "application/json; charset=utf-8",
			success : function(fieldList) {
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
				$('.stock-index-trend .chart-js-pie-color div').html( numberWithCommas((sum / 1000).toFixed(0)) + "K <span>5개 업종의 거래량 합</span>");
				setTimeout(updateField, 3000);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	};
}

/** 차트 업데이트 */ 
function updateCharts() {
	if(INDEX.flag) {
		$.ajax({
			type : "POST",
			url : "index/chart",
			datatype: 'json',
			data : JSON.stringify({
				"interestCompanyNumberList" : INDEX.indexParam.interestCompanyNumberList,
				"kospiOption" : 1
			}),
			contentType: "application/json; charset=utf-8",
			success : function(interestAndKospiChart) {
				updateInterestChart(interestAndKospiChart.chart);
				updateKospiChart(interestAndKospiChart.kospiChart);
				setTimeout(updateField, 2000);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	};
}