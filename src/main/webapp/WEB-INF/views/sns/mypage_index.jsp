<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>MyPage</title>
  <jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>


<!-- header start -->
<jsp:include page="../includes/header.jsp"/>
  <%-- <jsp:param value="Yegyeom Yu" name="loginId"/>
</jsp:include> --%>
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

  <!-- start bottom js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- end bottom js -->

    
<script type="text/javascript">

/**
 * mypage 페이지 이동없이 전환 각 function
 */
function information(){

	$.ajax({
	
		url : '/sos/user/information',
		type : 'post',
		data : {
			"userId" : "tester01"
		},
		success: function(data){
			
			console.log(data.user);
		},
	    error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	$('#new_tag').remove();
	var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_information");
    $("#rowChange").append(review);
}

function follow(){
	
	$.ajax({
		
		url : '/sos/follow/followList',
		type : 'get',
		data : {
			"userSeq" : 2
		},
		success: function(data){
			
			console.log(data.followList);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	$('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_follow");
    $("#rowChange").append(review);
}

function follower(){
	
	$.ajax({
		
		url : '/sos/follow/followerList',
		type : 'get',
		data : {
			"userSeq" : 2
		},
		success: function(data){
			
			console.log(data.followerList);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	$('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_follow2");
    $("#rowChange").append(review);
}

function point(){
	
	$.ajax({
		
		url : '/sos/point/list',
		type : 'get',
		data : {
			"userSeq" : 2
		},
		success: function(data){
			
			console.log(data.pointList);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	$('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_point");
    $("#rowChange").append(review);
}

function setting_sns(){
	
	$.ajax({
		
		url : '/sos/setting/read',
		type : 'get',
		data : {
			"userSeq" : 2
		},
		success: function(data){
			
			console.log(data.snsSetting);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	$('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_sns");
    $("#rowChange").append(review);
}

function setting_stock(){
	
    $('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_stock");
    $("#rowChange").append(review);
}

</script>

</body>
</html>
