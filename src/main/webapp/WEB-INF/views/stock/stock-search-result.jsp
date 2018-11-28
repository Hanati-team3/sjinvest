<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 검색 결과</title>
<jsp:include page="../includes/head.jsp"></jsp:include>
</head>

<body>

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
    <%-- 사이드 포함 row 시작 --%>
    <div class="row stock-search-main">
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
                    <th class="company-number">종목번호</th>
                    <th class="company-name">기업명</th>
                    <th class="stock-price">현재주가</th>
                    <th class="trading-amount">거래량</th>
                    <th class="day-before">전일대비</th>
                    <th class="day-before-rate">등락률</th>
                    <th class="add-to-interest">관심목록추가</th>
                  </tr>
                </thead>
    
                <tbody>
                  <tr>
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
                    <td class="trading-amount">
                      <a href="#" class="h6 count">1,024,522</a>
                    </td>
                    <td class="day-before">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title">+ 800</a>
                      </div>
                    </td>
                    <td class="day-before-rate">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title">+ 1.90 %</a>
                      </div>
                    </td>
                    <td class="add-to-interest">
                        <a href="#" class="more"><i class="fas fa-heart"></i></a>
                    </td>
                  </tr>
                  
                  <tr>
                    <td class="company-number">
                      <div class="forum-item">
                        <a href="#" class="h6 count">039130</a>
                      </div>
                    </td>
                    <td class="company-name">
                      <div class="author-freshness">
                        <a href="#" class="h6 title">하나투어</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">은행</time>
                      </div>
                    </td>
                    <td class="stock-price"><a href="#" class="h6 count">69,800</a>
                    </td>
                    <td class="trading-amount">
                      <a href="#" class="h6 count">166,143</a>
                    </td>
                    <td class="day-before">
                      <div class="author-freshness minus">
                        <a href="#" class="h6 title">- 1000</a>
                      </div>
                    </td>
                    <td class="day-before-rate">
                      <div class="author-freshness  minus">
                        <a href="#" class="h6 title">- 1.41 %</a>
                      </div>
                    </td>
                    <td class="add-to-interest">
                        <a href="#" class="more"><i class="far fa-heart"></i></a>
                    </td>
                  </tr>
    
<%--                   <tr>
                    <td class="forum">
                      <div class="forum-item">
                        <img src="<%=application.getContextPath()%>/resources/img/forum2.png" alt="forum">
                        <div class="content">
                          <a href="#" class="h6 title">Video Shack</a>
                          <p class="text">All related to your favourite
                            movies and tv shows!</p>
                        </div>
                      </div>
                    </td>
                    <td class="topics"><a href="#" class="h6 count">14</a>
                    </td>
                    <td class="posts"><a href="#" class="h6 count">68</a>
                    </td>
                    <td class="freshness">
                      <div class="author-freshness">
                        <div class="author-thumb">
                          <img src="<%=application.getContextPath()%>/resources/img/avatar51-sm.jpg" alt="author">
                        </div>
                        <a href="#" class="h6 title">Nicholas Grissom</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">2 hours, 7
                          minutes ago</time>
                      </div>
                    </td>
                  </tr>
    
                  <tr>
                    <td class="forum">
                      <div class="forum-item">
                        <img src="<%=application.getContextPath()%>/resources/img/forum3.png" alt="forum">
                        <div class="content">
                          <a href="#" class="h6 title">The Robot’s
                            Dungeon</a>
                          <p class="text">Comics, Anime and all your
                            geeky needs!</p>
                          <ul class="sub-forums">
                            <li><a href="#" class="h6">Comics</a></li>
                            <li><a href="#" class="h6">Anime &
                                Manga</a></li>
                          </ul>
                        </div>
                      </div>
                    </td>
                    <td class="topics"><a href="#" class="h6 count">58</a>
                    </td>
                    <td class="posts"><a href="#" class="h6 count">107</a>
                    </td>
                    <td class="freshness">
                      <div class="author-freshness">
                        <div class="author-thumb">
                          <img src="<%=application.getContextPath()%>/resources/img/avatar48-sm.jpg" alt="author">
                        </div>
                        <a href="#" class="h6 title">Marina Valentine</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">42 minutes ago</time>
                      </div>
                    </td>
                  </tr>
    
                  <tr>
                    <td class="forum">
                      <div class="forum-item">
                        <img src="<%=application.getContextPath()%>/resources/img/forum4.png" alt="forum">
                        <div class="content">
                          <a href="#" class="h6 title">Arcade Planet</a>
                          <p class="text">The latest about all gaming
                            news and events!</p>
                        </div>
                      </div>
                    </td>
                    <td class="topics"><a href="#" class="h6 count">32</a>
                    </td>
                    <td class="posts"><a href="#" class="h6 count">49</a>
                    </td>
                    <td class="freshness">
                      <div class="author-freshness">
                        <div class="author-thumb">
                          <img src="<%=application.getContextPath()%>/resources/img/avatar39-sm.jpg" alt="author">
                        </div>
                        <a href="#" class="h6 title">Chris Greyson</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">1 hour, 20
                          minutes ago</time>
                      </div>
                    </td>
                  </tr>
    
                  <tr>
                    <td class="forum">
                      <div class="forum-item">
                        <img src="<%=application.getContextPath()%>/resources/img/forum5.png" alt="forum">
                        <div class="content">
                          <a href="#" class="h6 title">The Boombox</a>
                          <p class="text">Talk about the best music in
                            the world!</p>
                        </div>
                      </div>
                    </td>
                    <td class="topics"><a href="#" class="h6 count">60</a>
                    </td>
                    <td class="posts"><a href="#" class="h6 count">129</a>
                    </td>
                    <td class="freshness">
                      <div class="author-freshness">
                        <div class="author-thumb">
                          <img src="<%=application.getContextPath()%>/resources/img/avatar52-sm.jpg" alt="author">
                        </div>
                        <a href="#" class="h6 title">Green Goo Rock</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">5 minutes ago</time>
                      </div>
                    </td>
                  </tr>
    
                  <tr>
                    <td class="forum">
                      <div class="forum-item">
                        <img src="<%=application.getContextPath()%>/resources/img/forum6.png" alt="forum">
                        <div class="content">
                          <a href="#" class="h6 title">Around the World</a>
                          <p class="text">Start topics in your native
                            language and have fun!</p>
                        </div>
                      </div>
                    </td>
                    <td class="topics"><a href="#" class="h6 count">12</a>
                    </td>
                    <td class="posts"><a href="#" class="h6 count">18</a>
                    </td>
                    <td class="freshness">
                      <div class="author-freshness">
                        <div class="author-thumb">
                          <img src="<%=application.getContextPath()%>/resources/img/avatar40-sm.jpg" alt="author">
                        </div>
                        <a href="#" class="h6 title">Mathilda Brinker</a>
                        <time class="entry-date updated"
                          datetime="2017-06-24T18:18">4 months, 12
                          hours ago</time>
                      </div>
                    </td>
                  </tr> --%>
    
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