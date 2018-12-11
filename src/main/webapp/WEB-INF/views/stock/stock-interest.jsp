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
                    <th class="hidden-index" hidden="true;">인덱스</th>
                    <th class="company-number">종목번호</th>
                    <th class="company-name">기업명</th>
                    <th class="stock-price">현재주가</th>
                    <th class="day-before">전일대비</th>
                    <th class="day-before-rate">등락률</th>
                    <th class="add-to-interest">관심목록제거</th>
                  </tr>
                </thead>
    
                <tbody>
                  <c:choose>
                    <c:when test="${interestNumberList.size() == 0}">
                      <tr>
                        <td colspan="7">관심종목이 없습니다.</td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach var="eachInterest" items="${interestStockList}" varStatus="status">
                        <tr>
                          <td class="hidden-index" hidden="true;">${status.index}</td>
                          <td class="company-number">
                            <div class="forum-item">
                              <a href="<%=application.getContextPath()%>/stock/company/${eachInterest.stockCode}" class="h6 count">${eachInterest.stockCode}</a>
                            </div>
                          </td>
                          <td class="company-name">
                            <div class="author-freshness">
                              <a href="<%=application.getContextPath()%>/stock/company/${eachInterest.stockCode}" class="h6 title">${eachInterest.stockName}</a>
                              <time class="entry-date updated">${eachInterest.fieldName}</time>
                            </div>
                          </td>
                          <td class="stock-price"><a href="#" class="h6 count">${eachInterest.stockPrice}</a>
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
                    </c:otherwise>
                  </c:choose>
                </tbody>
              </table>
            </div>
          </div>
          <%-- 관심종목 목록 카드 끝 --%>
        </div>
        <%-- 관심종목 목록 row 끝 --%>
        
        <%-- 뉴스 row 시작 --%>
        <div class="row stock-index-news">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block">
              <div class="ui-block-title">
                <h6 class="title">News</h6>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <ul class="notification-list">
                <c:choose>
                  <c:when test="${interestNumberList.size() == 0}">
                    <li style="text-align: center;">
                      관심종목관련 뉴스가 없습니다.
                    </li>
                  </c:when>
                  <c:otherwise>
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
                  </c:otherwise>
                </c:choose>
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
    	console.log("${interestStockList}");
    	<c:forEach var="number" items="${interestNumberList}" varStatus="status">
    	INTEREST.interestNumberArray.push("${number}");
    	</c:forEach>
    	console.log("interestNumberArray : " + INTEREST.interestNumberArray );
    	
    	
    	if(INTEREST.interestNumberArray.length != 0) {
	    	// index update 호출
	    	interestUpdate();
        	// news 가져오기 호출
        	getNews();
    	}
    	
    });
    
	/* interestUpdate 요청을 중지하는 함수 */
  	function stop() {
  		INTEREST.flag = false;
  		console.log('stop');
  	}
	
	/* 관심종목 제거 이벤트 */
	$('.remove-interest a').on('click', function (e){
		var $tr = $(this).closest("tr");
		window.tre = $tr;
 		$.ajax({
			type : "POST",
			url : "remove",
			dataType : "json",
	        traditional : true,
			contentType: "application/json; charset=utf-8",
			data : JSON.stringify({
				"userSeq" : "${sessionScope.user.userSeq}",
				"companyNumber" : $($tr).find('.company-number a').text(),
				"companyName" : $($tr).find('.company-name a').text() /*,
				"fieldName" : "" */
			}),
			success : function(result) {
				console.log('result : ' + result);
				if(result == true) {
					Snackbar.show({
						text: '관심목록에서 제거했습니다.',
						actionText: 'OK',
						actionTextColor: '#f66496',
						pos: 'top-center'
					}); 
					$($tr).remove();
					INTEREST.interestNumberArray.splice($($tr).find('.hidden-index').text(), 1);
				}
				else {
					Snackbar.show({
						text: '관심목록에서 제거에 실패했습니다.',
						actionText: 'OK',
						actionTextColor: '#f66496',
						pos: 'top-center'
					}); 
				}
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	});
    
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
    				setTimeout(interestUpdate(), 2000);
    			},
    			error : function(request, status, error) {
    				console.log("code:" + request.status + "\n" + "message:"
    						+ request.responseText + "\n" + "error:" + error);
    			}
    		});
    	}
    }
  
    function setInterestData(interestData) {
    	if(interestData.length != $(".forums-table tbody tr").length) return;
    	$(".forums-table tbody tr").each(function(index, item){
    		$(item).find(".company-number a").text(interestData[index].stockCode);
    		$(item).find(".company-name a").text(interestData[index].stockName);
    		$(item).find(".company-name time").text(interestData[index].fieldName);
    		$(item).find(".stock-price a").text(interestData[index].stockPrice.toLocaleString());
    		$(item).find(".trading-amount a").text(interestData[index].stockVolume.toLocaleString());
    		$(item).find(".day-before a").text(interestData[index].stockChange);
    		$(item).find(".day-before-rate a").text(interestData[index].stockDiff);
			
    		if(interestData[index].stockDiff > 0) {
				$(item).find(".stock-price a").removeClass('minus').addClass('plus');
				$(item).find(".day-before a").removeClass('minus').addClass('plus');
				$(item).find(".day-before-rate a").removeClass('minus').addClass('plus');
			}
			else {
				$(item).find(".stock-price a").removeClass('plus').addClass('minus');
				$(item).find(".day-before a").removeClass('plus').addClass('minus');
				$(item).find(".day-before-rate a").removeClass('plus').addClass('minus');
			}
    	});
    }
    
    /* 관심종목 관련 뉴스 가져오기 */
    function getNews() {
		$.ajax({
			type : "GET",
			url : "news",
			dataType : "json",
	        traditional : true,
			contentType: "application/json; charset=utf-8",
			data : { 
				"interestCompanyNumberArray" : INTEREST.interestNumberArray
			},
			success : function(newsList) {
				console.log("getNews .. ");
				console.log(newsList);
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
    }
  </script>

</body>
</html>