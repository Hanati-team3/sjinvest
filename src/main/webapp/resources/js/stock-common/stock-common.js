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

function capture(location){
	$('#share-btn').click(function() {
  	    html2canvas(document.getElementById(location)).then(function(canvas) {
  		document.getElementById('tab-content-sharing').appendChild(canvas);
  		//$('#tab-content-sharing').css("display","grid");
  		$('#tab-content-sharing').find('canvas').css("margin","0px auto").css("overflow-y","auto").css("width","100%");
//  		$('#sharing').css("width","1000px");
	    var base64URL = canvas.toDataURL('image/jpeg');
		// AJAX request
        $.ajax({
           url: '/sos/stock/capture',
           type: 'post',
           data: {image: base64URL},
           success: function(data){
        	  imageLocation = data.fileName;
//        	  $('#shareImage').attr("src","data");
              $('#sharing').modal('toggle');
           }
        });
	});
	})
	$('#boast-btn').click(function() {
  	    html2canvas(document.getElementById('container')).then(function(canvas) {
  		document.getElementById('tab-content-boast').appendChild(canvas);
  		//$('#tab-content-boast').css("display","grid");
  		$('#tab-content-boast').find('canvas').css("margin","0px auto").css("overflow-y","auto").css("width","100%");
//  		$('#sharing').css("width","1000px");
	    var base64URL = canvas.toDataURL('image/jpeg');
		// AJAX request
        $.ajax({
           url: '/sos/stock/capture',
           type: 'post',
           data: {image: base64URL},
           success: function(data){
        	  imageLocation = data.fileName;
//        	  $('#shareImage').attr("src","data");
              $('#boast').modal('toggle');
           }
        });
	});
	})
}

function writing(){
	$('button#write-wall').click(function(){
        $.ajax({
            url: 'write-wall',
            type: 'post',
            data: {'imageLocation': imageLocation,
            		'content' : $('textarea.boast-form-control').val(),
            		'target' : $('input.boast-taget').val()
            		},
            success: function(data){
            }
         });
	})
	$('button#write-feed').click(function(){
        $.ajax({
            url: 'write-feed',
            type: 'post',
            data: {'imageLocation': imageLocation,
            		'content' : $('textarea.sharing-form-control').val()},
            success: function(data){
            }
         });
	})
}