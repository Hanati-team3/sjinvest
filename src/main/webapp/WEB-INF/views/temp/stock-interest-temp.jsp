<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 관심종목</title>
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
    <div class="row stock-interest-main">
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

        <%-- 관심종목 목록 row 시작 --%>
        <div class="row">
          <%-- 관심종목 목록 카드 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12">
            <div class="ui-block">
              <table class="forums-table">
                <thead>
                  <tr>
                    <th class="company-number">종목번호</th>
                    <th class="company-name">기업명</th>
                    <th class="stock-price">현재주가</th>
                    <th class="trading-amount">거래량</th>
                    <th class="day-before">전일대비</th>
                    <th class="day-before-rate">등락률</th>
                    <th class="add-to-interest">관심목록제거</th>
                  </tr>
                </thead>
    
                <tbody>
                  <c:forEach var="eachInterest" items="${interestStockList}" varStatus="status">
                    <tr>
                      <td class="company-number">
                        <div class="forum-item">
                          <a href="#" class="h6 count">${eachInterest.stockCode}</a>
                        </div>
                      </td>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">${eachInterest.stockName}</a>
                          <time class="entry-date updated">${eachInterest.fieldName}</time>
                        </div>
                      </td>
                      <td class="stock-price"><a href="#" class="h6 count">${eachInterest.stockPrice}</a>
                      </td>
                      <td class="trading-amount">
                        <a href="#" class="h6 count">${eachInterest.stockVolume}</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">${eachInterest.stockChange}</a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">${eachInterest.stockDiff}</a>
                        </div>
                      </td>
                      <td class="remove-interest">
                          <a href="#" class="more"><i class="fas fa-heart"></i></a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <%-- 관심종목 목록 카드 끝 --%>
        </div>
        <%-- 관심종목 목록 row 끝 --%>
        
<%--         각 기업 그래프 row 시작
        <div class="row">
          각 기업 그래프 카드 시작
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12 stock-my-interest">
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
                        <div class="company-name" data-swiper-parallax="-500">하나금융지주</div>
                        <div class="company-stock" data-swiper-parallax="-500">38,750</div>
                        <span class="indicator negative"> 전일대비 + 800</span>
    					<div class="chart-js chart-js-line-stacked">
    						<canvas id="line-stacked-chart" width="730" height="300"></canvas>
    					</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">358</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">Olympus</span> Posts Rank
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">The Olympus Rank measures the quantity of comments, likes and posts.</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">711</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">Olympus</span> Posts Rank
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">The Olympus Rank measures the quantity of comments, likes and posts.</div>
                      </div>
                    </div>
                  </div>
  
                  <!-- If we need pagination -->
                  <div class="swiper-pagination pagination-blue"></div>
                </div>
              </div>
            </div>
          </div>
          각 기업 그래프 카드 끝
        </div>
        각 기업 그래프 row 끝
        
        그래프 row 시작
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <div><h6 class="title">차트 혼합 비교</h6></div>
                <select class="selectpicker form-control without-border" size="auto">
                  <option value="LY">주가</option>
                  <option value="2">거래량</option>
                  <option value="2">전일대비</option>
                </select>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <div class="ui-block-content">
                <div class="chart-js chart-js-line-chart">
                  <canvas id="line-chart" width="1400" height="380"></canvas>
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
        그래프 row 끝
         --%>
        <%-- 뉴스 row 시작 --%>
        <div class="row stock-index-news">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block">
              <div class="ui-block-title">
                <h6 class="title">News</h6>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <ul class="notification-list">
                <li>
                  <div class="author-thumb">
                    <img src="<%=application.getContextPath()%>/resources/img/avatar1-sm.jpg" alt="author">
                  </div>
                  <div class="notification-event">
                    <a href="#" class="h6 notification-friend">서울경제</a>
                    오전 11:30 현재 코스피는 50:50으로 보합세, 매수강세 업종은 철강..
                  </div>
                  <span class="notification-icon">
                    <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">9 hours ago</time></span>
                  </span>
                </li>
    
                <li class="un-read">
                  <div class="author-thumb">
                    <img src="<%=application.getContextPath()%>/resources/img/avatar2-sm.jpg" alt="author">
                  </div>
                  <div class="notification-event">
                    <a href="#" class="h6 notification-friend">한국경제 </a>
                    코스피, 외국인·기관 '팔자'에 약보합세…5G 기대 통신株 '강세'
                  </div>
                  <span class="notification-icon">
                    <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">9 hours ago</time></span>
                  </span>
                </li>
                
                <li class="un-read">
                  <div class="author-thumb">
                    <img src="<%=application.getContextPath()%>/resources/img/avatar3-sm.jpg" alt="author">
                  </div>
                  <div class="notification-event">
                    <a href="#" class="h6 notification-friend">IBK투자증권 </a>
                    [Start with IBKS]KOSPI는 기관과 외국인의 순매수로 상승함
                  </div>
                  <span class="notification-icon">
                    <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">9 hours ago</time></span>
                  </span>
                </li>
 
              </ul>
    
            </div>
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link"
                  href="#" tabindex="-1">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1
                    <div class="ripple-container">
                      <div class="ripple ripple-on ripple-out"
                        style="left: -10.3833px; top: -16.8333px; background-color: rgb(255, 255, 255); transform: scale(16.7857);"></div>
                    </div>
                </a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">...</a></li>
                <li class="page-item"><a class="page-link" href="#">12</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a>
                </li>
              </ul>
            </nav>
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
  
  <script>
	var INTEREST = {};	//stock-interest 전역변수
  	// interest update를 활성화/중지
  	INTEREST.flag = true;
  	INTEREST.interestNumberArray = [];
  	
    $(document).ready(function() {
    	<c:forEach var="number" items="${interestNumberList}" varStatus="status">
    	INTEREST.interestNumberArray.push("${number}");
    	</c:forEach>
    	
    	// index update 호출
    	console.log("interestNumberArray" + INTEREST.interestNumberArray );
    	interestUpdate();
    	// 차트 업데이트 호출
    	//allChartUpdate(indexParam.interestCompanyNumberList, 1);
    });
    
	/* interestUpdate 요청을 중지하는 함수 */
  	function stop() {
  		INTEREST.flag = false;
  		console.log('stop');
  	}
    
    /** 2초마다 interest 정보 업데이트 */
    function interestUpdate() {
    	if(INTEREST.flag) {
    		$.ajax({
    			type : "GET",
    			url : "update",
    			dataType : "json",
    	        traditional : true,
    			contentType: "application/json; charset=utf-8",
    			data : { 
    				"interestCompanyNumberArray" : INTEREST.interestNumberArray
    			},
    			success : function(interestData) {
    				console.log("interestData .. ");
    				console.log(interestData);
    				setInterestData(interestData);
    			},
    			error : function(request, status, error) {
    				console.log("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			}
    		});
    	}
    }
  
    function setInterestData(interestData) {
    	$(".stock-index-trend li").each(function(index, item){
    		$(item).find(".fieldName").text(fieldStock[index].fieldName);
    		$(item).find(".count-stat").text(fieldStock[index].fieldAmount.toLocaleString())
    	});
    }
  </script>

</body>
</html>