<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 회사 상세</title>
<jsp:include page="../includes/head.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.2.0.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/html2canvas.js"></script>
<script>
var COMPANY = {};
COMPANY.ChartElements = null

function purchaseButton(){
	<c:if test="${not empty user}">
		$('#purchase-button').click(function(e){
			if($('#amount').val() > 0){
				  $.ajax({ 
				        type: "post", 
				        url: "purchase", 
				        data: {"companyNumber" : "${company.companyNumber}",
				        	"companyName" :"${company.companyName}",
				        	"tradingAmount" : $('#amount').val(),
				        	"tradingPrice" : $('#price').val()},
				        success: function (data) {
				        	if(data.message == "true"){
				        		alert("${company.companyName} "+$('#amount').val()+"주가 구매되었습니다.");
				        		$("#stock_buy_modal").modal('hide');
				        	};
				        }
				})	
			}
		  
		})		
	</c:if>
}
function purchase(){
	$('#amount').keydown(function (e){
	<c:if test="${not empty user}">
		if((${user.userMoney}-($(this).val()*$('#price').val()))<0){
			$(this).val(((${user.userMoney}/$('#price').val())*1).toFixed(0));
		}
		$(this).val($(this).val().replace("-",""));
		$(this).val(($(this).val()*1).toFixed(0));
		$('#totalPrice').val($(this).val()*$('#price').val());
		$('#balance').val(${user.userMoney}-$('#totalPrice').val());
	</c:if>
	})
}
function addInterest(){
	$('.bg-interest').click(function (e) {
		<c:if test="${not empty user}">
			e.preventDefault();
			if($(".fa-heart").hasClass("fas")===true){
				$.ajax({ 
			        type: "post", 
			        url: "addInterest", 
			        data: {"userSeq" : ${user.userSeq}, "companyNumber" : "${company.companyNumber}", "companyName" : "${company.companyName}"}, 
			        success: function (data) {
			        	$('.fa-heart').removeClass('fas');
			        	$('.fa-heart').addClass('far');
			        }
			    })			
			}else{
				$.ajax({ 
			        type: "post", 
			        url: "removeInterest", 
			        data: {"userSeq" : ${user.userSeq}, "companyNumber" : "${company.companyNumber}", "companyName" : "${company.companyName}"}, 
			        success: function (data) {
			        	$('.fa-heart').removeClass('far');
			        	$('.fa-heart').addClass('fas');
			        }
			    })			
			}
			</c:if>
		});
}
function getChangeOption(){
	$("#chart-option").change(function() {
		setTimeout(getChangeChart,500);
	});
}
function getChangeChart(){
		var unitValue = "day";
		var stepSizeValue = 10;
		var term = 1000;
		if($("#chart-option").children("option:selected").attr("value")==1){
			unitValue = "second";
			stepSizeValue = 10;
			term = 1000*60;
		}else if($("#chart-option").children("option:selected").attr("value")==2){
			unitValue = "day"
			stepSizeValue = 5;
			term = 1000*60*60*24;
		}else if($("#chart-option").children("option:selected").attr("value")==3){
			unitValue = "week"
			stepSizeValue = 1;
			term = 1000*60*60*24*4;
		}else if($("#chart-option").children("option:selected").attr("value")==4){
			unitValue = "month"
			stepSizeValue = 1;
			term = 1000*60*60*24*4*3;
		}
	    $.ajax({ 
	        type: "POST", 
	        url: "getchartdata", 
	        data: {"companyNumber" : "${company.companyNumber}", "type" : $("#chart-option").children("option:selected").attr("value")}, 
	        success: function (data) {
	        	for(var i = 0; i < data.label.length; i++){
	        		data.label[i] = data.label[i].replace("'","").replace("'","");
	        	}
	        	COMPANY.ChartElements.data.labels = data.label;
	        	COMPANY.ChartElements.data.datasets[0].data = data.data["${company.companyNumber}"];
	        	COMPANY.ChartElements.update(0);
	        	setTimeout(getChangeChart, term);
	        }
	});
}

