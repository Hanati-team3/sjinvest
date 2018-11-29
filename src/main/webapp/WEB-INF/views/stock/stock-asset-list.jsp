<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 보유자산</title>
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
    <div class="row stock-asset-main">
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
                <a href="#" class="more"><svg
                    class="olymp-three-dots-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
              </div>
              
              <div class="ui-block-content">
                <div class="chart-with-statistic">
                  <ul class="statistics-list-count">
                    <li>
                      <div class="points">
                        <span>
                          <span class="statistics-point bg-purple"></span>
                          주식 73.56%
                        </span>
                      </div>
                      <div class="count-stat">7,470,000</div>
                    </li>
                    <li>
                      <div class="points">
                        <span>
                          <span class="statistics-point bg-breez"></span>
                          현금 26.44%
                        </span>
                      </div>
                      <div class="count-stat">2,684,659</div>
                    </li>
                  </ul>
    
                  <div class="chart-js chart-js-pie-color">
                    <canvas id="pie-color-chart" width="180" height="180"></canvas>
                    <div class="general-statistics">
                      10,154,659
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
                <a href="#" class="more"><svg class="olymp-three-dots-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
              </div>
              <div class="ui-block-content">
                <div class="swiper-container" data-slide="fade">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="circle-progress circle-pie-chart">
                          <div class="pie-chart" data-value="0.038"
                            data-startcolor="#38a9ff" data-endcolor="#317cb6">
                            <div class="content">
                              <span>%</span>
                            </div>
                          </div>
                        </div>
            
                        <div class="chart-text">
                          <h6>하나금융지주</h6>
                          <p>3.8% of friends that visit your profile comment on
                            your posts.</p>
                        </div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">358</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">Olympus</span> Posts Rank
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">The
                          Olympus Rank measures the quantity of comments,
                          likes and posts.</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">711</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">Olympus</span> Posts Rank
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">The
                          Olympus Rank measures the quantity of comments,
                          likes and posts.</div>
                      </div>
                    </div>
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
                    <td class="holding-amount">
                      <a href="#" class="h6 count">100</a>
                    </td>
                    <td class="holding-total-money">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title">3,875,000</a>
                      </div>
                    </td>
                    <td class="profit-rate">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title">+ 1.90 %</a>
                      </div>
                    </td>
                    <td class="holding-sell">
                      <a href="#" class="btn btn-blue btn-sm">판매<div class="ripple-container"></div></a>
                    </td>
                  </tr>
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

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->

</body>
</html>