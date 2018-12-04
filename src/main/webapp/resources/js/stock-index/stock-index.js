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
							"<canvas id=\"line-stacked-chart\" width=\"730\" height=\"300\"></canvas>" +
						"</div>");
		$(nameDiv).text(interestCard.stockList[i].stockName);
		$(stockDiv).text(numberWithCommas((interestCard.stockList[i].stockPrice)));
		$(dayBeforeSpan).text("전일대비" + interestCard.stockList[i].stockChange + interestCard.stockList[i].stockDiff+"%");
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
	$.getScript('../resources/js/main.js');
//	$.getScript('../resources/js/ajax-pagination.js');
//	$.getScript('../resources/js/swiper.jquery.min.js');
//	$.getScript('../resources/js/run-chart.js');
}

/** 관심종목 차트 */
var lineStackedChart = document.getElementById("line-stacked-chart");
/*
 *  Lines Graphic
 * 14-FavouritePage-Statistics.html
 */
if (lineStackedChart !== null) {
    var ctx_ls = lineStackedChart.getContext("2d");
    var data_ls = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [
            {
                label: " - Favorites",
                backgroundColor: "rgba(57,169,255,0.35)",
                borderColor: "#38a9ff",
                borderWidth: 4,
                pointBorderColor: "#38a9ff",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 4,
                pointRadius: 6,
                pointHoverRadius: 8,
                data: [98,42,38,57,82,41,36,30,45,62,64,80]
            },
            {
                label: " - Visitors",
                backgroundColor: "rgba(8,221,123,0.2)",
                borderColor: "#08ddc1",
                borderWidth: 4,
                pointBorderColor: "#08ddc1",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 4,
                pointRadius: 6,
                pointHoverRadius: 8,
                data: [78,101,80,87,120,105,110,76,101,96,100,135]
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

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}