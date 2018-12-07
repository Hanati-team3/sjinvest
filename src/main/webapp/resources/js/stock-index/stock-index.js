
/** 2초마다 업종별 정보, 관심종목의 Stock정보(차트빼고), 코스피의 Stock정보(차트빼고), 열려진 탭의 Top 정보 업데이트 */
function indexUpdate(indexParam) {
	$.ajax({
		type : "POST",
		url : "indexUpdate",
		dataType : "json",
		contentType: "application/json; charset=utf-8",
		data : JSON.stringify(indexParam),
		success : function(stockData) {
			console.log("stockData .. ")
			console.log(stockData);
			window.stock = stockData;
//			setFieldCard(stockData.fieldStock);
			setInterestCard(stockData.interestList);
			setKospiCard(stockData.kospiStock);
			setTopTab(stockData.topTab);
			//setTimeout(indexUpdate(setIndexParam()), 2000);
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

/** 업종별 정보 카드 데이터 설정 */
function setFieldCard(fieldStock) {
	$(".stock-index-trend li").each(function(index, item){
		$(item).find(".fieldName").text(fieldStock[index].fieldName);
		$(item).find(".count-stat").text(fieldStock[index].fieldAmount.toLocaleString())
	});
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
	for (var i = 0; i < lineStackedCharts.length; i++) {
		var lineStackedChart = lineStackedCharts[i];
		var eachData = interestListChart.dataList[i];
		/*
		 *  Lines Graphic
		 */
		if (lineStackedChart !== null) {
		    var ctx_ls = lineStackedChart.getContext("2d");
		    var data_ls = {
		        labels: interestListChart.label,
		        datasets: [
		            {
		                label: " 원 ",
		                backgroundColor: "rgba(57,169,255,0.35)",
		                borderColor: "#38a9ff",
		                borderWidth: 4,
		                pointBorderColor: "#38a9ff",
		                pointBackgroundColor: "#fff",
		                pointBorderWidth: 4,
		                pointRadius: 6,
		                pointHoverRadius: 8,
		                data: eachData
		            }]
		    };

		    var lineStackedEl = new Chart(ctx_ls, {
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
		                        beginAtZero:true,
		                        fontColor: '#888da8'
		                    }
		                }]
		            }
		        }
		    });
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
	    
	    stockIndex.config = {
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
		    lineChartEl = new Chart(ctx_lc, stockIndex.config);
	    }
	    else {
	    	lineChartEl.update();
	    }
	}
}

/** 상위 종목 카드 설정 함수 */
function setTopTab(topTab) {
	var activeTab = $(".stock-top-tab .tab-content").find('.active');
	// 활성화된 탭 검사
	switch($(activeTab).attr('id')) {
	//상승률 상위 5
	case 'rising-rate' :
	// 하락률 상위 5
	case 'falling-rate' :
		var itemList = $(activeTab).find('.skills-item');
		for(var i = 0; i < 5; i++) {
			$(itemList[i]).find('.skills-item-title').text(topTab[i].stockName);
			$(itemList[i]).find('.units').text(topTab[i].stockValue +"%");
			$(itemList[i]).find('.skills-item-meter-active').css("width",topTab[i].stockValue+"%");
		}
		break;
	// 외국인 순매수 3
	case 'foreigner' :
		runOneBarChart(topTab, 'foreigner-chart');
		break;
	// 기관 순매수 3
	case 'institution' :
		runOneBarChart(topTab, 'institution-chart');
		break;
	// 거래량 20
	case 'trading-amount' :
		runOneBarChart(topTab, 'trading-amount-chart');
		break;
	// 시가총액 20
	case 'total-value' :
		runOneBarChart(topTab, 'total-money-chart');
		break;
	}
}
/*
*//** 순매수 차트*//*
function runPiChart(id) {
    var $pie_chartList = $('#' + id + ' .pie-chart');
    window.piList = $pie_chartList;
	for (var i = 0; i < $pie_chartList.length; i++) {
		var $pie_chart = $pie_chartList.slice(i,i);
	    $pie_chart.appear();
	    $pie_chart.on('appear', function () {
	        var current_cart = $pie_chart;
	        //if (!current_cart.data('inited')) {
	            var startColor = current_cart.data('startcolor');
	            var endColor = current_cart.data('endcolor');
	            var counter = current_cart.data('value') * 100;

	            current_cart.circleProgress({
	                thickness: 16,
	                size: 360,
	                startAngle: -Math.PI / 4 * 2,
	                emptyFill: '#ebecf1',
	                lineCap: 'round',
	                fill: {
	                    gradient: [endColor, startColor],
	                    gradientAngle: Math.PI / 4
	                }
	            }).on('circle-animation-progress', function (event, progress) {
	                current_cart.find('.content').html(parseInt(counter * progress, 10) + '<span>%</span>'
	                )

	            });
	            current_cart.data('inited', false);
	        //}
	    });
	}

}*/

/** Top20 차트 함수 */
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
