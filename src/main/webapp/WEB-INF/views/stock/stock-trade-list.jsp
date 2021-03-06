<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 거래내역</title>
<jsp:include page="../includes/head.jsp"></jsp:include>
<jsp:include page="../popup/sharing.jsp"></jsp:include>
<jsp:include page="../popup/boast.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.2.0.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/html2canvas.js"></script>
<script>
var companyNumberList = new Array;
companyNumberList.push("000270");
var imageLocation

function research(){
	$('#reSearch').click(function() {
		var date = $('#datepicker').datepicker().val();
		window.location.href ='trade-list?type='+$('.type-select').children('option:selected').attr('value')+'&date='+date;
})
}
function getStockData(){
	$.ajax({ 
        type: "POST", 
        url: "getStocklist", 
        traditional : true,
		data: {'companyNumberList' : companyNumberList},
        success: function (data) {
          window.test=data;
          var realTimeList = $("ul#scroll li a");
          for(var i = 0; i < realTimeList.length; i++){
        	  realTimeList.eq(i).text((i+1)+"  "+data.realTime[i].stockName+" "+numberWithCommas(data.realTime[i].total));
        	  realTimeList.eq(i).attr('href','company/'+data.realTime[i].stockCode);
          }
          setTimeout(getStockData, 1000);
        }
})
}
function addPageNation(){
	if(${pageTotalNum}<11){
		for(var i = 1; i < ${pageTotalNum}+1; i++){
			$('ul.pagination').append('<li class="page-item"><a class="page-link" href="trade-list?page='+i+'">'+i+'</a></li>')
		}		
	}else{
		$('ul.pagination').append('<li class="page-item"><a class="page-link" href="trade-list?page='+i+'">'+이전으로+'</a></li>')
		for(var i = 1; i < ${pageTotalNum}+1; i++){
			$('ul.pagination').append('<li class="page-item"><a class="page-link" href="trade-list?page='+i+'">'+i+'</a></li>')
		}				
		$('ul.pagination').append('<li class="page-item"><a class="page-link" href="trade-list?page='+${pageTotalNum}+'">'+다음으로+'</a></li>')
	}
}
function changeType(){
	$('.type-select').val("${type}").prop("selected",true);
	$('#datepicker').datepicker().val("${getDate}");
}
function typeChanged(){	
	$('.type-select').change(function(){
		console.log($('#datepicker').datepicker().val());
		window.location.href ='trade-list?type='+$(this).children("option:selected").attr("value");
		
	});
}

function dateChaged(){
	$('#datepicker').change(function(){
		console.log($('#datepicker').datepicker().val());
	})
}
$(document).ready(function(){
	changeType();
	addPageNation();
//	typeChanged();
//	getStockData();
	capture('container');
	/** DatePickerEvent등록*/
	registDatePickerEvent();
	writing()
//	dateChaged()
	research()
});

/** datepicker 이벤트 발생 처리*/
function registDatePickerEvent() {
	/* DatePicker */
    $("#datepicker").daterangepicker({
    	showDropdowns: true,
    	timePicker: false,
    	maxDate: moment(),
    	format: 'YYYY-MM-DD',
    	locale: {
            applyLabel: 'Submit',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom Range',
            daysOfWeek: ['일', '월', '화', '수', '목', '금','토'],
            monthNames: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            firstDay: 0
        },
        /* showMonthAfterYear: true,
    	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
  		*/    
  		/*
       onSelect: function(selectedDate){
    	   console.log('들어옴');
		   console.log('선택됨 : '+ selectedDate);
       }
        */
        onSelect: function(dateText, inst) {
            $("input[name='something']").val(dateText);
          }
   })
   
   $("#datepicker").keydown(function (event) {
       event.preventDefault();
   })
}
/** datepicker에서 선택된 날짜를 필요한 형식으로 변환하는 함수 */
function formatDate(date){
 	var d = new Date(date),
     month = '' + (d.getMonth() + 1),
     day = '' + d.getDate(),
     year = d.getFullYear();
 	
 	if (month.length < 2) month = '0' + month;
 	if (day.length < 2) day = '0' + day;
 	return [year, month, day].join('-');
 }
