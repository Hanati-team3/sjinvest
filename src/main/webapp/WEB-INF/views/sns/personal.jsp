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
			<svg class="olymp-chat---messages-icon"><use xlink:href="icons/icons.svg#olymp-chat---messages-icon"></use></svg>
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


        <%-- feed list start --%>
        <jsp:include page="feedList.jsp"></jsp:include>
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
        <jsp:include page="../widgets/personal-follow.jsp"></jsp:include>
        
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



<script type="text/javascript">

$(document).ready(function(){
	
	getFollowList();
	getFollowerList();
	
});


/** 
 * 내가 following한 친구목록
 */
function getFollowList(){
	
	//console.log("유저seq: ${user.userSeq}");
	$.ajax({
		
		url : '/sos/follow/followList',
		type : 'get',
		data : {
			
			// header에 있는 유저가 아닌 프로필에 있는 유저아이디 가져와야
			"userSeq" : "${onlyOne.userSeq}"
		},
		success: function(data){
			if(data.fail != null){
				$('#follow_list').html('유저가 없습니다.')
			}else{
				//console.log(data.followList);
				for(var i=0; i<data.followList.length; i++){
					if(i == 0){
						$('#follow_list').html('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followList[i].userId +'</a></div></li>');
					}else{
						$('#follow_list').append('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followList[i].userId +'</a></div></li>');
					}
				}
			}
			//appendFollowEvent();
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}


/** 
 * 나를 follower한 친구목록
 */
function getFollowerList(){
	
	//console.log("유저seq: ${user.userSeq}");
	$.ajax({
		
		url : '/sos/follow/followerList',
		type : 'get',
		data : {
			
			// header에 있는 유저가 아닌 프로필에 있는 유저아이디 가져와야
			"userSeq" : "${onlyOne.userSeq}"
		},
		success: function(data){
			if(data.fail != null){
				$('#follower_list').html('유저가 없습니다.')
			}else{
				//console.log(data.followerList);
				for(var i=0; i<data.followerList.length; i++){
					if (i == 0){
    					$('#follower_list').html('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followerList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followerList[i].userId +'</a></div></li>');
					}else{
						$('#follower_list').append('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followerList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followerList[i].userId +'</a></div></li>');
					}
				}
			}
			//appendFollowerEvent();
			
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}

</script>



</body>
</html>