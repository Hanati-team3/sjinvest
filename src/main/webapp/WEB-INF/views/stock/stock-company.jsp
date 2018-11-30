<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 회사 상세</title>
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

        <%-- 회사 메인 카드 row 시작 --%>
        <div class="row">
          <%-- 회사 메인 카드 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12 company-main-card">
            <div class="ui-block">
              <article class="hentry blog-post single-post single-post-v1">
                <div class="control-block-button post-control-button">
                  <a href="#" class="btn btn-control has-i bg-interest">
                    <i class="fas fa-heart"></i>
                  </a>
                </div>
                <div class="company-name" >하나금융지주</div>
                <div class="company-stock" >38,750</div>
                <div class="row company-main-card-sub">
                  <div class="col-xl-3 order-xl-1 col-lg-6 order-lg-1 col-md-6 col-sm-6 col-xs-6">
                    <div class="ui-block">
                      <div class="ui-block-content">
                        <ul class="statistics-list-count">
                          <li>
                            <div class="points">
                              <span> 오늘 상한가 </span>
                            </div>
                            <div class="count-stat">
                              28.432 <span class="indicator positive"> +
                                4.207</span>
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
                            </div>
                            <div class="count-stat">
                              28.432 <span class="indicator positive"> +
                                4.207</span>
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
                            <div class="count-stat">
                              28.432 <span class="indicator positive"> +
                                4.207</span>
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
                              <span> 종가 </span>
                            </div>
                            <div class="count-stat">
                              28.432 <span class="indicator positive"> +
                                4.207</span>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <%-- 구매 버튼 시작--%>
                <div class="row">
                  <a class="btn btn-primary btn-md-2" data-toggle="modal"
                      data-target="#stock_buy_modal">구매</a>
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
                    <div class="h6">은행</div>
                    <div class="title">업종</div>
                  </a> <a href="#" class="friend-count-item">
                    <div class="h6">코스피 50</div>
                    <div class="title">시장구분</div>
                  </a> <a href="#" class="friend-count-item">
                    <div class="h6">코스피 27위</div>
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
                      <th class="company-name">증감</th>
                      <th class="stock-price">매도잔량</th>
                      <th class="trading-amount" colspan="2">10:01:23</th>
                      <th class="day-before">매수잔량</th>
                      <th class="day-before-rate">증감</th>
                    </tr>
                  </thead>
      
                  <tbody>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small">6</a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count">6,498</a>
                      </td>
                      <td class="trading-amount plus">
                        <a href="#" class="h6 count">39,000</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">+ 0.65</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count">3,555</a>
                      </td>
                      <td class="trading-amount plus">
                        <a href="#" class="h6 count">38,950</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">+ 0.85</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count">6,498</a>
                      </td>
                      <td class="trading-amount plus">
                        <a href="#" class="h6 count">39,000</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">+ 0.65</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count">6,498</a>
                      </td>
                      <td class="trading-amount plus">
                        <a href="#" class="h6 count">38,900</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">+ 0.65</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small">6</a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count">6,498</a>
                      </td>
                      <td class="trading-amount plus">
                        <a href="#" class="h6 count">38,850</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness plus">
                          <a href="#" class="h6 title">+ 0.65</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="trading-amount minus">
                        <a href="#" class="h6 count">38,800</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness minus">
                          <a href="#" class="h6 title">- 0.15</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">3,150</a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">8</a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="trading-amount minus">
                        <a href="#" class="h6 count">38,800</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness minus">
                          <a href="#" class="h6 title">- 0.15</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">3,150</a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="trading-amount minus">
                        <a href="#" class="h6 count">38,800</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness minus">
                          <a href="#" class="h6 title">- 0.15</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">3,150</a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">8</a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="trading-amount minus">
                        <a href="#" class="h6 count">38,800</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness minus">
                          <a href="#" class="h6 title">- 0.15</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">3,150</a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">15</a>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td class="company-name">
                        <div class="author-freshness">
                          <a href="#" class="small"></a>
                        </div>
                      </td>
                      <td class="stock-price">
                        <a href="#" class="h6 count"></a>
                      </td>
                      <td class="trading-amount minus">
                        <a href="#" class="h6 count">38,800</a>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness minus">
                          <a href="#" class="h6 title">- 0.15</a>
                        </div>
                      </td>
                      <td class="day-before">
                        <div class="author-freshness">
                          <a href="#" class="h6 title">3,150</a>
                        </div>
                      </td>
                      <td class="day-before-rate">
                        <div class="author-freshness">
                          <a href="#" class="h6 title"></a>
                        </div>
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
                <div class="h6 title">비재무정보</div>
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
    
                    <div class="monthly-count">
                      9.855 <span class="period">최대 주주 지분율</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count">
                      6.721 <span class="period">직원평균 연봉</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count">
                      2.047 <span class="period">복리후생비</span>
                    </div>
                  </div>
    
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count">
                      1.536 <span class="period">남녀 급여 비율</span>
                    </div>
                  </div>
                  <div class="monthly-indicator">
                    <a href="#" class="btn btn-control bg-blue"> <svg
                        class="olymp-happy-face-icon">
                        <use
                          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </a>
    
                    <div class="monthly-count">
                      1.536 <span class="period">비정규직 비율</span>
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
                <div><h6 class="title">하나금융지주 차트</h6></div>
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