$(document).ready(function() {
	indexUpdate();
});

function indexUpdate() {
	$.ajax({
		type : "GET",
		url : "indexUpdate",
		dataType:"json",
		data : {
            'userId' : 'suhyeon',
            'fieldOption' : 1,
            'kospiOption' : 1,
            'tabOption' : 'Rising'
       },
		success : function(stockData) {
			console.log(stockData);
			setFieldCard(stockData.fieldStock);
/*			$("#firstFieldName").text(fieldData[0].fieldName);
			$("#firstFieldAmount").text(numberWithCommas((fieldData[0].fieldAmount)));
			$("#secondFieldName").text(fieldData[1].fieldName);
			$("#secondFieldAmount").text(numberWithCommas((fieldData[1].fieldAmount)));
			$("#thirdFieldName").text(fieldData[2].fieldName);
			$("#thirdFieldAmount").text(numberWithCommas((fieldData[2].fieldAmount)));
			$("#forthFieldName").text(fieldData[3].fieldName);
			$("#forthFieldAmount").text(numberWithCommas((fieldData[3].fieldAmount)));
			$("#fifthFieldName").text(fieldData[4].fieldName);
			$("#fifthFieldAmount").text(numberWithCommas((fieldData[4].fieldAmount)));*/
			//setTimeout(indexUpdate, 2000);
		}
	})
}
function setFieldCard(fieldStock) {
	console.log("a : " + fieldStock);
}
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}