</script>
</head>

<body class="stock">

  <%-- 우리한테 필요 없는 고정 양측 사이드바 --%>
  <!-- Fixed Sidebar Left -->
  <%-- <jsp:include page="includes/fixed-sidebar-left.jsp"></jsp:include> --%>
  <!-- end Fixed Sidebar Left -->

  <!-- Fixed Sidebar Right -->
  <%-- <jsp:include page="includes/fixed-sidebar-right.jsp"></jsp:include> --%>
  <!-- ... end Fixed Sidebar Right -->

  <!-- Header -->
  <%-- 테스트 로그인 ID로 Yegyeom Yu 보냄 --%>
  <jsp:include page="../includes/header.jsp">
    <jsp:param value="Yegyeom Yu" name="loginId" />
  </jsp:include>
  <!-- ... end Header -->
  <div class="header-spacer header-spacer-small"></div>


  <!-- Widget Weather -->
  <div class="container">
    <%-- realtime row 시작 --%>
    <div class="row realtime">
      <!-- realtime start -->
      <div class="col-xl-12 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12" style="float:right">
      <jsp:include page="../includes/realtime.jsp"></jsp:include>
      </div>
      <!-- ..realtime end -->
    </div>
    <%-- realtime row 끝 --%>
    <%-- 사이드 포함 row 시작 --%>
    <div class="row stock-trade-list-main">
      <!-- Left Sidebar -->
      <aside class="col-xl-3 order-xl-1 col-lg-3 order-lg-1 col-md-3 order-md-1 col-sm-12 col-xs-12">
        <%-- 내 정보 위젯 --%>
        <jsp:include page="../widgets/profile-info.jsp"></jsp:include>
        <%-- 내 주식정보 위젯 --%>
        <jsp:include page="../widgets/twitter-feed.jsp"></jsp:include>
        <%-- 모의 투자 랭킹 위젯 --%>
        <jsp:include page="../widgets/ranking.jsp"></jsp:include>
      </aside>
      <!-- ... end Left Sidebar -->
      
      <%-- 사이드 제외 컨탠츠 열 시작 --%>
      <div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-9 order-md-2 col-sm-12 col-xs-12">

        <%-- 검색 시작 --%>
          <jsp:include page="../includes/searchBar.jsp"></jsp:include>
        <%-- 검색 끝 --%>
        <%-- tradelist 필터 시작 --%>
        <div class="ui-block" style="background-color: #edf2f6;  border: none;">
        	<div class="row">
        		<div  class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-xs-8">
        			<input type="text" id="datepicker"
                              data-language="en" data-range="true"
                              placeholder="기간을 선택해 주세요" 
                              class="datepicker-here form-control" style="height: 100%; background-color: white;"
                              required />
        		</div>
        		<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-xs-4">
<!-- 		          <form class="w-search" style="width: 100%;" action="#" method > -->
		            <div class="w-select form-group with-button is-empty">
		              <select class="W- type-select" name = "trade-type" style="background-color: white;">
		                <option value="0">ALL</option>
		                <option value="1">SELL</option>
		                <option value="2">BUY</option>
		              </select>
		              <button style="background-color: #3f4257;" id="reSearch">
		                <svg class="olymp-magnifying-glass-icon">
		                  <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-magnifying-glass-icon"></use></svg>
		              </button>
		              <span class="material-input"></span>
		            </div>
