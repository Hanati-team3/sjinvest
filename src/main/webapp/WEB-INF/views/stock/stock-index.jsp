<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자</title>
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
    <div class="row stock-index-main">
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
          <%-- Trend By Business Type 시작 --%>
          <div class="col-xl-5 order-xl-1 col-lg-5 order-lg-1 col-md-5 order-md-1 col-sm-12 col-xs-12 stock-index-trend">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">업종별 거래량</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              <div class="ui-block-content">
                <div class="chart-with-statistic">
                  <ul class="statistics-list-count">
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-purple"></span><span class="fieldName">${fieldStock[0].fieldName}</span></span>
                      </div>
                      <div class="count-stat">${fieldStock[0].fieldAmount}</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-breez"></span><span class="fieldName">${fieldStock[1].fieldName}</span></span>
                      </div>
                      <div class="count-stat">${fieldStock[1].fieldAmount}</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-primary"></span><span class="fieldName">${fieldStock[2].fieldName}</span></span>
                      </div>
                      <div class="count-stat">${fieldStock[2].fieldAmount}</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-yellow"></span><span class="fieldName">${fieldStock[3].fieldName}</span></span>
                      </div>
                      <div class="count-stat">${fieldStock[3].fieldAmount}</div>
                    </li>
                    <li>
                      <div class="points">
                        <span> <span class="statistics-point bg-blue"></span><span class="fieldName">${fieldStock[4].fieldName}</span></span>
                      </div>
                      <div class="count-stat">${fieldStock[4].fieldAmount}</div>
                    </li>
                  </ul>
  
                  <div class="chart-js chart-js-pie-color">
                    <canvas id="pie-color-chart" width="180" height="180"></canvas>
                    <div class="general-statistics"> 19.46 <span>Last Month Posts</span> </div>
                  </div>
                </div>
              </div>
  
            </div>
          </div>
          <%-- Trend By Business Type 끝 --%>
          <%-- My interest 시작 --%>
          <div class="col-xl-7 order-xl-2 col-lg-7 order-lg-2 col-md-7 order-md-2 col-sm-12 col-xs-12 stock-my-interest">
            <div class="ui-block" data-mh="pie-chart">
              <div class="ui-block-title">
                <div class="h6 title">나의 관심 종목</div>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
  
              <div class="ui-block-content">
                <div class="swiper-container" data-slide="fade">
                  <div class="swiper-wrapper">
                  </div>
  
                  <!-- If we need pagination -->
                  <div class="swiper-pagination pagination-blue"></div>
                </div>
              </div>
            </div>
          </div>
          <%-- My interest 끝 --%>
        </div>
        <%-- row 끝 --%>
        
        <%-- 그래프 row 시작 --%>
        <div class="row">
          <div class="col-lg-12 col-sm-12 col-xs-12 stock-kospi-card">
            <div class="ui-block responsive-flex">
            
              <div class="ui-block-title">
                <!-- <div class="h6 title">KOSPI Line Graphic</div> -->
                <div><h6 class="title">KOSPI Line Graphic</h6></div>
                <select class="selectpicker form-control without-border" size="auto">
                  <option value="LY">1일</option>
                  <option value="2">1개월</option>
                  <option value="3">3개월</option>
                  <option value="3">1년</option>
                </select>
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
    
              <div class="ui-block-content">
                <div class="chart-js chart-js-line-chart">
                  <canvas id="kospi-line-chart" width="1400" height="380"></canvas>
                </div>
              </div>
              
              <hr>
              
              <div class="ui-block-content display-flex content-around">
                <div class="text-stat">
                  <div class="count-stat"></div>
                  <div class="title">시가</div>
                  <div class="sub-title">현재주가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat"></div>
                  <div class="title">고가</div>
                  <div class="sub-title">오늘고가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat"></div>
                  <div class="title">저가</div>
                  <div class="sub-title">오늘저가</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat"></div>
                  <div class="title">전일지수</div>
                  <div class="sub-title">전일대비 등락률</div>
                </div>
                <div class="text-stat">
                  <div class="count-stat"></div>
                  <div class="title">거래량</div>
                  <div class="sub-title">(천주)</div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
        <%-- 그래프 row 끝 --%>
        
        <%-- 자세한 정보 row 시작 --%>
        <div class="row stock-index-tab">
          <div class="col-lg-12 col-sm-12 col-xs-12 stock-top-tab">
            <div class="ui-block">
              <div class="news-feed-form">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs stock-index-ul" role="tablist" >
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab"
                    href="#rising-rate" role="tab" aria-expanded="true"> <span>상승률 상위</span>
                  </a></li>
                  <li class="nav-item" ><a class="nav-link  inline-items" data-toggle="tab" 
                    href="#falling-rate" role="tab" aria-expanded="false"><span>하락률 상위</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#foreigner" role="tab" aria-expanded="false"><span>외국인 순매수</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link inline-items" data-toggle="tab" 
                    href="#institution" role="tab" aria-expanded="false"><span>기관 순매수</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link  inline-items" data-toggle="tab" 
                    href="#trading-amount" role="tab" aria-expanded="false"><span>거래량</span>
                  </a></li>
        
                  <li class="nav-item" ><a class="nav-link active inline-items" data-toggle="tab" 
                    href="#total-value" role="tab" aria-expanded="false"><span>시가총액</span>
                  </a></li>
                </ul>
        
                <!-- Tab panes -->
                <div class="tab-content">
                  <%-- rising-rate탭 시작 --%>
                  <div class="tab-pane " id="rising-rate" role="tabpanel" aria-expanded="true">
                    <div class="ui-block" data-mh="pie-chart" style="border-top: none;">
                      <div class="ui-block-title">
                        <div class="h6 title">상승률 상위 5 종목</div>
                        <a href="#" class="more"><i class="far fa-question-circle"></i></a>
                      </div>
            
                      <div class="ui-block-content">
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span>
                            <span class="skills-item-count"><span class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="62" data-from="0"></span><span class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-primary"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="46" data-from="0"></span><span
                              class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-purple"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="79" data-from="0"></span><span
                              class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-blue"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="34" data-from="0"></span><span
                              class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-breez"></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="95" data-from="0"></span><span
                              class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-yellow"></span>
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
                            <span class="skills-item-title"> </span>
                            <span class="skills-item-count"><span class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="62" data-from="0"></span><span class="units"> </span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-primary" ></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"> </span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="46" data-from="0"></span><span
                              class="units"> </span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-purple"
                               ></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"> </span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="79" data-from="0"></span><span
                              class="units"> </span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-blue"
                               ></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="34" data-from="0"></span><span
                              class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-breez"
                              ></span>
                          </div>
                        </div>
            
                        <div class="skills-item">
                          <div class="skills-item-info">
                            <span class="skills-item-title"></span> <span
                              class="skills-item-count"><span
                              class="count-animate" data-speed="1000"
                              data-refresh-interval="50" data-to="95" data-from="0"></span><span
                              class="units"></span></span>
                          </div>
                          <div class="skills-item-meter">
                            <span class="skills-item-meter-active bg-yellow"
                              ></span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- falling-rate 끝 --%>
                  <%-- foreigner 탭 시작 --%>
                  <div class="tab-pane"  id="foreigner" role="tabpanel" aria-expanded="true">
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
                              <h6>..</h6>
                              <p>..</p>
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
                              <h6>..</h6>
                              <p>..</p>
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
                              <h6>..</h6>
                              <p>..</p>
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
                              <h6>..</h6>
                              <p>..</p>
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
                              <h6>..</h6>
                              <p>..</p>
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
                              <h6>..</h6>
                              <p>..</p>
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      <%-- row 끝 --%>
                    </div>
                  </div>
                  <%-- institution 탭 끝 --%>
                  
                  <%-- trading-amount 탭 시작 --%>
                  <div class="tab-pane " id="trading-amount" role="tabpanel" aria-expanded="true">
                    <div class="row">
                      <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="ui-block responsive-flex">
                        
                          <div class="ui-block-title">
                            <div class="h6 title">상위 거래량 그래프</div>
                            <a href="#" class="more"><svg class="olymp-three-dots-icon">
                                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                          </div>
                
                          <div class="ui-block-content">
                            <div class="chart-js chart-js-one-bar">
                              <canvas id="trading-amount-chart" width="1400" height="380"></canvas>
                            </div>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  <%-- trading-amount 탭 끝 --%>
                  
                  <%-- total-value 탭 시작 --%>
                  <div class="tab-pane active" id="total-value" role="tabpanel" aria-expanded="true">
                    <div class="row">
                      <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="ui-block responsive-flex">
                        
                          <div class="ui-block-title">
                            <div class="h6 title">상위 시가총액 그래프</div>
                            <a href="#" class="more"><svg class="olymp-three-dots-icon">
                                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
                          </div>
                
                          <div class="ui-block-content">
                            <div class="chart-js chart-js-one-bar">
                              <canvas id="total-money-chart" width="1400" height="380"></canvas>
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
                <a href="#" class="more"><i class="far fa-question-circle"></i></a>
              </div>
              
              <ul class="notification-list">
                <c:forEach var="item" items="${news}" varStatus="status">
                <li>
                  <div class="author-thumb">
                    <img src="<%=application.getContextPath()%>/resources/img/avatar${status.index+1}-sm.jpg" alt="author">
                  </div>
                  <div class="notification-event">
                    <a href=# class="h6 notification-friend">${item.source}</a>
                    <a href="${item.link}" class="news-title" >${item.title}</a>
                  </div>
                  <span class="notification-icon">
                    <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">${item.date}</time></span>
                  </span>
                </li>
                </c:forEach>
              </ul>
    
            </div>
            <!-- <nav aria-label="Page navigation example">
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
            </nav> -->
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
  <%-- stock-index js --%>
  <script src="<%=application.getContextPath()%>/resources/js/stock-index/stock-index.js"></script>
  
</body>
</html>