function runChart(){
	if (COMPANY.companyCharts !== null) {
	    var ctx_lc = COMPANY.companyCharts.getContext("2d");
	    var companyNumber = "${company.companyNumber}"
	    var data_lc = {
	        labels: ${chartData.label},
	        datasets: [
	            {
	                label: " 원",
	                backgroundColor: "rgba(57,169,255,0.35)",
	                borderColor: "#38a9ff",
	                borderWidth: 2,
	                pointBorderColor: "#38a9ff",
	                pointBackgroundColor: "#fff",
	                pointBorderWidth: 1,
	                pointRadius: 1,
	                pointHoverRadius: 1,
	                data: ${chartData.data[companyNumber]}
	            },
				]
	    };
	    config = {
		        type: 'line',
		        data: data_lc,
		        options: {
		            legend: {
		                display: false
		            },
		            responsive: true,
		            scales: {
		            	xAxes: [{
		                    ticks: {
		                        fontColor: '#888da8',
		                    },
		                    gridLines: {
		                        color: "#f0f4f9"
		                    }
		                }],
		                yAxes: [{
		                    gridLines: {
		                        color: "#f0f4f9"
		                    },
		                    ticks: {
		                        beginAtZero:false,
		                        fontColor: '#888da8'
		                    }
		                }]
		            }
		        }
		    };
	    
	    COMPANY.ChartElements = new Chart(ctx_lc, config);
	}
}
function getStockData(){
    $.ajax({ 
        type: "post", 
        url: "getdata", 
        data: {"companyNumber" : "${company.companyNumber}"}, 
        success: function (data) {
          window.test = data;
          var d = new Date();
          var hour = d.getHours();
          var minutes = d.getMinutes();
          var seconds = d.getSeconds();
    	  <c:if test="${not empty user}">
              $('#price').val(data.stock.stockPrice);
              $('#amount').attr("max",(${user.userMoney}/$('#price').val()).toFixed(0));
      		  $('#totalPrice').val($("#amount").val()*$('#price').val());
          </c:if>
  		  $(".company-stock").text(numberWithCommas(data.stock.stockPrice));
//          $("#highPrice").html(numberWithCommas(data.stock.stockHigh)+"<span class='indicator positive'> 4.207</span>");
		  $("#highPrice").html(numberWithCommas(data.stock.stockHigh));
          $("#lowPrice").html(numberWithCommas(data.stock.stockLow));
          $("#stockVolume").html(numberWithCommas(data.stock.stockVolume));
          $("#closingPrice").html(numberWithCommas(data.stock.stockVolumeBefore));
          hour = hour >= 10 ? hour : '0' + hour;  
          minutes = minutes >= 10 ? minutes : '0' + minutes;  
          seconds = seconds >= 10 ? seconds : '0' + seconds;  
          $(".trading-time").text(hour+"-"+minutes+"-"+seconds)
          var realTimeList = $("ul#scroll li a");
          for(var i = 0; i < realTimeList.length; i++){
        	  realTimeList.eq(i).text((i+1)+"  "+data.realTime[i].stockName+" "+numberWithCommas(data.realTime[i].total));
        	  realTimeList.eq(i).attr('href','company/'+data.realTime[i].stockCode);
          }
		  var trList = $(".company-today-table tr");
          for(var i = 1; i < 11; i++){
        	 	trList.eq(i).find(".stock-price a").text(numberWithCommas(data.askingPriceList[i-1].price));
        	 	trList.eq(i).find(".trading-amount a").text(data.askingPriceList[i-1].quantity);
        	 	trList.eq(i).find(".transition-rate a").text(((data.askingPriceList[i-1].price-data.stock.stockPrice)/data.stock.stockPrice).toFixed(2));
          };
          setTimeout(getStockData, 1000);
        }
})	
}
$(document).ready(function(){
	getStockData();
	COMPANY.companyCharts = document.getElementById("this-line-chart");
	addInterest();
	purchase();
	purchaseButton();
	runChart();
	setTimeout(getChangeChart, 1000);
	getChangeOption();
}
);
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
    <div class="row stock-company-main">
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

        <%-- 회사 메인 카드 row 시작 --%>
        <div class="row">
          <%-- 회사 메인 카드 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12 company-main-card">
            <div class="ui-block">
              <article class="hentry blog-post single-post single-post-v1">
                <div class="control-block-button post-control-button">
                  <a href="#" class="btn btn-control has-i bg-interest">
                    <c:choose>
                        <c:when test="${isInterest eq true}">
                          <i class="far fa-heart"></i>
                        </c:when>
                        <c:when test="${isInterest eq false}">
                          <i class="fas fa-heart"></i>
                        </c:when>
                    </c:choose>
                  </a>
                </div>
                <div class="company-name" >${company.companyName}</div>
                <div class="company-stock" ></div>
                <div class="row company-main-card-sub">
                  <div class="col-xl-3 order-xl-1 col-lg-6 order-lg-1 col-md-6 col-sm-6 col-xs-6">
                    <div class="ui-block">
                      <div class="ui-block-content">
                        <ul class="statistics-list-count">
                          <li>
                            <div class="points">
                              <span> 오늘 상한가 </span>
                            </div>
                            <div class="count-stat" id="highPrice">
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 order-xl-2 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-xs-6">
                    <div class="ui-block">
                      <div class="ui-block-content">
                        <ul class="statistics-list-count">
                          <li>
                            <div class="points">
                              <span> 오늘 하한가 </span>
                              <div class="count-stat" id="lowPrice">
                            </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-xs-6">
                    <div class="ui-block">
                      <div class="ui-block-content">
                        <ul class="statistics-list-count">
                          <li>
                            <div class="points">
                              <span> 거래량 </span>
                            </div>
                            <div class="count-stat" id="stockVolume">
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="col-xl-3 order-xl-4 col-lg-6 order-lg-4 col-md-6 col-sm-6 col-xs-6">
                    <div class="ui-block">
                      <div class="ui-block-content">
                        <ul class="statistics-list-count">
                          <li>
                            <div class="points">
                              <span> 거래량변화량 </span>
                            </div>
                            <div class="count-stat" id="closingPrice">
                              <span class="indicator positive"></span>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <%-- 구매 버튼 시작--%>
                <div class="row">
                  <a class="btn btn-primary btn-md-2" id="purchaseModal" data-toggle="modal"
                      data-target="#stock_buy_modal" style="color:white">구매</a>
                </div>
                <%-- 구매 버튼 끝 --%>
              </article>
            </div>
          </div>
          <%-- 회사 메인 카드 끝 --%>
        </div>
        <%-- 회사 메인 카드 row 끝 --%>
        
        <%-- 기업정보, 체크포인트 row 시작 --%>
        <div class="row">
          <%-- 기업정보 카드 시작 --%>
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 company-info-card">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">기업 정보</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              <div class="ui-block-content">
                <div class="friend-count" style="text-align: center; position: relative;" >
                  <a href="#" class="friend-count-item">
                    <div class="h6">${company.fieldName}</div>
                    <div class="title">업종</div>
                  </a> <a href="#" class="friend-count-item">
                    <div class="h6">코스피</div>
                    <div class="title">시장구분</div>
                  </a> <a href="#" class="friend-count-item">
                    <div class="h6">코스피</div>
                    <div class="title">시가총액</div>
                  </a>
                </div>
                <div class="control-block-button" style="text-align: center; position: relative;" >
                <table class="">
                  <tr>
                    <td>
                      <a href="#" class="btn btn-control bg-primary">
                        <svg class="olymp-star-icon">
                          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-star-icon"></use></svg>
                      </a>
                      <div class="stat">
                        <div>EPS </div>
                        <div class="figure">6,881</div>
                      </div>
                    </td>
                    <td>
                      <a href="#" class="btn btn-control bg-purple">
                        <svg class="olymp-chat---messages-icon">
                          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-chat---messages-icon"></use></svg>
                      </a>
                      <div class="stat">
                        <div>PER </div>
                        <div class="figure">7.24</div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <a href="#" class="btn btn-control bg-primary">
                        <svg class="olymp-star-icon">
                          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-star-icon"></use></svg>
                      </a>
                      <div class="stat">
                        <div>BPS </div>
                        <div class="figure">80,654</div>
                      </div>
                    </td>
                    <td>
                      <a href="#" class="btn btn-control bg-purple">
                        <svg class="olymp-chat---messages-icon">
                          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-chat---messages-icon"></use></svg>
                      </a>
                      <div class="stat">
                        <div>PBR </div>
                        <div class="figure">0.62</div>
                      </div>
                    </td>
                  </tr>
                </table>
                </div>
              </div>
            </div>
          </div>
          <%-- 기업정보 카드 끝 --%>
          <%-- 체크포인트 카드 시작 --%>
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12 check-point-card">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">체크포인트</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <div class="ui-block-content">
                <div class="swiper-container" data-slide="fade">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">실적 정체</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">성장성</span> - 최근 1년간 실적 정체
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">매출액 증가율 보통. 자산 증가율 보통. 영업이익 증가율 보통</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">재무건전성 나쁨</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">안전성</span> -  재무건전성 나쁨
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">부채비율이 지나치게 높음</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">주가 저평가됨</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">밸류에이션</span> -  주가배수가 낮음
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">
                          주당 순자산가치(PBR)에 비해 주가가 낮게 책정되어있습니다.<br/>
                          주가매출비율(PSR)대비 주가가 높지 않습니다.<br/>
                          주가수익비율(PER)대비 주가가 낮습니다.
                        </div>
                      </div>
                    </div>
                  </div>
    
                  <!-- If we need pagination -->
                  <div class="swiper-pagination pagination-blue"></div>
                </div>
              </div>
            </div>
          </div>
          <%-- 체크포인트 카드 끝 --%>
        </div>
        <%-- 기업정보, 체크포인트 row 끝 --%>
        
        <%-- 현재가, 비재무정보 row 시작 --%>
        <div class="row">
          <%-- 현재가 카드 시작 --%>
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">현재가</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              <div class="ui-block-content">
                <table class="forums-table company-today-table">
                  <thead>
                    <tr>
