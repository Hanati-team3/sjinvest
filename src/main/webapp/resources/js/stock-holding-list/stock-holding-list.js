/**
 * 
 */

$(document).ready(function() {
	var holdingList = [];
	var cashTotal = "${holdingWidget.cashTotal}";
	console.log(cashTotal);
	//holdingListUpdate(holdingList);
});

function holdingListUpdate(holdingList) {
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
	            "companyName": "ìëª¨ë í¼ìí½",
	            "userSeq": 2,
	            "holdingAmount": 701,
	            "holdingTotalMoney": 39404,
	            "holdingRateOfReturn": 47.7836290535892
	        },
	        {
	            "holdingSeq": 7,
	            "companyNumber": "051900",
	            "companyName": "LGìíê±´ê°",
	            "userSeq": 2,
	            "holdingAmount": 25,
	            "holdingTotalMoney": 25233,
	            "holdingRateOfReturn": 28.487200112530125
	        }
	        ],
			"cashTotal" : "500000",
			"interestCompanyNameList" : [		        
				"LGìíê±´ê°",
		        "ìëª¨ë í¼ìí½",
		        "í ëëª¨ë¦¬"
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