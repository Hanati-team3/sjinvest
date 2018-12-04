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
			 //setTimeout(indexUpdate, 2000);
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

function setFieldCard(fieldStock) {
	console.log("fieldStock : " + fieldStock);
	$(".stock-index-trend li").each(function(index, item){
		$(item).find(".fieldName").text(fieldStock[index].fieldName);
		$(item).find(".count-stat").text(numberWithCommas((fieldStock[index].fieldAmount)))
	});
}

function setInterestCard(interestCard) {
	console.log("interestMap : " + interestCard);
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
		$(stockDiv).text(numberWithCommas((interestCard.stockList[i].stockPrice)));
		$(dayBeforeSpan).text("전일대비 " + interestCard.stockList[i].stockChange +" "+ interestCard.stockList[i].stockDiff.toFixed(2)+"%");
		if(interestCard.stockList[i].stockDiff > 0) {
			$(stockDiv).removeClass('minus').addClass('plus');
			$(dayBeforeSpan).removeClass('minus').addClass('plus');
		}
		else {
			$(stockDiv).removeClass('plus').addClass('minus');
			$(dayBeforeSpan).removeClass('plus').addClass('minus');
		}
		console.log("name"+ interestCard.stockList[i].stockName);
		console.log("stockPrice"+ interestCard.stockList[i].stockPrice);
		console.log("stockChange"+ interestCard.stockList[i].stockChange);
		$(statisticsSlide).append(nameDiv);
		$(statisticsSlide).append(stockDiv);
		$(statisticsSlide).append(dayBeforeSpan);
		$(statisticsSlide).append(chartDiv);
		$(swiperSlide).append(statisticsSlide);
		$(slideCard).append(swiperSlide);
	}
	runInterestChart(interestCard.chartList);
	CRUMINA.initSwiper();
	
//	$.getScript('../resources/js/main.js');
//	$.getScript('../resources/js/ajax-pagination.js');
//	$.getScript('../resources/js/swiper.jquery.min.js');
//	$.getScript('../resources/js/run-chart.js');
}

/** 관심종목 차트 */
function runInterestChart(chartList) {
	console.log(chartList);
	var lineStackedCharts = document.getElementsByName("line-stacked-chart");
	window.charts = lineStackedCharts;
	console.log("length : " +lineStackedCharts.length);
	for (var i = 0; i < lineStackedCharts.length; i++) {
		var lineStackedChart = lineStackedCharts[i];
		var eachChart = chartList.pop();
		console.log("aa");
		window.aa = eachChart;
		/*
		 *  Lines Graphic
		 * 14-FavouritePage-Statistics.html
		 */
		if (lineStackedChart !== null) {
		    var ctx_ls = lineStackedChart.getContext("2d");
		    var data_ls = {
		        labels: eachChart.label,
		        datasets: [
		            {
		                label: " - Won",
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

/** initSwiper 설정 함수 */
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
};


function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}