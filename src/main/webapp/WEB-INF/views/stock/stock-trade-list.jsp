<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 거래내역</title>
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
        <%-- 검색 끝 --%>

        <%-- 검색 결과 시작 --%>
        <div class="row">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
    
            <div class="ui-block">
              <table class="forums-table">
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
                  <tr>
                    <td class="trade-date">
                      <div class="forum-item">
                        <time class="entry-date updated"
                          datetime="2018-11-29T18:18">2018-11-29</time>
                      </div>
                    </td>
                    <td class="trade-type">
                      <div class="forum-item">
                        <a href="#" class="h6 count">BUY</a>
                      </div>
                    </td>
                    <td class="company-number">
                      <div class="forum-item">
                        <a href="#" class="h6 count">086790</a>
                      </div>
                    </td>
                    <td class="company-name">
                      <div class="author-freshness">
                        <a href="#" class="h6 title">하나금융지주</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">은행</time>
                      </div>
                    </td>
                    <td class="stock-price"><a href="#" class="h6 count">38,750</a>
                    </td>
                    <td class="stock-amount">
                      <a href="#" class="h6 count">10</a>
                    </td>
                    <td class="trade-amount">
                      <a href="#" class="h6 count">387,500</a>
                    </td>
                    <td class="profit-rate">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title"></a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="trade-date">
                      <div class="forum-item">
                        <time class="entry-date updated"
                          datetime="2018-11-29T18:18">2018-11-29</time>
                      </div>
                    </td>
                    <td class="trade-type">
                      <div class="forum-item">
                        <a href="#" class="h6 count">SELL</a>
                      </div>
                    </td>
                    <td class="company-number">
                      <div class="forum-item">
                        <a href="#" class="h6 count">086790</a>
                      </div>
                    </td>
                    <td class="company-name">
                      <div class="author-freshness">
                        <a href="#" class="h6 title">하나금융지주</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">은행</time>
                      </div>
                    </td>
                    <td class="stock-price"><a href="#" class="h6 count">38,750</a>
                    </td>
                    <td class="stock-amount">
                      <a href="#" class="h6 count">10</a>
                    </td>
                    <td class="trade-amount">
                      <a href="#" class="h6 count">387,500</a>
                    </td>
                    <td class="profit-rate">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title">1.58%</a>
                      </div>
                    </td>
                  </tr>
                  
    
                </tbody>
              </table>
            </div>
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