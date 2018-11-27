<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자</title>
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


  <!-- Main Header Weather -->
<%-- 그림
  <div class="main-header main-header-wethear">
    <div class="content-bg-wrap">
      <div class="content-bg bg-weather"></div>
    </div>

    <div class="date-and-place">
      <div class="date">Saturday, March 26th</div>
      <div class="place">San Francisco, CA</div>
    </div>

    <div class="wethear-update">
      Updated: 20/10 6:32pm
      <svg class="olymp-weather-refresh-icon">
        <use
          xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-weather-refresh-icon"></use></svg>
    </div>
    <div class="container">
      <div class="row">
        <div class="m-auto col-lg-4 col-md-8 col-sm-12">
          <div class="wethear-content">
            <div class="wethear-now">
              <svg class="olymp-weather-partly-sunny-icon icon">
                <use
                  xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-partly-sunny-icon"></use></svg>

              <div class="temperature-sensor">64°F</div>
              <div class="max-min-temperature">
                <span>Low: 58°</span> <span>High: 76°</span>
              </div>
            </div>


            <div class="climate">Partly Sunny</div>

            <div class="wethear-now-description">
              <div>
                <svg class="olymp-weather-thermometer-icon icon">
                  <use
                    xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-thermometer-icon"></use></svg>
                <div>Real Feel</div>
                <span>67°</span>
              </div>

              <div>
                <svg class="olymp-weather-rain-drops-icon icon">
                  <use
                    xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-rain-drops-icon"></use></svg>
                <div>Chance of Rain</div>
                <span>5%</span>
              </div>

              <div>
                <svg class="olymp-weather-wind-icon-header icon">
                  <use
                    xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>
                <div>Wind Speed</div>
                <span>20MPH</span>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
