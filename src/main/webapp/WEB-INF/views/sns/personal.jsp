<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>Personal Page</title>
<jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>

<div class="fixed-sidebar right fixed-sidebar-responsive">

	<div class="fixed-sidebar-right sidebar--small" id="sidebar-right-responsive">

		<a href="#" class="olympus-chat inline-items js-chat-open">
			<svg class="olymp-chat---messages-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-chat---messages-icon"></use></svg>
		</a>

	</div>

</div>

<!-- ... end Fixed Sidebar Right -->


  <!-- header start -->
  <jsp:include page="../includes/header.jsp" />
  <!-- header end -->

  <!-- mypage_profile start -->
  <jsp:include page="../widgets/profile-info_personal.jsp"></jsp:include>
  <!-- mypage_profile end -->


<div class="container">
	<div class="row">

		<!-- Main Content -->

		<div class="col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12">

		<%-- 글 작성 start --%>
	    <jsp:include page="wallWrite.jsp"></jsp:include>      
	    <%-- 글 작성 end --%> 

        <%-- feed list start --%>
        <jsp:include page="wallList.jsp"></jsp:include>
        <%-- ... feed list end --%> 


		</div>

		<!-- ... end Main Content -->


		<!-- Left Sidebar -->
		<div class="col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-12 col-xs-12">

        <%-- 내 주식정보 위젯 --%>
        <jsp:include page="../widgets/twitter-feed.jsp"></jsp:include>


		</div>
		<!-- ... end Left Sidebar -->


		<!-- Right Sidebar -->

		<div class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">

        <%-- 팔로잉, 팔로워 --%>
        <jsp:include page="../widgets/follow.jsp"></jsp:include>
        
		</div>

		<!-- ... end Right Sidebar -->



	</div>
</div>



  <!-- Window-popup Update Header Photo -->
  <jsp:include page="../popup/upload-photo.jsp"></jsp:include>
  <!-- ... end Window-popup Update Header Photo -->

  <!-- Window-popup Choose from my Photo -->
  <jsp:include page="../popup/choose-from-my-photo.jsp"></jsp:include>
  <!-- ... end Window-popup Choose from my Photo -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->
  
  <!-- user modal start-->
  <jsp:include page="../popup/user_profile.jsp"></jsp:include>
  <!-- ... end user modal -->
  
  <!-- user data start-->
  <jsp:include page="../popup/user_data.jsp"></jsp:include>
  <!-- ... end user data -->
	<script>
$(document).ready( function(){
	/* console.log("${onlyOne}") */
	var userPicture = "${onlyOne.userPicture}";
	/* console.log(userPicture); */
	if(userPicture.split(':')[0]=='http' || userPicture.split(':')[0] == 'https'){
		console.log("api");
		$('#userPicture').attr('src', userPicture);
	}
	
	$("#writeForm").on("submit", function(event) {
		event.preventDefault();
		var wallContent = $('#wallContentT')
		/* console.log("내용!!! "+comment); */
		$.ajax({
		    url : '/sos/wall/write',
		    type : 'post',
		    data : {
		    	userSeq : "${onlyOne.userSeq}",
		    	wallContent : wallContent.val()
		    },
		    dataType:'json',
		    success : function(data) {
		    	console.log(data)
		    	$('#feedContentT').val("");
		    	showFeedList(data)
		    },
		    error : function() {
		      alert("관리자에게 문의해주세요.");
		    }
	  });
	});
	
});
</script>

</body>
</html>