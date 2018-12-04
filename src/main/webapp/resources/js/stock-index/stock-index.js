$(document).ready(function() {
	indexUpdate();
});

function indexUpdate() {
	$.ajax({
		type : "POST",
		url : "indexUpdate",
		dataType : "json",
		contentType: "application/json; charset=utf-8",
		data : JSON.stringify({
			"userId" : "suhyeon",
			"fieldOption" : "1",
			"kospiOption" : "1",
			"tabOption" : "Rising",
			"holdingList" : [
			{
                "holdingSeq": 6,
                "companyNumber": "090430",
                "companyName": "아모레퍼시픽",
                "userSeq": 2,
                "holdingAmount": 701,
                "holdingTotalMoney": 39404,
                "holdingRateOfReturn": 47.7836290535892
            },
            {
                "holdingSeq": 7,
                "companyNumber": "051900",
                "companyName": "LG생활건강",
                "userSeq": 2,
                "holdingAmount": 25,
                "holdingTotalMoney": 25233,
                "holdingRateOfReturn": 28.487200112530125
            }
            ],
			"cashTotal" : "500000",
			"interestCompanyNameList" : [		        
				"LG생활건강",
		        "아모레퍼시픽",
		        "토니모리"
	        ]
		}),
		success : function(stockData) {
			console.log(stockData);
			window.stock = stockData;
			setFieldCard(stockData.fieldStock);
			setInterestCard(stockData.interestCard);
			setKospiCard(stockData.kospi);
			setTopTab(stockData.topTap);
			//setTimeout(indexUpdate, 2000);
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

/** 관심종목 카드 데이터 설정 */
function setInterestCard(interestCard) {
	var slideCard = $(".stock-my-interest .swiper-wrapper");
	slideCard.html("");
	
	for (var i = 0; i < interestCard.stockList.length; i++) {
		var swiperSlide = $("<div class=\"swiper-slide\"></div>");
		var statisticsSlide = $("<div class=\"statistics-slide\"></div>");
		var nameDiv = $("<div class=\"company-name\" data-swiper-parallax=\"-500\"></div>");
		var stockDiv = $("<div class=\"company-stock\" data-swiper-parallax=\"-500\"></div>");
		var dayBeforeSpan = $("<span class=\"indicator\"></span>");
		var chartDiv = $("<div class=\"chart-js chart-js-line-stacked\">" +
							"<canvas name=\"line-stacked-chart\" width=\"730\" height=\"300\"></canvas>" +
						"</div>");
		$(nameDiv).text(interestCard.stockList[i].stockName);
		$(stockDiv).text(interestCard.stockList[i].stockPrice.toLocaleString());
		$(dayBeforeSpan).text("전일대비 " + interestCard.stockList[i].stockChange +" "+ interestCard.stockList[i].stockDiff.toFixed(2)+"%");
		if(interestCard.stockList[i].stockDiff > 0) {
			$(stockDiv).removeClass('minus').addClass('plus');
			$(dayBeforeSpan).removeClass('minus').addClass('plus');
		}
		else {
			$(stockDiv).removeClass('plus').addClass('minus');
			$(dayBeforeSpan).removeClass('plus').addClass('minus');
		}

		$(statisticsSlide).append(nameDiv);
		$(statisticsSlide).append(stockDiv);
		$(statisticsSlide).append(dayBeforeSpan);
		$(statisticsSlide).append(chartDiv);
		$(swiperSlide).append(statisticsSlide);
		$(slideCard).append(swiperSlide);
	}
	runInterestChart(interestCard.chartList);
	CRUMINA.initSwiper();
	//myInitSwiper();
}

/** 관심종목 차트 */
function runInterestChart(chartList) {
	var lineStackedCharts = document.getElementsByName("line-stacked-chart");
	for (var i = 0; i < lineStackedCharts.length; i++) {
		var lineStackedChart = lineStackedCharts[i];
		var eachChart = chartList.pop();
		removeLabelQuotes(eachChart);
		/*
		 *  Lines Graphic
		 */
		if (lineStackedChart !== null) {
		    var ctx_ls = lineStackedChart.getContext("2d");
		    var data_ls = {
		        labels: eachChart.label,
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
		                data: eachChart.data.pop()
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
/** 코스피 카드 설정 함수 */
function setKospiCard(kospi) {
	var statList = $(".stock-kospi-card .text-stat").find('.count-stat');
	$(statList[0]).text(kospi.kospiStock.stockPrice.toLocaleString());
	$(statList[1]).text(kospi.kospiStock.stockHigh.toLocaleString());
	$(statList[2]).text(kospi.kospiStock.stockLow.toLocaleString());
	$(statList[3]).text(kospi.kospiStock.stockChange.toLocaleString());
	$(statList[4]).text(kospi.kospiStock.stockVolume.toLocaleString());
	runKospiChart(kospi.kospiTimeSeries);
}

/** 코스피 차트 설정 함수 */
function runKospiChart(kospiTimeSeries) {
	var lineChart = document.getElementById("kospi-line-chart");
	removeLabelQuotes(kospiTimeSeries);
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
	                pointBorderWidth: 4,
	                pointRadius: 6,
	                pointHoverRadius: 8,
	                fill: false,
	                lineTension:0,
	                data: kospiTimeSeries.data.pop()
	            }]
	    };

	    var lineChartEl = new Chart(ctx_lc, {
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
	                        beginAtZero:true,
	                        fontColor: '#888da8'
	                    }
	                }]
	            }
	        }
	    });
	}
}