<!-- 		          </form>  -->
	          </div>
          </div>
        </div>
        <%-- tradelist 필터 끝 --%>
        <%-- 검색 결과 시작 --%>
        <div class="row">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
    
            <div class="ui-block">
              <table class="forums-table" id="container">
                <thead>
                  <tr>
                    <th class="trade-date">날짜</th>
                    <th class="trade-type">분류</th>
                    <th class="company-number">종목번호</th>
                    <th class="company-name">기업명</th>
                    <th class="stock-price">체결가</th>
                    <th class="stock-amount">거래량</th>
                    <th class="trade-amount">거래금액</th>
                    <th class="profit-rate">수익률</th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach var="eachTrading" items="${tradingList}" varStatus="status">
                   <tr>
                    <td class="trade-date">
                      <div class="forum-item">
                        <time class="entry-date updated"
                          datetime="2018-11-29T18:18">${eachTrading.tradingTime}</time>
                      </div>
                    </td>
                    <td class="trade-type">
                      <div class="forum-item">
                      <c:choose>
                          <c:when test="${eachTrading.tradingType eq 1}">
                              <a href="#" class="h6 count">SELL</a>
                          </c:when>
                          <c:otherwise>
                              <a href="#" class="h6 count">BUY</a>
                          </c:otherwise>
                      </c:choose>
                      </div>
                    </td>
                    <td class="company-number">
                      <div class="forum-item">
                        <a href="company/${eachTrading.companyNumber}" class="h6 count">${eachTrading.companyNumber}</a>
                      </div>
                    </td>
                    <td class="company-name">
                      <div class="author-freshness">
                        <a href="company/${eachTrading.companyNumber}" class="h6 title">${eachTrading.companyName}</a>
                       </div>
                    </td>
                    <td class="stock-price"><a href="#" class="h6 count">${eachTrading.tradingPrice}</a>
                    </td>
                    <td class="stock-amount">
                      <a href="#" class="h6 count">${eachTrading.tradingAmount}</a>
                    </td>
                    <td class="trade-amount">
                      <a href="#" class="h6 count">${eachTrading.tradingPrice * eachTrading.tradingAmount}</a>
                    </td>
                    <td class="profit-rate">
                    <c:if test="${eachTrading.tradingType eq 1}">
                      <c:choose>
                          <c:when test="${eachTrading.tradingEarningsRatio lt 0}">
                              <div class="author-freshness minus">
                          </c:when>
                          <c:otherwise>
                              <div class="author-freshness plus">
                          </c:otherwise>
                      </c:choose>
                        <a href="#" class="h6 title">${eachTrading.tradingEarningsRatio}</a>
                      </div>
                    </c:if>
                    </td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>

			    <form name="imgForm" id="imgForm" action="/convertToImage" method="post">
			        <input type="hidden" id="imgData" name="imgData">
			    </form>
          <div class="row" style="padding: 0 250px; margin-top: 20px;">
            <div class="printBtnZone" align="right" style='margin: 0 auto;'>
                <a href="#" id="share-btn" class="btn btn-blue  btn-md-2" style=" display: inline-block;">공유하기</a>
                <!-- <a id="share-btn" class="btn bg-gray small w-auto">공유하기</a> -->
            </div>
            <div class="printBtnZone" align="right" style='margin: 0 auto;'>
                <a href="#" id="boast-btn" class="btn btn-blue btn-md-2" style=" display: inline-block;">자랑하기</a>
                <!-- <a id="boast-btn" class="btn bg-gray small w-auto">자랑하기</a> -->
            </div>
          </div>
            </div>
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
              </ul>
            </nav>
          </div>
        </div>
        <%-- 검색 결과 끝 --%>
      
      </div>
      <%-- 사이드 제외 컨텐츠 열 끝 --%>
    </div>
    <%-- 사이드 포함 row 끝 --%>
  </div>

  <!-- ... end Widget Weather -->


  <!-- Window-popup-CHAT for responsive min-width: 768px -->
  <jsp:include page="../popup/popup-chat.jsp"></jsp:include>
  <!-- ... end Window-popup-CHAT for responsive min-width: 768px -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->

</body>
</html>