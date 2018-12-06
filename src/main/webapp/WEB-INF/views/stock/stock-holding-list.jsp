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
                            주식
                            %
                          </span>
                        </span>
                      </div>
                      <div class="count-stat">
                      </div>
                    </li>
                    <li>
                      <div class="points">
                        <span>
                          <span class="statistics-point bg-breez"></span>
                          <span class="rate">
                            현금 
                            %
                          </span>
                        </span>
                      </div>
                      <div class="count-stat">
                      </div>
                    </li>
                  </ul>
    
                  <div class="chart-js chart-js-pie-color">
                    <canvas id="pie-color-chart" width="180" height="180"></canvas>
                    <div class="general-statistics">
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
                    <c:forEach var="eachHolding" items="${holdingWidget.holdingList}" varStatus="status">
                      <div class="swiper-slide">
                        <div class="statistics-slide">
                          <div class="circle-progress circle-pie-chart">
                            <div class="pie-chart" data-value="${eachHolding.holdingRateOfReturn / 100}"
                              data-startcolor="#38a9ff" data-endcolor="#317cb6">
                              <div class="content">
                                <span>%</span>
                              </div>
                            </div>
                          </div>
              
                          <div class="chart-text">
                            <h6>${eachHolding.companyName}</h6>
                            <p>
                              <fmt:formatNumber value="${eachHolding.holdingTotalMoney}" pattern="#,###" />
                              원을 투자하여 
                              <fmt:formatNumber value="${eachHolding.holdingRateOfReturn}" pattern="##.#" />%
                              의 수익을 얻었습니다.
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
                  <c:forEach var="eachHolding" items="${holdingWidget.holdingList}" varStatus="status">
                    <tr>
                      <td class="company-number">
                        <div class="forum-item">
                          <a href="#" class="h6 count">${eachHolding.companyNumber}</a>
                        </div>
                      </td>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">${eachHolding.companyName}</a>
                          <time class="entry-date updated"
                            datetime="2017-06-24T18:18">은행</time>
                        </div>
                      </td>
                      <td class="stock-price"><a href="#" class="h6 count">88888</a>
                      </td>
                      <td class="holding-amount">
                        <a href="#" class="h6 count">${eachHolding.holdingAmount}</a>
                      </td>
                      <td class="holding-total-money">
                        <div class="author-freshness plus">
                          <a href="#" class="h6">
                            <fmt:formatNumber value="${eachHolding.holdingTotalMoney}" pattern="#,###" />
                          </a>
                        </div>
                      </td>
                      <td class="profit-rate">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 plus"><fmt:formatNumber value="${eachHolding.holdingRateOfReturn}" pattern="##.#" />%</a>
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
	$(document).ready(function() {
		var holdingList = "${holdingWidget.holdingList}";
		var cashTotal = "${holdingWidget.cashTotal}";
		console.log(holdingList);
		holdingListUpdate(holdingList);
	});

	function holdingListUpdate(holdingList, cashTotal) {
		$.ajax({
			type : "POST",
			url : "update",
			dataType : "json",
			contentType: "application/json; charset=utf-8",
			data : JSON.stringify({
				"holdingList" : [
				{
		            "holdingSeq": 6,
		            "companyNumber": "090430",
		            "companyName": "아모레퍼시픽",
		            "userSeq": 2,
		            "holdingAmount": 701,
		            "holdingTotalMoney": 39404,
		            "holdingRateOfReturn": 47.7836290535892
		        },
		        {
		            "holdingSeq": 7,
		            "companyNumber": "051900",
		            "companyName": "LG생활건강",
		            "userSeq": 2,
		            "holdingAmount": 25,
		            "holdingTotalMoney": 25233,
		            "holdingRateOfReturn": 28.487200112530125
		        }
		        ],
				"cashTotal" : "500000",
			}),
			success : function(stockData) {
				console.log(stockData);
				window.stock = stockData;
				setRateCard(stockData);
				setHoldingTable(stockData.holdingList);
				setChartCard(stockData.holdingList);
				setTimeout(holdingListUpdate, 2000);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
	
	/** 자산 비율 카드 세팅 */
	function setRateCard(holdingData) {
		console.log("total : " + holdingData.stockTotal.toLocaleString());
		var liList = $(".chart-with-statistic li");
		// 주식
		$(liList[0]).find(".rate").text("주식 " +(holdingData.stockTotal / holdingData.total * 100).toFixed(2)+ "%");
		$(liList[0]).find(".count-stat").text(holdingData.stockTotal.toLocaleString());
		// 현금
		$(liList[1]).find(".rate").text("현금 " +(holdingData.cashTotal / holdingData.total * 100).toFixed(2)+ "%");
		$(liList[1]).find(".count-stat").text(holdingData.cashTotal.toLocaleString());
		// 자산총액
		$('.general-statistics').html(holdingData.stockTotal.toLocaleString() + "<span>자산총액</span>");
	}
	
	/** 홀딩 테이블 세팅 */
	function setHoldingTable(holdingList) {
		$("table tr").each(function(index, item){
			console.log("length" + holdingList.length);
			if(index < holdingList.length) {
				//원래는  return 하지 말고 밑에있는 행 지워야함. ㄱㅊ
    			console.log("each" + holdingList[index]);
    			$(item).find(".company-number a").text(holdingList[index].companyNumber);
    			$(item).find(".company-name a").text(holdingList[index].companyName);
    			$(item).find(".stock-price a").text(holdingList[index].stockPrice);
    			$(item).find(".holding-amount a").text(holdingList[index].holdingAmount);
    			$(item).find(".holding-total-money a").text(holdingList[index].holdingTotalMoney );
    			$(item).find(".profit-rate a").text(holdingList[index].holdingRateOfReturn.toFixed(2));
			}
			else {
				//지우기
			}
		});
	}
	
	/** 차트 세팅 */
	function setChartCard(holdingList) {
		// 모든 슬라이드에 대해
		$(".swiper-slide").each(function(index, item){
			if(index < holdingList.length) {
				//원래는  return 하지 말고 밑에있는 행 지워야함. ㄱㅊ
    			console.log("each" + holdingList[index]);
    			var figure = (holdingList[index].holdingRateOfReturn / 100).toFixed(2);
    			console.log(figure);
    			$(item).find(".pie-chart").attr('data-value', figure);
			}
			else {
				//지우기
			}
		});
	}
	
	</script>


</body>
</html>