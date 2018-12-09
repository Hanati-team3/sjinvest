<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 보유자산</title>
<jsp:include page="../includes/head.jsp"></jsp:include>

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
    
    <a onclick="stop()" href="#">요청종료</a>
    
    <%-- 사이드 포함 row 시작 --%>
    <div class="row stock-holding-main">
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

        <%-- 자산 및 수익률 row 시작 --%>
        <div class="row">
          <%-- 자산 카드 시작 --%>
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">보유 자산</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              
              <div class="ui-block-content">
                <div class="chart-with-statistic">
                  <ul class="statistics-list-count">
                    <li>
                      <div class="points">
                        <span>
                          <span class="statistics-point bg-purple"></span>
                          <span class="rate">
                            주식 <fmt:formatNumber value="${holdingMap.stockTotal / holdingMap.total * 100}" pattern="##.##" />%
                          </span>
                        </span>
                      </div>
                      <div class="count-stat">
                        <fmt:formatNumber value="${holdingMap.stockTotal}" type="currency" currencySymbol="￦"/> 
                      </div>
                    </li>
                    <li>
                      <div class="points">
                        <span>
                          <span class="statistics-point bg-breez"></span>
                          <span class="rate">
                            현금 <fmt:formatNumber value="${holdingMap.cashTotal / holdingMap.total * 100}" pattern="##.##" />%
                          </span>
                        </span>
                      </div>
                      <div class="count-stat">
                        <fmt:formatNumber value="${holdingMap.cashTotal}" type="currency" currencySymbol="￦"/>
                      </div>
                    </li>
                  </ul>
    
                  <div class="chart-js chart-js-pie-color">
                    <canvas id="total-holding-chart" width="180" height="180"></canvas>
                    <div class="general-statistics">
                      <fmt:formatNumber value="${holdingMap.total}" type="currency" currencySymbol="￦"/>
                      <span>자산총액</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <%-- 자산 카드 끝 --%>
          <%-- 각 종목별 수입률 카드 시작 --%>
          <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">종목별 수익률</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              <div class="ui-block-content">
                <div class="swiper-container" data-slide="fade">
                  <div class="swiper-wrapper">
                    <c:forEach var="eachHolding" items="${holdingMap.holdingList}" varStatus="status">
                      <div class="swiper-slide">
                        <div class="statistics-slide">
                          <div class="chart-js chart-js-one-bar">
                            <canvas name="each-holding-chart" target="${eachHolding.companyName}" width="1400" height="800"></canvas>
                          </div>
              
                          <div class="chart-text">
                            <h6>${eachHolding.companyName}</h6>
                            <p>
                              <fmt:formatNumber value="${eachHolding.holdingTotalMoney}" pattern="#,###" />
                              원을 투자하여 
                              <fmt:formatNumber value="${eachHolding.holdingReturn}" pattern="##.##" />
                               원의 수익을 얻었습니다.
                            </p>
                          </div>
                        </div>
                      </div>
                  </c:forEach>
                  </div>
    
                  <!-- If we need pagination -->
                  <div class="swiper-pagination pagination-blue"></div>
                </div>
              </div>
            </div>
          </div>
          <%-- 각 종목별 수입률 카드 끝 --%>
        </div>
        <%-- 보유자산 목록 row 시작 --%>
        <div class="row">
          <%-- 보유자산 목록 카드 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12">
            <div class="ui-block">
              <table class="forums-table">
                <thead>
                  <tr>
                    <th class="company-number">종목번호</th>
                    <th class="company-name">기업명</th>
                    <th class="stock-price">현재주가</th>
                    <th class="holding-amount">보유량</th>
                    <th class="holding-total-money">보유금액</th>
                    <th class="profit-rate">수익률</th>
                    <th class="holding-sell">판매</th>
                  </tr>
                </thead>
    
                <tbody>
                  <c:forEach var="eachHolding" items="${holdingMap.holdingList}" varStatus="status">
                    <tr>
                      <td class="company-number">
                        <div class="forum-item">
                          <a href="<%=application.getContextPath()%>/stock/company/${eachHolding.companyNumber}" class="h6 count">${eachHolding.companyNumber}</a>
                        </div>
                      </td>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="<%=application.getContextPath()%>/stock/company/${eachHolding.companyNumber}" class="h6 title">${eachHolding.companyName}</a>
                          <time class="entry-date updated">${eachHolding.fieldName}</time>
                        </div>
                      </td>
                      <td class="stock-price"><a class="h6 count">${eachHolding.realTimePrice}</a>
                      </td>
                      <td class="holding-amount">
                        <a class="h6 count">${eachHolding.holdingAmount}</a>
                      </td>
                      <td class="holding-total-money">
                        <div class="author-freshness">
                          <a class="h6">
                            <fmt:formatNumber value="${eachHolding.realTimePrice * eachHolding.holdingAmount}" pattern="#,###" />
                          </a>
                        </div>
                      </td>
                      <td class="profit-rate">
                        <div class="author-freshness">
                          <a class="h6 plus"><fmt:formatNumber value="${eachHolding.holdingRateOfReturn}" pattern="##.##" />%</a>
                        </div>
                      </td>
                      <td class="holding-sell">
                        <a href="#" class="h6 count" data-toggle="modal" data-target="#stock_sell_modal">
                        <i class="fas fa-minus-circle"></i></a>
                      </td>
                    </tr>
                  </c:forEach>    
                </tbody>
              </table>
            </div>
          </div>
          <%-- 보유자산 목록 카드 끝 --%>
        </div>
        <%-- 보유자산 목록 row 끝 --%>
        
      </div>
      <%-- 사이드 제외 컨텐츠 열 끝 --%>
    </div>
    <%-- 사이드 포함 row 끝 --%>
  </div>

  <!-- ... end Widget Weather -->


  <!-- Window-popup-CHAT for responsive min-width: 768px -->
  <jsp:include page="../popup/popup-chat.jsp"></jsp:include>
  <!-- ... end Window-popup-CHAT for responsive min-width: 768px -->
  
  <!-- 판매 modal start -->
  <jsp:include page="../popup/stock-sell-modal.jsp"></jsp:include>
  <!-- ... 판매 modal end -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->
  
  <%-- stock-holding-list js --%>
  <script>
	var HOLDING = {};	//stock-holding-list 전역변수
  	// interest update를 활성화/중지
  	HOLDING.flag = true;
  	HOLDING.holdingList = [];
  	HOLDING.cashTotal = 0;
  	HOLDING.totalHoldingChart = document.getElementById("total-holding-chart");
  	HOLDING.eachHoldingCharts = document.getElementsByName("each-holding-chart");
  	HOLDING.eachHoldingChartElements = [];
  	
	$(document).ready(function() {
		HOLDING.cashTotal = ${holdingMap.cashTotal};
		setHoldingList();
		setTotalHoldingChart( ${holdingMap.stockTotal}, HOLDING.cashTotal);
		setSlideChart();
		holdingListUpdate();
	});
	
	/* holdingUpdate 요청을 중지하는 함수 */
  	function stop() {
  		HOLDING.flag = false;
  		console.log('stop');
  	}

	/* model의 holdingMap의 holdingList를 자바스크립트 배열 HOLDING.holdingList에 저장 */
	function setHoldingList() {
		<c:forEach var="eachHolding" items="${holdingMap.holdingList}" varStatus="status">
			HOLDING.holdingList.push({
              "holdingSeq": "${eachHolding.holdingSeq}",
              "companyNumber": "${eachHolding.companyNumber}",
              "companyName": "${eachHolding.companyName}",
              "userSeq": "${eachHolding.userSeq}",
              "holdingAmount": "${eachHolding.holdingAmount}",
              "holdingTotalMoney": "${eachHolding.holdingTotalMoney}",
              "holdingRateOfReturn": "${eachHolding.holdingRateOfReturn}",
              "holdingReturn": "${eachHolding.holdingReturn}",
              "realTimePrice": "${eachHolding.realTimePrice}"
		});
    	</c:forEach>
	}


	/* 전체 자산 비율 차트 세팅 */
	function setTotalHoldingChart(stock, cash) {
	    var ctx_pc = HOLDING.totalHoldingChart.getContext("2d");
	    var data_pc = {
	        labels: ["주식", "현금"],
	        datasets: [
	            {
	                data: [stock, cash],
	                borderWidth: 0,
	                backgroundColor: [
	                    "#7c5ac2",
	                    "#08ddc1"
	                ]
	            }]
	    };
	    console.log(ctx_pc );

	    HOLDING.totalHoldingChartEL = new Chart(ctx_pc, {
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

	}
	
	/* 현금 자산 비율 차트 업데이트 */
	function updateTotalHoldingChart(stock, cash) {
		console.log(HOLDING.totalHoldingChartEL.data.datasets[0].data);
		HOLDING.totalHoldingChartEL.data.datasets[0].data = [stock, cash];
		HOLDING.totalHoldingChartEL.update(0);
	}
	
	/** 자산 비율 카드 업데이트 */
	function updateRateCard(stockTotal) {
		var total = HOLDING.cashTotal + stockTotal;
		console.log("total : " + total);
		var liList = $(".chart-with-statistic li");
		// 주식
		$(liList[0]).find(".rate").text("주식 " +(stockTotal / total * 100).toFixed(2)+ "%");
		$(liList[0]).find(".count-stat").text("￦" + stockTotal.toLocaleString());
		// 현금
		$(liList[1]).find(".rate").text("현금 " +(HOLDING.cashTotal / total * 100).toFixed(2)+ "%");
		$(liList[1]).find(".count-stat").text("￦" + HOLDING.cashTotal.toLocaleString());
		// 자산총액
		$('.general-statistics').html("￦" + total.toLocaleString() + "<span>자산총액</span>");
	}
	
	/** 홀딩 테이블 업데이트 */
	function updateHoldingTable(holdingList) {

		$("table tbody tr").each(function(index, item){
			if(index < holdingList.length) {
    			console.log("each holdingList[index] , index : " + index);
    			console.log(holdingList[index]);
    			$(item).find(".company-number a").text(holdingList[index].companyNumber);
    			$(item).find(".company-name a").text(holdingList[index].companyName);
    			$(item).find(".stock-price a").text(holdingList[index].realTimePrice.toLocaleString());
    			$(item).find(".holding-amount a").text(holdingList[index].holdingAmount.toLocaleString());
    			$(item).find(".holding-total-money a").text((holdingList[index].realTimePrice * holdingList[index].holdingAmount).toLocaleString());
    			$(item).find(".profit-rate a").text(holdingList[index].holdingRateOfReturn.toFixed(2) + "%");
			}
		});
	}
	
	/** 각 보유종목 슬라이드 데이터 및 차트 업데이트 */
	function updateSlideCard(holdingList) {
		// 모든 슬라이드에 대해.. (each)
		// 슬라이드의 개수가 holdingList의 length보다 2 큼. 템플릿 js가 양쪽에 동적으로 슬라이드를 두개 붙이기 때문에
		$(".swiper-slide").each(function(index, item){
			for(var i = 0; i < holdingList.length; i++) {
				if($(item).find(".chart-text h6").text() == holdingList[i].companyName) {
					if(holdingList[i].holdingReturn > 0) {
						$(item).find(".chart-text p").html(holdingList[i].holdingTotalMoney.toLocaleString() + "원을 투자하여 "+
								"<span class='plus'> " + holdingList[i].holdingReturn.toLocaleString() +"</span> 원의 수익을 얻었습니다.");
					}
					else {
						$(item).find(".chart-text p").html(holdingList[i].holdingTotalMoney.toLocaleString() + "원을 투자하여 "+
								"<span class='minus'> " + holdingList[i].holdingReturn.toLocaleString() +"</span> 원의 수익을 얻었습니다.");
					}
					HOLDING.eachHoldingChartElements[index].data.datasets[0].data = 
						[HOLDING.holdingList[i].holdingAmount * HOLDING.holdingList[i].realTimePrice, 
                		HOLDING.holdingList[i].holdingTotalMoney, 
                		HOLDING.holdingList[i].holdingReturn];
					HOLDING.eachHoldingChartElements[index].update(0)
					break;
				}
			}
		});
	}
	

	/* 각 보유종목 슬라이드 차트 세팅 */
	function setSlideChart() {
		console.log("setEachHoldingCharts holdingList...");
		console.log(HOLDING.holdingList);
		for (var i = 0; i < HOLDING.eachHoldingCharts.length; i++) {
			window.aaa=HOLDING.eachHoldingCharts[0];
			for(var j = 0; j < HOLDING.holdingList.length; j++) {
				if(HOLDING.eachHoldingCharts[i].getAttribute("target") == HOLDING.holdingList[j].companyName){
					// 각 차트에 대해 세팅
					console.log("같음" + HOLDING.eachHoldingCharts[i].getAttribute("target") + "," + HOLDING.holdingList[j].companyName);
				    var ctx_ob = HOLDING.eachHoldingCharts[i].getContext("2d");
				    var data_ob = {
				        labels: ['전체 보유 금액', '투자금액', '수익금액'],
				        datasets: [{
				                backgroundColor: "#38a9ff",
				                data: [HOLDING.holdingList[j].holdingAmount * HOLDING.holdingList[j].realTimePrice, 
			                		HOLDING.holdingList[j].holdingTotalMoney, 
			                		HOLDING.holdingList[j].holdingReturn
				                	]
				            }]
				    };

				    HOLDING.eachHoldingChartElements.push(new Chart(ctx_ob, {
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
				    }));
					break;
				}
			}

		}
	}

	/* 각 보유종목 슬라이드 차트 업데이트 */		// 카드업데이트에서 차트업데이트도 처리함
	/* 
	function updateSlideChart() {
		console.log(HOLDING.totalHoldingChartEL.data.datasets[0].data);
		HOLDING.totalHoldingChartEL.data.datasets[0].data = [stock, cash];
		HOLDING.totalHoldingChartEL.update(0); */
	}
	 */
	/* 실시간 홀딩 데이터 업데이트(2초마다) */
	function holdingListUpdate() {
		if(HOLDING.flag) {
    		$.ajax({
    			type : "POST",
    			url : "update",
    			dataType : "json",
    			contentType: "application/json; charset=utf-8",
    			data: JSON.stringify(HOLDING.holdingList),
    			success : function(map) {
    				console.log(map);
    				window.stock = map;
    				//현금자산비율 카드 업데이트
    				updateRateCard(map.holdingWidget.stockTotal);
    				//현금자산비율 차트 업데이트
    				updateTotalHoldingChart(map.holdingWidget.stockTotal, HOLDING.cashTotal);
    				//보유자산 테이블 업데이트
    				updateHoldingTable(map.holdingWidget.holdingList);
    				//항목별 정보 카드 업데이트
    				updateSlideCard(map.holdingWidget.holdingList);
    				//항목별 정보 차트 업데이트
    				//updateSlideChart(map.holdingWidget.holdingList);
    				//setTimeout(holdingListUpdate, 2000);
    			},
    			error : function(request, status, error) {
    				console.log("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			}
    		})
		}
	}
	
	</script>


</body>
</html>