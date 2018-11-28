<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자 회사 상세</title>
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

        <%-- row 시작 --%>
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
              </article>
            </div>
          </div>
          <%-- 회사 메인 카드 끝 --%>
          <%-- My Interests 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12 ">
            <div class="ui-block" data-mh="pie-chart">
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
          <%-- My Interests 끝 --%>
        </div>
        <%-- row 끝 --%>
        
        <%-- 그래프 row 시작 --%>
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <!-- <div class="h6 title">KOSPI Line Graphic</div> -->
                <div><h6 class="title">KOSPI Line Graphic</h6></div>
                <select class="selectpicker form-control without-border" size="auto">
                  <option value="LY">LAST YEAR (2016)</option>
                  <option value="2">CURRENT YEAR (2017)</option>
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
        
        <%-- 자세한 정보 row 시작 --%>
        <div class="row stock-index-tab">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block">
              <div class="news-feed-form">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs stock-index-ul" role="tablist">
                  <li class="nav-item" ><a class="nav-link active inline-items" data-toggle="tab"
                    href="#rising-rate" role="tab" aria-expanded="true"> <span>상승률 상위</span>
                  </a></li>
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#falling-rate" role="tab" aria-expanded="false"><span>하락률 상위</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#foreigner" role="tab" aria-expanded="false"><span>외국인 순매수</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#institution" role="tab" aria-expanded="false"><span>기관 순매수</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#trading-amount" role="tab" aria-expanded="false"><span>거래량</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#total-value" role="tab" aria-expanded="false"><span>시가총액</span>
                  </a></li>
                </ul>
        
                <!-- Tab panes -->
                <div class="tab-content">
                  <%-- rising-rate탭 시작 --%>
                  <div class="tab-pane active" id="rising-rate" role="tabpanel" aria-expanded="true">
                    <div class="ui-block" data-mh="pie-chart" style="border-top: none;">
                      <div class="ui-block-title">
                        <div class="h6 title">상승률 상위 5 종목</div>
                        <a href="#" class="more"><i class="far fa-question-circle"></i></a>
                      </div>
            
                      <div class="ui-block-content">
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Orange Gradient Progress</span>
                            <span class="skills-item-count"><span class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="62" data-from="0"></span><span class="units">62%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-primary" style="width: 62%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Violet Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="46" data-from="0"></span><span
                              class="units">46%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-purple"
                              style="width: 46%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Blue Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="79" data-from="0"></span><span
                              class="units">79%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-blue"
                              style="width: 79%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Aqua Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="34" data-from="0"></span><span
                              class="units">34%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-breez"
                              style="width: 34%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Yellow Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="95" data-from="0"></span><span
                              class="units">95%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-yellow"
                              style="width: 95%"></span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- rising-rate탭 끝 --%>
                  <%-- falling-rate탭 시작 --%>
                  <div class="tab-pane" id="falling-rate" role="tabpanel" aria-expanded="true">
                    <div class="ui-block" data-mh="pie-chart" style="border-top: none;">
                      <div class="ui-block-title">
                        <div class="h6 title">하락률 상위 5 종목</div>
                        <a href="#" class="more"><svg class="olymp-three-dots-icon">
                            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                      </div>
            
                      <div class="ui-block-content">
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Orange Gradient Progress</span>
                            <span class="skills-item-count"><span class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="62" data-from="0"></span><span class="units">62%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-primary" style="width: 62%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Violet Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="46" data-from="0"></span><span
                              class="units">46%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-purple"
                              style="width: 46%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Blue Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="79" data-from="0"></span><span
                              class="units">79%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-blue"
                              style="width: 79%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Aqua Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="34" data-from="0"></span><span
                              class="units">34%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-breez"
                              style="width: 34%"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title">Yellow Progress</span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="95" data-from="0"></span><span
                              class="units">95%</span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-yellow"
                              style="width: 95%"></span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- falling-rate 끝 --%>
                  <%-- foreigner 탭 시작 --%>
                  <div class="tab-pane" id="foreigner" role="tabpanel" aria-expanded="true">
                    <div class="ui-block">
                    
                      <div class="ui-block-title">
                        <div class="h6 title">외국인 매수 상위 3 종목</div>
                        <a href="#" class="more"><svg class="olymp-three-dots-icon">
                            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                      </div>
                      
                      <div class="row">
                      
                        <div class="col-xl-4 order-xl-1 col-lg-4 order-lg-1 col-md-4 order-md-1 col-sm-12 col-xs-12">
                          <div class="ui-block-content">
                            <div class="circle-progress circle-pie-chart">
                              <div class="pie-chart" data-value="0.68" data-startcolor="#38a9ff" data-endcolor="#317cb6">
                                <div class="content"> <span>%</span> </div>
                              </div>
                            </div>
                
                            <div class="chart-text">
                              <h6>Friends Comments</h6>
                              <p>68% of friends that visit your profile comment on your posts.</p>
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-xl-4 order-xl-2 col-lg-4 order-lg-2 col-md-4 order-md-2 col-sm-12 col-xs-12">
                          <div class="ui-block-content">
                            <div class="circle-progress circle-pie-chart">
                              <div class="pie-chart" data-value="0.50" data-startcolor="#38a9ff" data-endcolor="#317cb6">
                                <div class="content"> <span>%</span> </div>
                              </div>
                            </div>
                            <div class="chart-text">
                              <h6>Friends Comments</h6>
                              <p>50% of friends that visit your profile comment on your posts.</p>
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-xl-4 order-xl-3 col-lg-4 order-lg-3 col-md-4 order-md-3 col-sm-12 col-xs-12">
                          <div class="ui-block-content">
                            <div class="circle-progress circle-pie-chart">
                              <div class="pie-chart" data-value="0.83" data-startcolor="#38a9ff" data-endcolor="#317cb6">
                                <div class="content"> <span>%</span> </div>
                              </div>
                            </div>
                            <div class="chart-text">
                              <h6>Friends Comments</h6>
                              <p>83% of friends that visit your profile comment on your posts.</p>
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      <%-- row 끝 --%>
                    </div>
                  </div>
                  <%-- foreigner 탭 끝 --%>
                  
                  <%-- institution 탭 시작 --%>
                  <div class="tab-pane" id="institution" role="tabpanel" aria-expanded="true">
                    <div class="ui-block">
                    
                      <div class="ui-block-title">
                        <div class="h6 title">기관 매수 상위 3 종목</div>
                        <a href="#" class="more"><svg class="olymp-three-dots-icon">
                            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                      </div>
                      
                      <div class="row">
                      
                        <div class="col-xl-4 order-xl-1 col-lg-4 order-lg-1 col-md-4 order-md-1 col-sm-12 col-xs-12">
                          <div class="ui-block-content">
                            <div class="circle-progress circle-pie-chart">
                              <div class="pie-chart" data-value="0.68" data-startcolor="#ffc109e0" data-endcolor="#ff8400">
                                <div class="content"> <span>%</span> </div>
                              </div>
                            </div>
                
                            <div class="chart-text">
                              <h6>Friends Comments</h6>
                              <p>68% of friends that visit your profile comment on your posts.</p>
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-xl-4 order-xl-2 col-lg-4 order-lg-2 col-md-4 order-md-2 col-sm-12 col-xs-12">
                          <div class="ui-block-content">
                            <div class="circle-progress circle-pie-chart">
                              <div class="pie-chart" data-value="0.50" data-startcolor="#ffc109e0" data-endcolor="#ff8400">
                                <div class="content"> <span>%</span> </div>
                              </div>
                            </div>
                            <div class="chart-text">
                              <h6>Friends Comments</h6>
                              <p>50% of friends that visit your profile comment on your posts.</p>
                            </div>
                          </div>
                        </div>
                        
                        <div class="col-xl-4 order-xl-3 col-lg-4 order-lg-3 col-md-4 order-md-3 col-sm-12 col-xs-12">
                          <div class="ui-block-content">
                            <div class="circle-progress circle-pie-chart">
                              <div class="pie-chart" data-value="0.83" data-startcolor="#ffc109e0" data-endcolor="#ff8400">
                                <div class="content"> <span>%</span> </div>
                              </div>
                            </div>
                            <div class="chart-text">
                              <h6>Friends Comments</h6>
                              <p>83% of friends that visit your profile comment on your posts.</p>
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      <%-- row 끝 --%>
                    </div>
                  </div>
                  <%-- institution 탭 끝 --%>
                  
                  <%-- trading-amount 탭 시작 --%>
                  <div class="tab-pane" id="trading-amount" role="tabpanel" aria-expanded="true">
                    <div class="row">
                      <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="ui-block responsive-flex">
                        
                          <div class="ui-block-title">
                            <div class="h6 title">상위 거래량 그래프</div>
                            <select class="selectpicker form-control without-border" size="auto">
                              <option value="LY">LAST YEAR (2016)</option>
                              <option value="CUR">CURRENT YEAR (2017)</option>
                            </select> <a href="#" class="more"><svg class="olymp-three-dots-icon">
                                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                          </div>
                
                          <div class="ui-block-content">
                            <div class="chart-js chart-js-one-bar">
                              <canvas id="one-bar-chart" width="1400" height="380"></canvas>
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
                            <div class="h6 title">상위 시가총액 그래프</div>
                            <select class="selectpicker form-control without-border" size="auto">
                              <option value="LY">LAST YEAR (2016)</option>
                              <option value="CUR">CURRENT YEAR (2017)</option>
                            </select> <a href="#" class="more"><svg class="olymp-three-dots-icon">
                                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                          </div>
                
                          <div class="ui-block-content">
                            <div class="chart-js chart-js-one-bar">
                              <canvas id="one-bar-chart" width="1400" height="380"></canvas>
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
                <a href="#" class="more"><svg
                    class="olymp-three-dots-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
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

</body>
</html>