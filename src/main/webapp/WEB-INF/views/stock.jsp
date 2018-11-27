<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>SOS - 모의투자</title>
  <jsp:include page="includes/head.jsp"></jsp:include> 
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
<jsp:include page="includes/header.jsp">
  <jsp:param value="Yegyeom Yu" name="loginId"/>
</jsp:include>
<!-- ... end Header -->
<div class="header-spacer header-spacer-small"></div>


<!-- Main Header Weather -->
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
    <svg class="olymp-weather-refresh-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-weather-refresh-icon"></use></svg>
  </div>
  <div class="container">
    <div class="row">
      <div class="m-auto col-lg-4 col-md-8 col-sm-12">
        <div class="wethear-content">
          <div class="wethear-now">
            <svg class="olymp-weather-partly-sunny-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-partly-sunny-icon"></use></svg>

            <div class="temperature-sensor">64°F</div>
            <div class="max-min-temperature">
              <span>Low: 58°</span>
              <span>High: 76°</span>
            </div>
          </div>


          <div class="climate">Partly Sunny</div>

          <div class="wethear-now-description">
            <div>
              <svg class="olymp-weather-thermometer-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-thermometer-icon"></use></svg>
              <div>Real Feel</div>
              <span>67°</span>
            </div>

            <div>
              <svg class="olymp-weather-rain-drops-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-rain-drops-icon"></use></svg>
              <div>Chance of Rain</div>
              <span>5%</span>
            </div>

            <div>
              <svg class="olymp-weather-wind-icon-header icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>
              <div>Wind Speed</div>
              <span>20MPH</span>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>

<!-- ... end Main Header Weather -->


<!-- Widget Weather -->

