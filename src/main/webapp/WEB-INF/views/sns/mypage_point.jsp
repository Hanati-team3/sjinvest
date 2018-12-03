<%@ page contentType="text/html; charset=utf-8"%>

<!-- mypage_point start -->


<!--     <div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"> -->
      <div class="ui-block">
        <div class="ui-block-title">
         	
	          		<h6 class="title">포인트 내역</h6>
	          		<input type="hidden">
	          	
        </div>
        <div class="ui-block-content">
        <div class="row">
	         	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-4">
	         	</div>
	          	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			         <div class="form-group label-floating is-select">
			            <select class="selectpicker form-control"  size="auto">
			              <option value="pointAll" selected>전체</option>
			              <option value="pointAdd">적립</option>
			              <option value="pointUse">사용</option>
			            </select>
			          </div>
	     		</div>
	     	</div>
        </div>
		
        <ul class="notification-list">
          
          <li>
            <div class="notification-event">
              <a class="h6 notification-friend">2018-11-28</a>
              <a>어디서 포인트 받았을까?</a>
            </div>
          </li>

          <li>
            <div class="notification-event">
              <a class="h6 notification-friend">2018-11-27</a>
              <a>어디서 포인트 받았을까?</a>
            </div>
          </li>         
          
        </ul>





      </div>
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled">
            <a class="page-link" href="#" tabindex="-1">Previous</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1<div class="ripple-container"><div class="ripple ripple-on ripple-out" style="left: -10.3833px; top: -16.8333px; background-color: rgb(255, 255, 255); transform: scale(16.7857);"></div></div></a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">4</a></li>
          <li class="page-item"><a class="page-link" href="#">5</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </nav>
<!--     </div> -->

<!-- mypage_point end -->




<!-- Js effects for material design. + Tooltips -->
<script src="<%=application.getContextPath()%>/resources/js/material.min.js"></script>

<!-- Helper scripts (Tabs, Equal height, Scrollbar, etc) -->
<script src="<%=application.getContextPath()%>/resources/js/theme-plugins.js"></script>

<!-- Init functions -->
<script src="<%=application.getContextPath()%>/resources/js/main.js"></script>

<!-- Load more news AJAX script -->
<script src="<%=application.getContextPath()%>/resources/js/ajax-pagination.js"></script>

<!-- Select / Sorting script -->
<script src="<%=application.getContextPath()%>/resources/js/selectize.min.js"></script>

<!-- Datepicker input field script-->
<script src="<%=application.getContextPath()%>/resources/js/moment.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/daterangepicker.min.js"></script>

<!-- Widget with events script-->
<script src="<%=application.getContextPath()%>/resources/js/simplecalendar.js"></script>

<!-- Lightbox plugin script-->
<script src="<%=application.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>

<!-- Swiper / Sliders -->
<script src="<%=application.getContextPath()%>/resources/js/swiper.jquery.min.js"></script>
