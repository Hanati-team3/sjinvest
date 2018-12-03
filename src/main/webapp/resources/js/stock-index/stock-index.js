$(document).ready(function() {
	indexUpdate();
});

function indexUpdate() {
	$.ajax({
		type : "POST",
		url : "indexUpdate",
		dataType : "json",
		data : {
			"userId" : "suhyeon",
			"fieldOption" : "1",
			"kospiOption" : "1",
			"tabOption" : "Rising",
			"holdingList" : [],
			"cashTotal" : "500000",
			"interestCompanyNameList" : []
		},
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
			// setTimeout(indexUpdate, 2000);
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	})
}

function setFieldCard(fieldStock) {
	console.log("fieldStock : " + fieldStock);
	var fieldLiList = $(".stock-index-trend li");
	for (var i = 0; i < fieldStock.length; i++) {
		fieldLiList.eq(i).find(".fieldName").text(fieldStock[i].fieldName);
		fieldLiList.eq(i).find(".count-stat").text(
				numberWithCommas((fieldStock[i].fieldAmount)));
	}
}

function setInterestCard(interestCard) {
	console.log("interestMap : " + interestCard);
	var slides = $(".stock-my-interest .swiper-slide");
	for (var i = 0; i < interestCard.stockList.length; i++) {
		slides.eq(i).find(".company-name").text(interestCard.stockList[i].stockName);
		slides.eq(i).find(".company-stock").text(
				numberWithCommas((interestCard.stockList[i].stockPrice)));
		slides.eq(i).find(".indicator").text("전일대비" + interestCard.stockList[i].stockChange + interestCard.stockList[i].stockDiff+"%");
	}
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}