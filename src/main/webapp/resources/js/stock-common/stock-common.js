function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function removeLabelQuotes(data){
    var index = 0;
	var result =  data.label.forEach(function(element){
		data.label[index] = element.replace(/\"/gi,"");
		index = index +1;
	});
	return result;
}
//function updateRealTime(data){
//	$("ul#scroll li a").each(function(index){
//		$(this).text(index+"     "data[i].stockName);
//	});
//}
