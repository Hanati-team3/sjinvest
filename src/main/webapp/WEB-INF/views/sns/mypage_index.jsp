<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>MyPage</title>
  <jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>


<!-- header start -->
<jsp:include page="../includes/header.jsp">
  <jsp:param value="Yegyeom Yu" name="loginId"/>
</jsp:include>
<!-- header end -->


<!-- mypage_profile start -->
<jsp:include page="../includes/mypage_profile.jsp"></jsp:include>
<!-- mypage_profile end -->



<!-- Your Account Personal Information -->

<div class="container">
  <div class="row" id="rowChange">
  
 
  <!-- 
  
  
        mypage에서 페이지 이동없이 추가되는 영역 
  
  
  
  -->



    <!-- mypage leftside start -->
    <jsp:include page="../includes/mypage_leftside.jsp"></jsp:include>
    <!-- mypage leftside end -->
    
    
  </div>
</div>


    <!-- javascript 추가항목 start -->
    <jsp:include page="../includes/bottom.jsp"></jsp:include>
    <!-- javascript 추가항목 start --> 


    
<script type="text/javascript">

/**
 * mypage 페이지 이동없이 전환 by jQuery
 */

$(document).ready(function(){
	
  $('#follow').on('click', function(e) {
    e.stopPropagation();
    e.currentTarget.onclick = function() {
      $('#new_tag').remove();
      var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_follow");
      $("#rowChange").append(review);
    };
  })

  $('#follower').on('click', function(e) {
    e.stopPropagation();
    e.currentTarget.onclick = function() {
      $('#new_tag').remove();
      var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_follow2");
      $("#rowChange").append(review);
    };
  })
  
  $('#point').on('click', function(e) {
    e.stopPropagation();
    e.currentTarget.onclick = function() {
      $('#new_tag').remove();
      var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_point");
      $("#rowChange").append(review);
    };
  })
  
  $('#setting_sns').on('click', function(e) {
    e.stopPropagation();
    e.currentTarget.onclick = function() {
      $('#new_tag').remove();
      var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_sns");
      $("#rowChange").append(review);
    };
  })
  
  $('#setting_stock').on('click', function(e) {
    e.stopPropagation();
    e.currentTarget.onclick = function() {
      $('#new_tag').remove();
      var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_stock");
      $("#rowChange").append(review);
    };
  })

  $('#information').on('click', function(e) {
    e.stopPropagation();
    e.currentTarget.onclick = function() {
      /* console.log('fff'); */
      $('#new_tag').remove();
      var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_information");
      $("#rowChange").append(review);
    };
  })
});


</script>

</body>
</html>
