<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>MyPage</title>
<jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>


  <!-- header start -->
  <jsp:include page="../includes/header.jsp" />
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
 * mypage 페이지 이동없이 전환, mypage_leftside
 */
function information(){
	console.log("${user.userId}");
	$.ajax({
	
		url : '/sos/user/information',
		type : 'post',
		data : {
			"userId" : "${user.userId}"
		},
		success: function(data){

			console.log(data.user);
			$('#id').attr("value","${user.userId}");
			$('#nickName').attr("value","${user.userNickname}");
			$('#email').attr("value","${user.userEmail}");
			$('#birth').attr("value","${user.userBirth}");
			$('#money').attr("value","${user.userMoney}");
			$('#detail').replaceWith('<textarea class="form-control" placeholder="" id="detail">${user.userDetail}</textarea>');
			
			
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
	console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/follow/followList',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
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
	console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/follow/followerList',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
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
	console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/point/list',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
		},
		success: function(data){
			
			console.log(data.pointList);
			
			for(var i=0; i<data.pointList.length; i++){
				$('#point_list').append('<li><div class="h6 notification-friend container" style="display: flex;"><div class="col-md-3" id="point_date">'+data.pointList[i].pointDate+'</div><div class="col-md-6" id="point_content">'+data.pointList[i].pointContent+'</div><div class="col-md-3" id="point_amount">'+data.pointList[i].pointAmount+'</div></div></li>');
			}
			
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
	console.log("${user.userSeq}");	
	$.ajax({
		
		url : '/sos/setting/read',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
		},
		success: function(data){
			
			//console.log("aaa"+data.setFeedNotice);
			//console.log("bbb"+data.setTradeNotice);
			//console.log("ccc"+data.setPrivacy);
			//console.log("ddd"+data.setView);

			/*
			 * 유저의 sns setting 기본 설정값 넘어오는 부분 
			 */
			if(data.setFeedNotice == "ON"){
				$('#setFeedNotice').attr("checked", "${setFeedNotice}");
			}else{
				$('#setFeedNotice').replaceWith('<input type="checkbox" name="setFeedNotice" id="setFeedNotice">');
			}
			
			if(data.setTradeNotice == "ON"){
				$('#setTradeNotice').attr("checked", "${setTradeNotice}");
			}else{
				$('#setTradeNotice').replaceWith('<input type="checkbox" name="setTradeNotice" id="setTradeNotice">');
			}
			
			if(data.setPrivacy == "ON"){
				$('#setPrivacy').attr("checked", "${setPrivacy}");
			}else{
				$('#setPrivacy').replaceWith('<input type="checkbox" name="setPrivacy" id="setPrivacy">');
			}
			
			if(data.setView == "ON"){
				$('#setView').attr("checked", "${setView}");
			}else{
				$('#setView').replaceWith('<input type="checkbox" name="setView" id="setView">');
			}
			
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	$('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_sns");
    $("#rowChange").append(review);
}

function setting_sns_submit(){
	
	$.ajax({
		
		url : '/sos/setting/update',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}",
			"setFeedNotice" : setFeedNotice,
			"setTradeNotice" : setTradeNotice,
			"setPrivacy" : setPrivacy,
			"setView" : setView
		},
		success: function(data){
			console.log("설정변환제출 영역..");
		},
		error : function(){
			alert("관리자에게 문의해주세요.");
		}
		
	})
}

function setting_stock(){
	
    $('#new_tag').remove();
    var review = $('<div id="new_tag" class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"><div>').load("<%=application.getContextPath()%>/sns/mypage_stock");
				$("#rowChange").append(review);
}

</script>

</body>
</html>