<!--                        <th class="company-name">증감</th>  -->
                      <th class="stock-price">매도잔량</th>
                      <th class="trading-time" colspan="2"></th>
                      <th class="day-before">매수잔량</th>
<!--                        <th class="day-before-rate">증감</th> -->
                    </tr>
                  </thead>
      
                  <tbody>
                    <tr>
                      <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price plus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate plus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price plus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate plus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price plus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate plus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price plus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate plus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                     <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price plus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate plus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                     <td>
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price minus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate minus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                     <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                    </tr>
                    <tr>
                     <td>
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price minus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate minus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                     <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                    </tr>
                    <tr>
                     <td>
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price minus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate minus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                     <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                    </tr>
                    <tr>
                     <td>
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price minus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate minus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                     <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                    </tr>
                    <tr>
                     <td>
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="stock-price minus">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="day-before">
                        <div class="transition-rate minus">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                     <td class="trading-amount">
                        <a href="#" class="h6 count"></a>
                      </td>
                    </tr>
                    
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <%-- 현재가 카드 끝 --%>
          
          <%-- 비재무 정보 카드 시작 --%>
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">재무정보</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <div class="ui-block-content">
                <div class="monthly-indicator-wrap">
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count" id="bfsales">
                      9.855 <span class="period">전분기 매출액</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count" id="bfnetincomwe">
                      6.721 <span class="period">전분기 순이익</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count" id="salert">
                      2.047 <span class="period">전년도 매출액</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count" id="netrt">
                      1.536 <span class="period">전년도 순이익</span>
                    </div>
                  </div>
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count">
                      1.536 <span class="period">평균 근속연수</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-primary"> <svg
                        class="olymp-comments-post-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-comments-post-icon"></use></svg>
                    </a>
    
    
                    <div class="monthly-count">
                       30.94배<span class="period">임직원 임금격차</span>
                    </div>
                  </div>
                </div>
              </div>
    
            </div>
          </div>
          <%-- 비재무정보 카드 끝 --%>

        </div>
        <%-- 현재가, 비재무정보 row 끝 --%>
        
        <%-- 그래프 row 시작 --%>
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <!-- <div class="h6 title">KOSPI Line Graphic</div> -->
                <div><h6 class="title">${company.companyName} 차트</h6></div>
                <select id="chart-option" class="selectpicker form-control without-border" size="auto">
                  <option value="1">당일</option>
                  <option value="2">일단위</option>
                  <option value="3">주단위</option>
                  <option value="4">월단위</option>
                </select>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <div class="ui-block-content">
                <div class="chart-js chart-js-line-chart">
                  <canvas id="this-line-chart" width="1400" height="380"></canvas>
                </div>
              </div>
              
              <hr>
              
              <div class="ui-block-content display-flex content-around">
                <div class="chart-js chart-js-small-pie">
                  <canvas id="pie-small-chart" width="90" height="90"></canvas>
                </div>
                <div class="points points-block">
                  <span> <span class="statistics-point bg-breez"></span> Yearly Likes </span>
                  <span> <span class="statistics-point bg-yellow"></span> Yearly Comments </span>
                </div>
                <div class="text-stat">
                  <div class="count-stat">2.758</div>
                  <div class="title">Total Likes</div>
                  <div class="sub-title">This Year</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">5.420,7</div>
                  <div class="title">Average Likes</div>
                  <div class="sub-title">By Month</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">42.973</div>
                  <div class="title">Total Comments</div>
                  <div class="sub-title">This Year</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">3.581,1</div>
                  <div class="title">Average Comments</div>
                  <div class="sub-title">By Month</div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
        <%-- 그래프 row 끝 --%>
        
        <%-- 뉴스 row 시작 --%>
        <div class="row stock-index-news">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block">
              <div class="ui-block-title">
                <h6 class="title">News</h6>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              <ul class="notification-list">
                <c:forEach var="eachNews" items="${news}" varStatus="status">
                  <li>
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar${status.index+1}-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      <a href="#" class="h6 notification-friend">${eachNews.source}</a>
                      <a href="${eachNews.link}" target="_blank">${eachNews.title}</a>
                    </div>
                    <span class="notification-icon">
                      <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">${eachNews.date}</time></span>
                    </span>
                  </li>
                </c:forEach>
              </ul>
    
            </div>
          </div>
        </div>
        <%-- 뉴스 row 끝 --%>
      
      </div>
      <%-- 사이드 제외 컨텐츠 열 끝 --%>
    </div>
    <%-- 사이드 포함 row 끝 --%>
  </div>

  
  <!-- Window-popup-CHAT for responsive min-width: 768px -->
  <jsp:include page="../popup/popup-chat.jsp"></jsp:include>
  <!-- ... end Window-popup-CHAT for responsive min-width: 768px -->

  <!-- 구매 modal start -->
  <jsp:include page="../popup/stock-buy-modal.jsp"></jsp:include>
  <!-- ... 구매 modal end -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->

</body>
</html>