--%>
  <!-- ... end Main Header Weather -->


  <!-- Widget Weather -->

  <div class="container">
    <%-- 사이드 포함 row 시작 --%>
    <div class="row">
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
        <%-- row 시작 --%>
        <div class="row">
          <%-- PIE 시작 --%>
          <div class="col-xl-5 order-xl-1 col-lg-5 order-lg-1 col-md-5 order-md-1 col-sm-12 col-xs-12">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">Trend By Business Type</div>
                <a href="#" class="more"><svg class="olymp-three-dots-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
              </div>
              <div class="ui-block-content">
                <div class="chart-with-statistic">
                  <ul class="statistics-list-count">
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-purple"></span>Status Updates</span>
                      </div>
                      <div class="count-stat">8.247</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-breez"></span> Multimedia</span>
                      </div>
                      <div class="count-stat">5.630</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-primary"></span>Shared Posts</span>
                      </div>
                      <div class="count-stat">1.498</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-yellow"></span> Blog Posts</span>
                      </div>
                      <div class="count-stat">1.136</div>
                    </li>
                  </ul>
  
                  <div class="chart-js chart-js-pie-color">
                    <canvas id="pie-color-chart" width="180" height="180"></canvas>
                    <div class="general-statistics"> 16.502 <span>Last Month Posts</span> </div>
                  </div>
                </div>
              </div>
  
            </div>
          </div>
          <%-- PIE 끝 --%>
          <%-- 탭 시작 --%>
          <div class="col-xl-7 order-xl-2 col-lg-7 order-lg-2 col-md-7 order-md-2 col-sm-12 col-xs-12">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">My Interests</div>
                <a href="#" class="more"><svg class="olymp-three-dots-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
              </div>
  
              <div class="ui-block-content">
                <div class="swiper-container" data-slide="fade">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat"
                          data-swiper-parallax="-500">248</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">Olympus</span> Posts Rank
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">The Olympus Rank measures the quantity of comments,
                          likes and posts.</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat" data-swiper-parallax="-500">358</div>
                        <div class="title" data-swiper-parallax="-100">
                          <span class="c-primary">Olympus</span> Posts Rank
                        </div>
                        <div class="sub-title" data-swiper-parallax="-100">The Olympus Rank measures the quantity of comments,
                          likes and posts.</div>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <div class="statistics-slide">
                        <div class="count-stat"
                          data-swiper-parallax="-500">711</div>
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
          <%-- 탭 끝 --%>
        </div>
        <%-- row 끝 --%>
        
        <%-- 그래프 row 시작 --%>
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <div class="h6 title">KOSDAQ Line Graphic</div>
                <select class="selectpicker form-control without-border" size="auto">
                  <option value="LY">LAST YEAR (2016)</option>
                  <option value="2">CURRENT YEAR (2017)</option>
                </select> <a href="#" class="more"><svg class="olymp-three-dots-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
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
        
        <%-- 자세한 정보 탭 시작 --%>
        <div class="ui-block">
          <div class="news-feed-form">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs stock-index-ul" role="tablist">
              <li class="nav-item" ><a class="nav-link active inline-items" data-toggle="tab"
                href="#home-1" role="tab" aria-expanded="true"> <span>상승률 상위</span>
              </a></li>
              <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                href="#profile-1" role="tab" aria-expanded="false"><span>하락률 상위</span>
              </a></li>
    
              <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                href="#blog" role="tab" aria-expanded="false"><span>외국인 순매수</span>
              </a></li>
    
              <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                href="#blog" role="tab" aria-expanded="false"><span>기관 순매수</span>
              </a></li>
    
              <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                href="#blog" role="tab" aria-expanded="false"><span>거래량</span>
              </a></li>
    
              <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                href="#blog" role="tab" aria-expanded="false"><span>시가총액</span>
              </a></li>
            </ul>
    
            <!-- Tab panes -->
            <div class="tab-content">
              <%-- home-1탭 시작 --%>
              <div class="tab-pane active" id="home-1" role="tabpanel" aria-expanded="true">

              </div>
              <%-- home-1탭 끝 --%>
              <%-- profile-1탭 시작 --%>
              <div class="tab-pane" id="profile-1" role="tabpanel"
                aria-expanded="true">
                <form>
                  <div class="form-group with-icon label-floating is-empty">
                    <label class="control-label">Share what you are
                      thinking here...</label>
                    <textarea class="form-control" placeholder=""></textarea>
                    <span class="material-input"></span>
                  </div>
                  <div class="add-options-message">
                    <a href="#" class="options-message"
                      data-toggle="tooltip" data-placement="top"
                      data-original-title="ADD PHOTOS"> <svg
                        class="olymp-camera-icon" data-toggle="modal"
                        data-target="#update-header-photo">
                        <use xlink:href="#olymp-camera-icon"></use></svg>
                    </a> <a href="#" class="options-message"
                      data-toggle="tooltip" data-placement="top"
                      data-original-title="TAG YOUR FRIENDS"> <svg
                        class="olymp-computer-icon">
                        <use xlink:href="#olymp-computer-icon"></use></svg>
                    </a> <a href="#" class="options-message"
                      data-toggle="tooltip" data-placement="top"
                      data-original-title="ADD LOCATION"> <svg
                        class="olymp-small-pin-icon">
                        <use xlink:href="#olymp-small-pin-icon"></use></svg>
                    </a>
    
                    <button class="btn btn-primary btn-md-2">Post
                      Status</button>
                    <button
                      class="btn btn-md-2 btn-border-think btn-transparent c-grey">Preview</button>
    
                  </div>
    
                </form>
              </div>
              <%-- profile-1탭 끝 --%>
              <%-- blog 탭 시작 --%>
              <div class="tab-pane" id="blog" role="tabpanel"
                aria-expanded="true">
                <form>
                  <div class="author-thumb">
                    <img src="<%=application.getContextPath()%>/resources/img/author-page.jpg" alt="author">
                  </div>
                  <div class="form-group with-icon label-floating is-empty">
                    <label class="control-label">Share what you are
                      thinking here...</label>
                    <textarea class="form-control" placeholder=""></textarea>
                    <span class="material-input"></span>
                  </div>
                  <div class="add-options-message">
                    <a href="#" class="options-message"
                      data-toggle="tooltip" data-placement="top"
                      data-original-title="ADD PHOTOS"> <svg
                        class="olymp-camera-icon" data-toggle="modal"
                        data-target="#update-header-photo">
                        <use xlink:href="#olymp-camera-icon"></use></svg>
                    </a> <a href="#" class="options-message"
                      data-toggle="tooltip" data-placement="top"
                      data-original-title="TAG YOUR FRIENDS"> <svg
                        class="olymp-computer-icon">
                        <use xlink:href="#olymp-computer-icon"></use></svg>
                    </a> <a href="#" class="options-message"
                      data-toggle="tooltip" data-placement="top"
                      data-original-title="ADD LOCATION"> <svg
                        class="olymp-small-pin-icon">
                        <use xlink:href="#olymp-small-pin-icon"></use></svg>
                    </a>
    
                    <button class="btn btn-primary btn-md-2">Post
                      Status</button>
                    <button
                      class="btn btn-md-2 btn-border-think btn-transparent c-grey">Preview</button>
    
                  </div>
    
                </form>
              </div>
              <%-- blog 탭 끝 --%>
            </div>
          </div>
        </div>
        <%-- 자세한 정보 탭 끝 --%>
        
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