/** 상위 종목 카드 설정 함수 */
function setTopTab(topTab) {
	window.tabbbb=topTab;
	console.log(topTab[0]);
	var activeTab = $(".stock-top-tab .tab-content").find('.active');
	console.log($(activeTab).attr('id'));
	// 활성화된 탭 검사
	switch($(activeTab).attr('id')) {
	//상승률 상위 5
	case 'rising-rate' :
	// 하락률 상위 5
	case 'falling-rate' :
		var itemList = $(activeTab).find('.skills-item');
		for(var i = 0; i < 5; i++) {
			$(itemList[i]).find('.skills-item-title').text(topTab[i].companyName);
			$(itemList[i]).find('.units').text(topTab[i].value.toFixed(2)+"%");
			$(itemList[i]).find('.skills-item-meter-active').css("width",topTab[i].value.toFixed(2)+"%");
		}
		break;
	// 외국인 순매수 3
	case 'foreigner' :
	// 기관 순매수 3
	case 'institution' :
		var itemList = $(activeTab).find('.ui-block-content');
		for(var i = 0; i < 3; i++) {
			var figure = topTab[i].value / 100;
			$(itemList[i]).find('.pie-chart').attr('data-value', figure);
			$(itemList[i]).find('h6').text(topTab[i].companyName);
			$(itemList[i]).find('p').text(topTab[i].value.toFixed(2)+"%");
		}
		runPiChart();
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

/** 순매수 차트*/
function runPiChart() {
    var $pie_chart = $('.pie-chart');
    $pie_chart.appear({ force_process: true });
    $pie_chart.on('appear', function () {
        var current_cart = $(this);
        if (!current_cart.data('inited')) {
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
            current_cart.data('inited', true);
        }
    });
}

/** Top20 차트 함수 */
function runOneBarChart(topTab, id) {
	var nameList = [];
	var dataList = [];
	for(var i = 0; i < topTab.length; i++) {
		nameList.push(topTab[i].companyName);
		dataList.push(topTab[i].value);
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

/** initSwiper 설정 함수 */
/*
function myInitSwiper() {
	var swipers = {};
	var initIterator = 0;
	var $breakPoints = false;
	$('.swiper-container').each(function () {

		var $t = $(this);
		var index = 'swiper-unique-id-' + initIterator;

		$t.addClass('swiper-' + index + ' initialized').attr('id', index);
		$t.find('.swiper-pagination').addClass('pagination-' + index);

		var $effect = ($t.data('effect')) ? $t.data('effect') : 'slide',
			$crossfade = ($t.data('crossfade')) ? $t.data('crossfade') : true,
			$loop = ($t.data('loop') == false) ? $t.data('loop') : true,
			$showItems = ($t.data('show-items')) ? $t.data('show-items') : 1,
			$scrollItems = ($t.data('scroll-items')) ? $t.data('scroll-items') : 1,
			$scrollDirection = ($t.data('direction')) ? $t.data('direction') : 'horizontal',
			$mouseScroll = ($t.data('mouse-scroll')) ? $t.data('mouse-scroll') : false,
			$autoplay = ($t.data('autoplay')) ? parseInt($t.data('autoplay'), 10) : 0,
			$autoheight = ($t.hasClass('auto-height')) ? true: false,
			$slidesSpace = ($showItems > 1) ? 20 : 0;

		if ($showItems > 1) {
			$breakPoints = {
				480: {
					slidesPerView: 1,
					slidesPerGroup: 1
				},
				768: {
					slidesPerView: 2,
					slidesPerGroup: 2
				}
			}
		}

		swipers['swiper-' + index] = new Swiper('.swiper-' + index, {
			pagination: '.pagination-' + index,
			paginationClickable: true,
			direction: $scrollDirection,
			mousewheelControl: $mouseScroll,
			mousewheelReleaseOnEdges: $mouseScroll,
			slidesPerView: $showItems,
			slidesPerGroup: $scrollItems,
			spaceBetween: $slidesSpace,
			keyboardControl: true,
			setWrapperSize: true,
			preloadImages: true,
			updateOnImagesReady: true,
			autoplay: $autoplay,
			autoHeight: $autoheight,
			loop: $loop,
			breakpoints: $breakPoints,
			effect: $effect,
			fade: {
				crossFade: $crossfade
			},
			parallax: true,
			onSlideChangeStart: function (swiper) {
			    var sliderThumbs = $t.siblings('.slider-slides');
				if (sliderThumbs.length) {
                    sliderThumbs.find('.slide-active').removeClass('slide-active');
					var realIndex = swiper.slides.eq(swiper.activeIndex).attr('data-swiper-slide-index');
                    sliderThumbs.find('.slides-item').eq(realIndex).addClass('slide-active');
				}
			}
		});
		initIterator++;
	});
	

    //swiper arrows
    $('.btn-prev').on('click', function () {
        var sliderID = $(this).closest('.slider-slides').siblings('.swiper-container').attr('id');
        swipers['swiper-' + sliderID].slidePrev();
    });

    $('.btn-next').on('click', function () {
        var sliderID = $(this).closest('.slider-slides').siblings('.swiper-container').attr('id');
        swipers['swiper-' + sliderID].slideNext();
    });
	
    //swiper arrows
    $('.btn-prev-without').on('click', function () {
        var sliderID = $(this).closest('.swiper-container').attr('id');
        swipers['swiper-' + sliderID].slidePrev();
    });

    $('.btn-next-without').on('click', function () {
        var sliderID = $(this).closest('.swiper-container').attr('id');
        swipers['swiper-' + sliderID].slideNext();
    });
	
	
    // Click on thumbs
    $('.slider-slides .slides-item').on('click', function () {
        if ($(this).hasClass('slide-active')) return false;
        var activeIndex = $(this).parent().find('.slides-item').index(this);
        var sliderID = $(this).closest('.slider-slides').siblings('.swiper-container').attr('id');
        swipers['swiper-' + sliderID].slideTo(activeIndex + 1);
        $(this).parent().find('.slide-active').removeClass('slide-active');
        $(this).addClass('slide-active');

        return false;
    });
};*/