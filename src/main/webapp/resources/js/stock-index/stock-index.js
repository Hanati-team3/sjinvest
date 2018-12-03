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
			/*
			 * $("#firstFieldName").text(fieldData[0].fieldName);
			 * $("#firstFieldAmount").text(numberWithCommas((fieldData[0].fieldAmount)));
			 * $("#secondFieldName").text(fieldData[1].fieldName);
			 * $("#secondFieldAmount").text(numberWithCommas((fieldData[1].fieldAmount)));
			 * $("#thirdFieldName").text(fieldData[2].fieldName);
			 * $("#thirdFieldAmount").text(numberWithCommas((fieldData[2].fieldAmount)));
			 * $("#forthFieldName").text(fieldData[3].fieldName);
			 * $("#forthFieldAmount").text(numberWithCommas((fieldData[3].fieldAmount)));
			 * $("#fifthFieldName").text(fieldData[4].fieldName);
			 * $("#fifthFieldAmount").text(numberWithCommas((fieldData[4].fieldAmount)));
			 */
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
/*	var fieldLiList = $(".stock-index-trend li");
	for (var i = 0; i < fieldStock.length; i++) {
		fieldLiList.eq(i).find(".fieldName").text(fieldStock[i].fieldName);
		fieldLiList.eq(i).find(".count-stat").text(
				numberWithCommas((fieldStock[i].fieldAmount)));
	}*/
}

function setInterestCard(interestCard) {
	var swipers = {};
	console.log("interestMap : " + interestCard);
	var slideCard = $(".stock-my-interest .swiper-wrapper");
	slideCard.html(
			"                    <div class=\"swiper-slide\">\r\n" + 
			"                      <div class=\"statistics-slide\">\r\n" + 
			"                        <div class=\"company-name\" data-swiper-parallax=\"-500\">아모레</div>\r\n" + 
			"                        <div class=\"company-stock\" data-swiper-parallax=\"-500\">50000</div>\r\n" + 
			"                        <span class=\"indicator\"> 전일대비 800 +10%</span>\r\n" + 
			"    					<div class=\"chart-js chart-js-line-stacked\">\r\n" + 
			"    						<canvas id=\"line-stacked-chart\" width=\"730\" height=\"300\"></canvas>\r\n" + 
			"    					</div>\r\n" + 
			"                      </div>\r\n" + 
			"                    </div>");
	
/*	for (var i = 0; i < interestCard.stockList.length; i++) {
		var tempSlide = $("<div class=\"statistics-slide\"></div>");
		var nameDiv = ("<div class=\"company-name\" data-swiper-parallax=\"-500\">aaaa</div>");
		var stockDiv = ("<div class=\"company-stock\" data-swiper-parallax=\"-500\"></div>");
		var dayBeforeSpan = ("<span class=\"indicator\"></span>");
		var chartDiv = ("<div class=\"chart-js chart-js-line-stacked\">" +
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

		slides.eq(i).find(".company-name").text(interestCard.stockList[i].stockName);
		if(interestCard.stockList[i].stockDiff > 0) {
			slides.eq(i).find(".company-stock").text(
					numberWithCommas((interestCard.stockList[i].stockPrice))).removeClass('minus').addClass('plus');
			slides.eq(i).find(".indicator").text(
					"전일대비" + interestCard.stockList[i].stockChange + interestCard.stockList[i].stockDiff+"%")
					.removeClass('minus').addClass('plus');
		}
		else {
			slides.eq(i).find(".company-stock").text(
					numberWithCommas((interestCard.stockList[i].stockPrice))).removeClass('plus').addClass('minus');
			slides.eq(i).find(".indicator").text(
					"전일대비" + interestCard.stockList[i].stockChange + interestCard.stockList[i].stockDiff+"%")
					.removeClass('plus').addClass('minus');
		}
	}*/
	$.getScript('../resources/js/main.js');
	$.getScript('../resources/js/ajax-pagination.js');
	$.getScript('../resources/js/swiper.jquery.min.js');

}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}