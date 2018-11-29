<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 관심종목</title>
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
    <div class="row stock-interests-main">
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
                    <use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
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
        </div>
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
                        <a href="#" class="more"><i class="fas fa-heart"></i></a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <%-- 관심종목 목록 카드 끝 --%>
        </div>
        <%-- 관심종목 목록 row 끝 --%>
        
        <%-- 각 기업 그래프 row 시작 --%>
        <div class="row">
          <%-- 각 기업 그래프 카드 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12 stock-my-interests">
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
          <%-- 각 기업 그래프 카드 끝 --%>
        </div>
        <%-- 각 기업 그래프 row 끝 --%>
        
        <%-- 그래프 row 시작 --%>
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <div><h6 class="title">차트 혼합 비교</h6></div>
                <select class="selectpicker form-control without-border" size="auto">
                  <option value="LY">기본</option>
                  <option value="2">거래량</option>
                  <option value="2">시장지수</option>
                  <option value="2">20일 이동 평균</option>
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
        <%-- 그래프 row 끝 --%>
      
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