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
			//setInterestCard(stockData.interestCard);
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
	//var swipers = {};
	console.log("interestMap : " + interestCard);
	var slideCard = $(".stock-my-interest .swiper-wrapper");
	slideCard.html("");
	
	for (var i = 0; i < interestCard.stockList.length; i++) {
		var tempSlide = $("<div class=\"statistics-slide\"></div>");
		var nameDiv = $("<div class=\"company-name\" data-swiper-parallax=\"-500\">아모레</div>");
		var stockDiv = $("<div class=\"company-stock\" data-swiper-parallax=\"-500\">50000</div>");
		var dayBeforeSpan = $("<span class=\"indicator\">전일대비 800 +10%</span>");
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
		$(tempSlide).append(nameDiv);
		$(tempSlide).append(stockDiv);
		$(tempSlide).append(dayBeforeSpan);
		$(tempSlide).append(chartDiv);
		$(slideCard).append(tempSlide);
	}
	$.getScript('../resources/js/main.js');
	$.getScript('../resources/js/ajax-pagination.js');
	$.getScript('../resources/js/run-chart.js');
	$.getScript('../resources/js/swiper.jquery.min.js');

}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}