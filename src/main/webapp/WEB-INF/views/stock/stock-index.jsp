<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자</title>
<jsp:include page="../includes/head.jsp"></jsp:include>
<!-- 로딩중 -->
<style>
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; 
 } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; 
 }

</style>
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
  
   <div class="container" id="loading-container">
    <div class="row">
      <div id="loader">
          <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="lading"></div>
      </div>
    </div>
  </div>
    
  <div class="container" id="real-container" >
    <%-- realtime row 시작 --%>
    <div class="row realtime">
      <!-- realtime start -->
      <div class="col-xl-12 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12" style="float:right">
        <jsp:include page="../includes/realtime.jsp"></jsp:include>
      </div>
      <!-- ..realtime end -->
    </div>
    <%-- realtime row 끝 --%>
    
    
    <a onclick="stop()" href="#">요청종료</a>
    
    
    <%-- 사이드 포함 row 시작 --%>
    <div class="row stock-index-main">
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
        <div class="ui-block">
          <form class="w-search" style="width: 100%;">
            <div class="form-group with-button is-empty">
              <input class="form-control" type="text" placeholder="회사명/업종 검색...">
              <button style="background-color: #3f4257;">
                <svg class="olymp-magnifying-glass-icon">
                  <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-magnifying-glass-icon"></use></svg>
              </button>
              <span class="material-input"></span>
            </div>
          </form>
        </div>
        <%-- 검색 시작 --%>

        <%-- row 시작 --%>
        <div class="row">
          <%-- Trend By Business Type 시작 --%>
          <div class="col-xl-5 order-xl-1 col-lg-5 order-lg-1 col-md-5 order-md-1 col-sm-12 col-xs-12 stock-index-trend">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">업종별 거래량</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              <div class="ui-block-content">
                <div class="chart-with-statistic">
                  <ul class="statistics-list-count">
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-purple"></span><span class="fieldName">화장품</span></span>
                      </div>
                      <div class="count-stat"><fmt:formatNumber value="56123" pattern="#,###"/>K<br></div>
                      
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-breez"></span><span class="fieldName">IT/게임</span></span>
                      </div>
                      <div class="count-stat"><fmt:formatNumber value="564862" pattern="#,###"/>K</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-primary"></span><span class="fieldName">백화점</span></span>
                      </div>
                      <div class="count-stat"><fmt:formatNumber value="212345" pattern="#,###"/>K</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-yellow"></span><span class="fieldName">자동차</span></span>
                      </div>
                      <div class="count-stat"><fmt:formatNumber value="97563" pattern="#,###"/>K</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-blue"></span><span class="fieldName">은행</span></span>
                      </div>
                      <div class="count-stat"><fmt:formatNumber value="1157" pattern="#,###"/>K</div>
                    </li>
                  </ul>
  
                  <div class="chart-js chart-js-pie-color">
                    <canvas id="field-chart" width="180" height="180"></canvas>
                    <div class="general-statistics"> 
                      <fmt:formatNumber value="55388" pattern="#,###"/>K
                      <span>5개 업종의 거래량 합</span> 
                    </div>
                  </div>
                </div>
              </div>
  
            </div>
          </div>
          <%-- Trend By Business Type 끝 --%>
          <%-- My interest 시작 --%>
          <div class="col-xl-7 order-xl-2 col-lg-7 order-lg-2 col-md-7 order-md-2 col-sm-12 col-xs-12 stock-my-interest">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">나의 관심 종목</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
  
              <div class="ui-block-content">
                <div class="swiper-container" data-slide="fade">
                  <div class="swiper-wrapper">
                      <div class="swiper-slide">
                        <div class="statistics-slide">
                          <div class="company-name" data-swiper-parallax="-500">
                            <a href="<%=application.getContextPath()%>/stock/company/${eachInterest.stockCode}">아모레퍼시픽</a>
                          </div>
                          <div class="company-stock" data-swiper-parallax="-500">187,350</div>
                          <span class="indicator">전일대비 9000  +5.3%</span>
                          <div class="chart-js chart-js-line-stacked">
                            <canvas id="interest-line-stacked-chart" target="${eachInterest.stockCode}" width="730" height="300"></canvas>
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
          <%-- My interest 끝 --%>
        </div>
        <%-- row 끝 --%>
        
        <%-- 그래프 row 시작 --%>
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12 stock-kospi-card">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <!-- <div class="h6 title">KOSPI Line Graphic</div> -->
                <div><h6 class="title">KOSPI Line Graphic</h6></div>
                <select class="selectpicker form-control without-border" size="auto">
                  <option value="LY">1일</option>
                  <option value="2">1개월</option>
                  <option value="3">3개월</option>
                  <option value="3">1년</option>
                </select>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <div class="ui-block-content">
                <div class="chart-js chart-js-line-chart">
                  <canvas id="kospi-line-chart" width="1400" height="380"></canvas>
                </div>
              </div>
              
              <hr>
              
              <div class="ui-block-content display-flex content-around">
                <div class="text-stat">
                  <div class="count-stat">2,082.5</div>
                  <div class="title">시가</div>
                  <div class="sub-title">현재주가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">2,500.1</div>
                  <div class="title">고가</div>
                  <div class="sub-title">오늘고가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">1,980.5</div>
                  <div class="title">저가</div>
                  <div class="sub-title">오늘저가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">2,006</div>
                  <div class="title">종가</div>
                  <div class="sub-title">어제 마감시가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat">478,956,100</div>
                  <div class="title">거래량</div>
                  <div class="sub-title">코스피 전체 거래량</div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
        <%-- 그래프 row 끝 --%>
        
        <%-- 자세한 정보 row 시작 --%>
        <div class="row stock-index-tab">
          <div class="col-lg-12 col-sm-12 col-xs-12 stock-top-tab">
            <div class="ui-block">
              <div class="news-feed-form">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs stock-index-ul" role="tablist" >
                  <li class="nav-item" ><a class="nav-link active inline-items" data-toggle="tab"
                    href="#rising-rate" role="tab" aria-expanded="true"> <span>상승률 상위</span>
                  </a></li>
                  <li class="nav-item" ><a class="nav-link  inline-items" data-toggle="tab" 
                    href="#falling-rate" role="tab" aria-expanded="false"><span>하락률 상위</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#foreigner" role="tab" aria-expanded="false"><span>외국인 순매수</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#institution" role="tab" aria-expanded="false"><span>기관 순매수</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link  inline-items" data-toggle="tab" 
                    href="#trading-amount" role="tab" aria-expanded="false"><span>거래량</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link  inline-items" data-toggle="tab" 
                    href="#total-value" role="tab" aria-expanded="false"><span>시가총액</span>
                  </a></li>
                </ul>
        
                <!-- Tab panes -->
                <div class="tab-content">
                  <%-- rising-rate탭 시작 --%>
                  <div class="tab-pane active " id="rising-rate" role="tabpanel" aria-expanded="true">
                    <div class="ui-block" data-mh="pie-chart" style="border-top: none;">
                      <div class="ui-block-title">
                        <div class="h6 title">상승률 상위 10 종목</div>
                        <a href="#" class="more"><i class="far fa-question-circle"></i></a>
                      </div>
            
                      <div class="ui-block-content">
                        <div class="chart-js chart-js-one-bar">
                          <canvas id="rising-rate-chart" name="tab-charts" width="1400" height="380"></canvas>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- rising-rate탭 끝 --%>
                  <%-- falling-rate탭 시작 --%>
                  <div class="tab-pane" id="falling-rate" role="tabpanel" aria-expanded="true">
                    <div class="ui-block" data-mh="pie-chart" style="border-top: none;">
                      <div class="ui-block-title">
                        <div class="h6 title">하락률 상위 10 종목</div>
                        <a href="#" class="more"><svg class="olymp-three-dots-icon">
                            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                      </div>
            
                      <div class="ui-block-content">
                        <div class="chart-js chart-js-one-bar">
                          <canvas id="falling-rate-chart" name="tab-charts" width="1400" height="380"></canvas>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- falling-rate 끝 --%>
                  <%-- foreigner 탭 시작 --%>
                  <div class="tab-pane"  id="foreigner" role="tabpanel" aria-expanded="true">
                    <div class="ui-block">
                    
                      <div class="ui-block-title">
                        <div class="h6 title">외국인 매수 상위 10 종목</div>
                        <a href="#" class="more"><svg class="olymp-three-dots-icon">
                            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                      </div>
                      
                      <div class="ui-block-content">
                        <div class="chart-js chart-js-one-bar">
                          <canvas id="foreigner-chart" name="tab-charts" width="1400" height="380"></canvas>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- foreigner 탭 끝 --%>
                  
                  <%-- institution 탭 시작 --%>
                  <div class="tab-pane" id="institution" role="tabpanel" aria-expanded="true">
                    <div class="ui-block">
                    
                      <div class="ui-block-title">
                        <div class="h6 title">기관 매수 상위 10 종목</div>
                        <a href="#" class="more"><svg class="olymp-three-dots-icon">
                            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                      </div>
                      <div class="ui-block-content">
                        <div class="chart-js chart-js-one-bar">
                          <canvas id="institution-chart" name="tab-charts" width="1400" height="380"></canvas>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- institution 탭 끝 --%>
                  
                  <%-- trading-amount 탭 시작 --%>
                  <div class="tab-pane " id="trading-amount" role="tabpanel" aria-expanded="true">
                    <div class="row">
                      <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="ui-block responsive-flex">
                        
                          <div class="ui-block-title">
                            <div class="h6 title">거래량 상위 10 종목</div>
                            <a href="#" class="more"><svg class="olymp-three-dots-icon">
                                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                          </div>
                
                          <div class="ui-block-content">
                            <div class="chart-js chart-js-one-bar">
                              <canvas id="trading-amount-chart" name="tab-charts" width="1400" height="380"></canvas>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- trading-amount 탭 끝 --%>
                  
                  <%-- total-value 탭 시작 --%>
                  <div class="tab-pane" id="total-value" role="tabpanel" aria-expanded="true">
                    <div class="row">
                      <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="ui-block responsive-flex">
                        
                          <div class="ui-block-title">
                            <div class="h6 title">시가총액 상위 10 종목</div>
                            <a href="#" class="more"><svg class="olymp-three-dots-icon">
                                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                          </div>
                
                          <div class="ui-block-content">
                            <div class="chart-js chart-js-one-bar">
                              <canvas id="total-money-chart" name="tab-charts" width="1400" height="380"></canvas>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- total-value 탭 끝 --%>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%-- 자세한 정보 row 끝 --%>
        
        
        <%-- 뉴스 row 시작 --%>
        <div class="row stock-index-news">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block">
              <div class="ui-block-title">
                <h6 class="title">News</h6>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              
              <ul class="notification-list">
                <c:forEach var="item" items="${news}" varStatus="status">
                <li>
                  <div class="author-thumb">
                    <img src="<%=application.getContextPath()%>/resources/img/avatar${status.index+1}-sm.jpg" alt="author">
                  </div>
                  <div class="notification-event">
                    <a href="${item.link}" class="h6 notification-friend">${item.source}</a>
                    <a href="${item.link}" target="_blank" class="news-title" >${item.title}</a>
                  </div>
                  <span class="notification-icon">
                    <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">${item.date}</time></span>
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
  <!-- ... end Widget Weather -->


  <!-- Window-popup-CHAT for responsive min-width: 768px -->
  <jsp:include page="../popup/popup-chat.jsp"></jsp:include>
  <!-- ... end Window-popup-CHAT for responsive min-width: 768px -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->
  <%-- stock-index js --%>
  <%-- <script src="<%=application.getContextPath()%>/resources/js/stock-index/stock-index.js"></script> --%>
  
  
  <script>
  	var INDEX = {};	//stock-index 전역변수
  	INDEX.tabList = ["rising-rate", "falling-rate", "foreigner", "institution", "trading-amount", "total-value"];
  	// index update를 활성화/중지
  	INDEX.flag = true;
  	INDEX.isEmptyInterest = false;
  	INDEX.fieldChartEl = null;
  	INDEX.tabCharts = document.getElementsByName("tab-charts");
  	INDEX.eachTabChartElements = [false, false, false, false, false, false];	// 차트 처음 만들어지면 차트element 넣기. false이면 처음 만들어질 때.
  	
	$(document).ready(function() {
		console.log('ready... model로 받은 어트리뷰트');
		console.log('${realTime}');
		console.log('${companyList}');
		console.log('${fieldStock}');
		console.log("${kospiMap}");
		console.log('${topTab}');
		console.log("${interestMap}");
		console.log('${holdingWidget}');
		
		var fieldChart = document.getElementById("field-chart");
	    var ctx_pc = fieldChart.getContext("2d");
	    var data_pc = {
	        labels: ["${fieldStock.get(0)[0]}", "${fieldStock.get(1)[0]}", "${fieldStock.get(2)[0]}", "${fieldStock.get(3)[0]}", "${fieldStock.get(4)[0]}"],
	        datasets: [
	            {
	                data: ["57052", "66884", "754212", "88222", "457521"],
	                borderWidth: 0,
	                backgroundColor: [
	                    "#7c5ac2",
	                    "#08ddc1",
	                    "#ff5e3a",
	                    "#ffdc1b",
	                    "#38a9ff"
	                ]
	            }]
	    };

	    INDEX.fieldChartEl  = new Chart(ctx_pc, {
	        type: 'doughnut',
	        data: data_pc,
	        options: {
	            deferred: {           // enabled by default
	                delay: 300        // delay of 500 ms after the canvas is considered inside the viewport
	            },
	            cutoutPercentage:93,
	            legend: {
	                display: false
	            },
	            animation: {
	                animateScale: false
	            }
	        }
	    });
	    
	    
	    
	    
	    var ctx_ob =  INDEX.tabCharts[0].getContext("2d");
	    var stockNames = [];
	    var stockValues = [];
	    
	    var data_ob = {
	        labels: ['삼성', '하나금융지주', '아모레퍼시픽', '현대자동차', 'NAVER', '기아차', '기업은행', '넷마블'],
	        datasets: [{
	                backgroundColor: "#38a9ff",
	                data: [20, 18, 12, 8, 2.5, 1.3, 0.5, 0.2]
	            }]
	    };

		INDEX.eachTabChartElements[0] = new Chart(ctx_ob, {
	        type: 'bar',
	        data: data_ob,
	        options: {
	            deferred: {           // enabled by default
	                delay: 200        // delay of 500 ms after the canvas is considered inside the viewport
	            },
	            tooltips: {
	                enabled:true
	            },
	            legend: {
	                display: false
	            },
	            responsive: true,
	            scales: {
	                xAxes: [{
	                    stacked: true,
	                    barPercentage:0.6,
	                    gridLines: {
	                        display: false
	                    },
	                    ticks: {
	                        fontColor: '#888da8'
	                    }
	                }],
	                yAxes: [{
	                    stacked: true,
	                    gridLines: {
	                        color: "#f0f4f9"
	                    },
	                    ticks: {
	                        beginAtZero:true,
	                        fontColor: '#888da8'
	                    }
	                }]
	            }
	        }
	    });
		
	    
	    
		var eachData = [];
	    var ctx_ls = document.getElementById("interest-line-stacked-chart").getContext("2d");
	    var data_ls = {
	        labels: ["09:00","09:10","09:20","09:30","09:40"],
	        datasets: [
	            {
	                label: " 원 ",
	                 	backgroundColor: "rgba(57,169,255,0.35)",
	                borderColor: "#38a9ff",
	                borderWidth: 2,
	                pointBorderColor: "#38a9ff",
	                pointBackgroundColor: "#fff",
	                pointBorderWidth: 1,
	                pointRadius: 1,
	                pointHoverRadius: 1,
	                data: ['145,000','145,500','146,000','143,000','144,000']
	            }]
	    };

	    var myLineStackedEl = new Chart(ctx_ls, {
	        type: 'line',
	        data: data_ls,
	        options: {
	            legend: {
	                display: false
	            },
	            responsive: true,
	            scales: {
	                xAxes: [{
	                    gridLines: {
	                        color: "#f0f4f9"
	                    },
	                    ticks: {
	                        fontColor: '#888da8'
	                    }
	                }],
	                yAxes: [{
	                    gridLines: {
	                        display: false
	                    },
	                    ticks: {
	                        fontColor: '#888da8'
	                    }
	                }]
	            }
	        }
	    });
	    
	    
		var lineChart = document.getElementById("kospi-line-chart");
	    var ctx_lc = lineChart.getContext("2d");
	    var data_lc = {
	        labels: ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00'],
	        datasets: [
	            {
	                label: " 원 ",
	                borderColor: "#ffdc1b",
	                borderWidth: 4,
	                pointBorderColor: "#ffdc1b",
	                pointBackgroundColor: "#fff",
	                pointBorderWidth: 3,
	                pointRadius: 1,
	                pointHoverRadius: 1,
	                fill: false,
	                lineTension:0,
	                data: ['2500', '2600', '2400', '2800', '2550', '2400']
	            }]
	    };
	    
	    INDEX.config = {
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
	                          fontColor: '#888da8'
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
	                          fontColor: '#888da8'
	                      }
	                  }]
	              }
	          }
		}
	    INDEX.kospiChartEl = new Chart(ctx_lc, INDEX.config);

	});

  </script>
</body>
</html>