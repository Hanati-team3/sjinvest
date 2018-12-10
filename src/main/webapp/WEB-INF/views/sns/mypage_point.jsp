<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- mypage_point start -->


<!--     <div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"> -->
<div class="ui-block">


  <div class="ui-block-title">
    <h6 class="title">포인트</h6>
    <input type="hidden">
    
    
    <!-- 보기방식 button 조건이 없음
    <div class="form-group label-floating is-select" style="text-align: right;">
      <div class="col-md-3 btn-group bootstrap-select form-control">
      
        <button type="button" class="btn dropdown-toggle btn-secondary"
          data-toggle="dropdown" role="button" title="전체"
          aria-expanded="false">
          <span class="filter-option pull-left">전체</span>&nbsp;<span
            class="bs-caret"><span class="caret"></span></span>
        </button>
        
        <div class="dropdown-menu open" role="combobox">
          <ul class="dropdown-menu inner" role="listbox" aria-expanded="false">
            
            <li data-original-index="0" class="selected">
              <a tabindex="0" class=" dropdown-item" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="true">
              <span class="text" id="pointAll">전체</span>
              <span class="glyphicon glyphicon-ok check-mark"></span>
              </a>
            </li>
                
            <li data-original-index="1">
              <a tabindex="0" class=" dropdown-item" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">
              <span class="text" id="pointAdd">적립</span>
              <span class="glyphicon glyphicon-ok check-mark"></span>
              </a>
            </li>
                
            <li data-original-index="2">
              <a tabindex="0" class=" dropdown-item" style="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">
              <span class="text" id="pointUse">사용</span>
              <span class="glyphicon glyphicon-ok check-mark"></span>
              </a>
            </li>
          </ul>
        </div>
        
      </div>
    </div>
    -->
    
  </div>
  
  <ul class="notification-list" id="point_list">

  <%-- <c:forEach var="i" begin="1" end="10" step="1"> --%>
    <li>
      <div class="h6 notification-friend container" style="display: flex;">
        <div class="col-md-3" id="point_date">날짜</div>
        <div class="col-md-6" id="point_content">내용</div>
        <div class="col-md-3" id="point_amount">사용내역</div>
      </div>
    </li>
  <%-- </c:forEach> --%>

  </ul>



</div>

<!-- 페이징처리 화면
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled"><a class="page-link" href="#"
      tabindex="-1">이전</a></li>
    <li class="page-item"><a class="page-link" href="#">1
        <div class="ripple-container">
          <div class="ripple ripple-on ripple-out"
            style="left: -10.3833px; top: -16.8333px; background-color: rgb(255, 255, 255); transform: scale(16.7857);"></div>
        </div>
    </a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#">다음</a></li>
  </ul>
</nav>
 -->

<!--     </div> -->

<!-- mypage_point end -->




<!-- Js effects for material design. + Tooltips -->
<script
  src="<%=application.getContextPath()%>/resources/js/material.min.js"></script>

<!-- Helper scripts (Tabs, Equal height, Scrollbar, etc) -->
<script
  src="<%=application.getContextPath()%>/resources/js/theme-plugins.js"></script>

<!-- Init functions -->
<script src="<%=application.getContextPath()%>/resources/js/main.js"></script>

<!-- Load more news AJAX script -->
<script
  src="<%=application.getContextPath()%>/resources/js/ajax-pagination.js"></script>

<!-- Select / Sorting script -->
<script
  src="<%=application.getContextPath()%>/resources/js/selectize.min.js"></script>

<!-- Datepicker input field script-->
<script
  src="<%=application.getContextPath()%>/resources/js/moment.min.js"></script>
<script
  src="<%=application.getContextPath()%>/resources/js/daterangepicker.min.js"></script>

<!-- Widget with events script-->
<script
  src="<%=application.getContextPath()%>/resources/js/simplecalendar.js"></script>

<!-- Lightbox plugin script-->
<script
  src="<%=application.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>

<!-- Swiper / Sliders -->
<script
  src="<%=application.getContextPath()%>/resources/js/swiper.jquery.min.js"></script>