<div class="container">
	<div class="row">
		<div class="col-xl-9 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Widget Preview</h6>
				</div>
				<div class="ui-block-content">
					<form>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<fieldset class="form-group label-floating is-select">
									<label class="control-label">Country and Timezone</label>
									<select class="selectpicker form-control" size="auto">
										<option value="AL">United States (UTC-8)</option>
										<option value="2">Ontario (UTC−6)</option>
										<option value="WY">Alberta (UTC−6)</option>
									</select>
								</fieldset>

								<fieldset class="form-group label-floating is-select">
									<label class="control-label">Extended Forecast Days</label>
									<select class="selectpicker form-control" size="auto">
										<option value="AL">Show Next 7 days</option>
										<option value="2">Show Next 10 days</option>
										<option value="WY">Show Next 14 days</option>
									</select>
								</fieldset>

								<a href="#" class="btn btn-secondary btn-md full-width">Restore all Attributes</a>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<fieldset class="form-group label-floating is-select">
									<label class="control-label">Temperature Unit</label>
									<select class="selectpicker form-control" size="auto">
										<option value="AL">F° (Farenheit)</option>
										<option value="2">C° (Celsius)</option>
									</select>
								</fieldset>

								<div class="switcher-block">
									<div class="h6 title">Show Extended Forecast on Widget</div>
									<div class="togglebutton blue">
										<label>
											<input type="checkbox" checked="">
										</label>
									</div>
								</div>

								<a href="#" class="btn btn-blue btn-md full-width">Save all Changes</a>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Extended Forecast</h6>
				</div>

				<div class="swiper-container pagination-bottom" data-slide="fade">
					<div class="swiper-wrapper">
						<div class="swiper-slide swiper-slide-weather" data-swiper-parallax="-500">
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Tomorrow</div>

								<svg class="olymp-weather-sunny-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">60°</div>
									<div class="max-min-temperature">
										<span>55°</span>
										<span class="high">69°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Monday 28</div>
								<svg class="olymp-weather-wind-icon-header icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">58°</div>
									<div class="max-min-temperature">
										<span>52°</span>
										<span class="high">64°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Tuesday 29</div>

								<svg class="olymp-weather-cloudy-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">67°</div>
									<div class="max-min-temperature">
										<span>62°</span>
										<span class="high">77°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Wednesday 30</div>
								<svg class="olymp-weather-rain-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>
								<div class="wethear-now">
									<div class="temperature-sensor">70°</div>
									<div class="max-min-temperature">
										<span>65°</span>
										<span class="high">82°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Thursday 31</div>
							<svg class="olymp-weather-storm-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">73°</div>
									<div class="max-min-temperature">
										<span>68°</span>
										<span class="high">79°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Friday 1</div>
								<svg class="olymp-weather-snow-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">68°</div>
									<div class="max-min-temperature">
										<span>56°</span>
										<span class="high">69°</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide swiper-slide-weather" data-swiper-parallax="-500">
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Tomorrow</div>

								<svg class="olymp-weather-sunny-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">60°</div>
									<div class="max-min-temperature">
										<span>55°</span>
										<span class="high">69°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Monday 28</div>
								<svg class="olymp-weather-wind-icon-header icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">58°</div>
									<div class="max-min-temperature">
										<span>52°</span>
										<span class="high">64°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Tuesday 29</div>

								<svg class="olymp-weather-cloudy-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">67°</div>
									<div class="max-min-temperature">
										<span>62°</span>
										<span class="high">77°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Wednesday 30</div>
								<svg class="olymp-weather-rain-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>
								<div class="wethear-now">
									<div class="temperature-sensor">70°</div>
									<div class="max-min-temperature">
										<span>65°</span>
										<span class="high">82°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Thursday 31</div>
								<svg class="olymp-weather-storm-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">73°</div>
									<div class="max-min-temperature">
										<span>68°</span>
										<span class="high">79°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Friday 1</div>
								<svg class="olymp-weather-snow-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">68°</div>
									<div class="max-min-temperature">
										<span>56°</span>
										<span class="high">69°</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide swiper-slide-weather" data-swiper-parallax="-500">
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Tomorrow</div>

								<svg class="olymp-weather-sunny-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">60°</div>
									<div class="max-min-temperature">
										<span>55°</span>
										<span class="high">69°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Monday 28</div>
								<svg class="olymp-weather-wind-icon-header icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">58°</div>
									<div class="max-min-temperature">
										<span>52°</span>
										<span class="high">64°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Tuesday 29</div>

								<svg class="olymp-weather-cloudy-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">67°</div>
									<div class="max-min-temperature">
										<span>62°</span>
										<span class="high">77°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Wednesday 30</div>
								<svg class="olymp-weather-rain-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>
								<div class="wethear-now">
									<div class="temperature-sensor">70°</div>
									<div class="max-min-temperature">
										<span>65°</span>
										<span class="high">82°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Thursday 31</div>
								<svg class="olymp-weather-storm-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">73°</div>
									<div class="max-min-temperature">
										<span>68°</span>
										<span class="high">79°</span>
									</div>
								</div>
							</div>
							<div class="day-wethear-item" data-mh="wethear-item">
								<div class="title">Friday 1</div>
								<svg class="olymp-weather-snow-icon icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

								<div class="wethear-now">
									<div class="temperature-sensor">68°</div>
									<div class="max-min-temperature">
										<span>56°</span>
										<span class="high">69°</span>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- If we need pagination -->
					<div class="swiper-pagination pagination-blue"></div>
				</div>

			</div>

		</div>

    <!-- Left Sidebar -->
    <aside class="col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-12 col-xs-12">
      <%-- 내 정보 위젯 --%> 
      <jsp:include page="widgets/profile-info.jsp"></jsp:include>
      <%-- 내 주식정보 위젯 --%> 
      <jsp:include page="widgets/twitter-feed.jsp"></jsp:include> 
      <%-- 모의 투자 랭킹 위젯 --%> 
      <jsp:include page="widgets/ranking.jsp"></jsp:include>
    </aside>
    <!-- ... end Left Sidebar -->
	</div>
</div>

<!-- ... end Widget Weather -->


<!-- Window-popup-CHAT for responsive min-width: 768px -->
<jsp:include page="popup/popup-chat.jsp"></jsp:include> 
<!-- ... end Window-popup-CHAT for responsive min-width: 768px -->

<!-- Include js -->
<jsp:include page="includes/bottom.jsp"></jsp:include> 
<!-- End Include js -->

</body>
</html>