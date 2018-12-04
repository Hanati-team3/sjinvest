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