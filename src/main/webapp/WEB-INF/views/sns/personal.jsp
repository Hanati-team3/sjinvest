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
	<script>
$(document).ready( function(){
	
	getwallList();
	getFollowList();
	getFollowerList();
	
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
		    	$('#wallContentT').val("");
		    	showwallList(data)
		    },
		    error : function() {
		      alert("관리자에게 문의해주세요.");
		    }
	  });
	});
	
	/*
	 * userData 모달 안에서 follow버튼
	 */
	$('#heartIcon').on('click', function(){
		var followId = $(this).attr('title');
		$.ajax({
			url : '/sos/follow/handle',
			type : 'get',
			dataType:'json',
			data : {
				"userSeq" : "${user.userSeq}",
				"followUserId" : followId
			},
			success : function(data) {
				modal(data);
				console.log("follow update 필요");
				getFollowList();
			},
			error : function() {
				alert("follow추가 error.");
			}
		})
	});
});


/** 
 * newsfeed의 list 목록
 */
function getwallList(){
	$.ajax({
	    url : '/sos/wall/list/'+"${onlyOne.userSeq}",
	    type : 'get',
	    dataType: 'json',
	    success : function(data) {
	    	if(data){
          		/* console.log(data) */
          		showwallList(data);
	    	}
	    },
	    error : function() {
	      alert("관리자에게 문의해주세요.");
	    }
	  });
}

/* 글 삭제 */
function deleteFeed(obj){
	var wallSeq = $(obj).attr('title');
	$.ajax({
		url : '/sos/wall/delete/'+"${onlyOne.userSeq}",
		type : 'post',
		data : {
			"wallSeq" : wallSeq
		},
		dataType:'json',
		success: function(data){
			showwallList(data); 
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	}) 
}

/* 받아온 게시글 뿌리는 역할 */
function showwallList(data){
	var feedCard = $("#makeFeed");
	$(feedCard).html("");
	console.log(data);
	for (var i = 0; i < data.wallList.length; i++) {
		/* console.log(data.wallList[i]); */
		/* var feed = "<>"; */
		
		var nickname = $('a[name=postUserNickName]');
		$(nickname[i]).text(data.userList[i].userNickname)
		$(nickname[i]).attr('href', 'temp'+i)	/* 변경 필요 */
		var time = $('time[name=postWriteDate]');
		$(time[i]).text(data.wallList[i].wallRegdate);
		var content = $('pre[name=feedContent]');
		
		<% Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		    Matcher m = p.matcher(content);
		    String extractHashTag = null;
		 
		    while(m.find()) {
		    	extractHashTag = sepcialCharacter_replace(m.group());
		 
		    	content = content.replace("#"+extractHashTag, "<span class=\"hashtag\">#"+extractHashTag+"</span>");
	//	    	if(extractHashTag != null) {
	//	    		System.out.println("최종 추출 해시태그 : "+ extractHashTag);
	//	    	}
		    }
		    if(content != "") {
		    	feed.setFeedContent(content);
		    	feedService.write(feed);
		    } %>
		
		
		
		
		
		$(content[i]).text(data.wallList[i].wallContent);
		var like = $('span[name=feedLike]')
		$(like[i]).text(data.wallList[i].wallLikeCnt);
		
		
		/* 프로필 사진 */
		var userImage = $('img[name=userImage]');
		var pictureName = data.userList[i].userPicture;
		if(pictureName != null){
			if(pictureName.split(':')[0]=='http' || pictureName.split(':')[0] == 'https'){
				/* console.log(pictureName) */
				$(userImage[i]).attr('src', pictureName);
			}else{
				$(userImage[i]).attr('src', "/sos/resources/img/"+pictureName);
			}
		}else{
			$(userImage[i]).attr('src', '/sos/resources/img/avatar10-sm.jpg');
		}
		
		/* 좋아요, 공유 */
		var commentCount = $('span[name=feedCommnetCount]')
		$(commentCount[i]).text(data.wallList[i].wallReplyCnt);
		var share = $('span[name=feedShare]');
		$(share[i]).text(data.wallList[i].wallShareCnt);
		
		/* 좋아요도 등록 */
		var likeComment = $('a[name=likebyOthers]')
		$(likeComment[i]).attr('title',data.wallList[i].wallSeq)
		/* 삭제 */
		var deleteComment = $('a[name=deleteFeed]')
		$(deleteComment[i]).attr('title',data.wallList[i].wallSeq)
	
		var moreIcon = $('div[name=moreIcon]');
		if("${user}" != null){
			var currentUser = "${user.userNickname}";
			if(currentUser == data.userList[i].userNickname){
				$(moreIcon[i]).css('display',"");
			}else{
				$(moreIcon[i]).css('display',"none");
			}
		}
		
		var feed = $('#newsfeed-items-grid').html(); 
		if(i == 0 ){
			$(feedCard).html(feed);
		}else{
			$(feedCard).append(feed);
		}
	}
}

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