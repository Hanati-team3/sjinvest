<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Newsfeed</title>
<jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>

  <!-- Header -->
  <jsp:include page="../includes/header.jsp"/>
  <!-- ... end Header -->

  <div class="header-spacer" style="height:80px"></div>
  
  <div class="container">
    <div class="row">
      
      <!-- realtime start -->
      <div class="col-xl-12 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12" style="float:right">
      <jsp:include page="../includes/realtime.jsp"></jsp:include>
      </div>
      <!-- ..realtime end -->
    </div>

    <div class="row">

      <!-- Main Content -->

      <main class="col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12">
      
      <%-- 검색 시작 --%>
      <div class="ui-block">
        <div class="w-search" style="width: 100%;">
          <div class="form-group with-button is-empty">
            <input id="autocompleteText" class="form-control" type="text" placeholder="캐시/태그/업종/다른유저" onkeypress="if(event.keyCode==13) {searching(); return false;}">
            <button id="searchYours" style="background-color: #3f4257;">
              <svg class="olymp-magnifying-glass-icon">
                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-magnifying-glass-icon"></use></svg>
            </button>
            <span class="material-input"></span>
          </div>
        </div>
      </div>      
      <%-- 검색 끝 --%> 
      
      
      <%-- 글 작성 start --%>
      <jsp:include page="feedWrite.jsp"></jsp:include>      
      <%-- 글 작성 end --%> 
      
      
      <%-- feed list start --%>
      <jsp:include page="feedList.jsp"></jsp:include>
      <%-- ... feed list end --%>      
      
      
      </main>

      <!-- ... end Main Content -->

      <!-- Left Sidebar -->
      <aside class="col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-12 col-xs-12">
        <%-- 내 정보 위젯 --%>
        <jsp:include page="../widgets/profile-info.jsp"></jsp:include>
        <%-- 내 주식정보 위젯 --%>
        <jsp:include page="../widgets/twitter-feed.jsp"></jsp:include>
        <%-- 모의 투자 랭킹 위젯 --%>
        <jsp:include page="../widgets/ranking.jsp"></jsp:include>
      </aside>
      <!-- ... end Left Sidebar -->

      <!-- Right Sidebar -->
      <aside class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">
        <%-- 관심 종목 위젯--%>
        <jsp:include page="../widgets/activity-feed.jsp"></jsp:include>
        <%-- 팔로잉, 팔로워 --%>
        <jsp:include page="../widgets/follow.jsp"></jsp:include>

        <%-- 추천 페이지 위젯인데 우리도 추천 계정 해주면 좋을듯.. --%>
        <%-- <jsp:include page="widgets/recommend-page.jsp"></jsp:include> --%>
        <%-- 추천 친구 위젯인데 이것도..? --%>
        <%-- <jsp:include page="widgets/recommend-friend.jsp"></jsp:include> --%>
      </aside>
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


<!-- ################################# 비동기통신을 위한 AJax 처리 #################################### -->  

<script type="text/javascript">
$(document).ready( function() {

	getFeedList();
	getFollowList();
	getFollowerList();
	getInterestList();
	
    $('#loginForm').submit(function (e) {
	    e.preventDefault();
	    loginCheck();
  	})
  	
  	/* 페이지 이동처리 방지를 위하여 시작시 실행 */
  	$(function(){
	$('#autocompleteText').autocomplete({
        source : function(request, response) {
            $.ajax({
                type : 'get',
                url : "<%=application.getContextPath()%>/sns/searchAuto",
                data : {
                    term : request.term
                },
                dataType: "json",
                success : function(data) {
                	response(
                           $.map(data, function(item) {
                               return {
                                   label: item,
                                   value: item
                               }
                           })
                       );
                }
            });
        }
    });
    });
    
	/* Feed 검색 */
	$(function(){
	$('#searchYours').on('click', function() {
	 	/* console.log('너의 값: '+$("#autocompleteText").val()) */
		searching()
	});
	});
	
	
	/* /* All 검색 */
	$(function(){
		$('#showAll').on('click', function() {
			getFeedList();
		});
	});
	
	/* Follow 검색 */
	
	$('#showFollwer').on('click', function() {
		$.ajax({
		    url : '/sos/feed/follow',
		    type : 'get',
		    success : function(data) {
		    	if(data){
	          		console.log(data)
	          		showFeedList(data);
	            }
		    },
		    error : function() {
		      alert("관리자에게 문의해주세요.");
		    }
	  });
	});
	
	/* Own Post 검색 */
	$('#showOwn').on('click', function() {
		$.ajax({
		    url : '/sos/feed/own',
		    type : 'get',
		    success : function(data) {
		    	if(data){
	          		console.log(data)
	          		showFeedList(data);
	            }
		    },
		    error : function() {
		      alert("관리자에게 문의해주세요.");
		    }
	  });
	}); 

	
});
/* 게시글 보여주기 (검색 포함) */
function searching(){
	$.ajax({
      	type : 'post',
          url: '<%=application.getContextPath()%>/feed/search',
          data: {
              text: $("#autocompleteText").val()
          },
          dataType : 'json',
          success : function(data) {
        	  	if(data){
	          		/* console.log(data); */
	          		showFeedList()
	            }
			}
      });
}

/** 
 * 로그인 처리
 */
function loginCheck() {

  var userId = $('#loginId').val();
  var userPw = $('#loginPw').val();

  console.log("받아온userId: "+userId);
  console.log("받아온userPw: "+userPw);
  
  $.ajax({
    url : '/sos/user/login',
    type : 'post',
    data : {
      "userId" : userId,
      "userPw" : userPw
    },
    success : function(data) {
      // 로그인 실패
      if (data.message == "loginFail") {
        $('#checkMsg').html(
            "<p style='COLOR: red'>다시 로그인해주세요.</p>");
      } 
      // 로그인 성공
      else if(data.user != null){
    	//console.log(data.user);
    	//console.log("여기나와야하는데????");
    	location.href="/sos/sns/newsfeed";
      }
    },
    error : function() {
      alert("관리자에게 문의해주세요.");
    }
  });
  
} 

/** 
 * 회원가입 처리
 */
function signup(){
	
	
}

/** 
 * newsfeed의 list 목록
 */
function getFeedList(){
	$.ajax({
	    url : '/sos/feed/list',
	    type : 'get',
	    success : function(data) {
	    	if(data){
          		console.log(data)
          		showFeedList(data);
            }
	    },
	    error : function() {
	      alert("관리자에게 문의해주세요.");
	    }
	  });
}

/* 받아온 게시글 뿌리는 역할 */
function showFeedList(data){
	var feedCard = $("#makeFeed");
	$(feedCard).html("");
	replyCnt = 0
	replyTemp = 0
	for (var i = 0; i < data.feedList.length; i++) {
		/* console.log(data.feedList[i]); */
		/* var feed = "<>"; */
		var nickname = $('a[name=postUserNickName]');
		$(nickname[i]).text(data.userList[i].userNickname)
		$(nickname[i]).attr('href', 'temp'+i)	/* 변경 필요 */
		var time = $('time[name=postWriteDate]');
		$(time[i]).text(data.feedList[i].feedRegdate);
		var content = $('p[name=feedContent]');
		$(content[i]).text(data.feedList[i].feedContent);
		var like = $('span[name=feedLike]')
		$(like[i]).text(data.feedList[i].feedLikeCnt);
		
		/* 수정 삭제 url 넣기!! */
		/* 좋아요, 댓글, 공유 */
		var commentCount = $('span[name=feedCommnetCount]')
		$(commentCount[i]).text(data.feedList[i].feedReplyCnt);
		var share = $('span[name=feedShare]');
		$(share[i]).text(data.feedList[i].feedShareCnt);
		
		var reply = $('div[name=commentList]');
		
		var replyName = $('a[name=replyName]');
		var replyTime = $('time[name=replyTime]');
		var replyContent = $('p[name=replyContent]');
		if(data.feedList[i].feedReplyCnt == 0){
			$(reply[i]).css("display", "none");
			replyCnt++;
		}else{
			$(reply[i]).css("display", "");
			for (var j = replyCnt; j < replyCnt + data.feedList[i].feedReplyCnt; j++) {
				$(replyName[j]).text(data.replyUser[replyTemp].userNickname);
				$(replyTime[j]).text(data.replyList[replyTemp].commentRegdate);
				$(replyContent[j]).text(data.replyList[replyTemp].commentContent);
				replyTemp++;
			}
			replyCnt += data.feedList[i].feedReplyCnt;
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
	
	//console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/follow/followList',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
		},
		success: function(data){
			if(data.fail != null){
				/* 값이 없는 경우 */
			}else{
				console.log(data.followList);
				for(var i=0; i<data.followList.length; i++){
					$('#follow_list').append('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+ data.followList[i].userSeq +'-sm.jpg\" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\">'+ data.followList[i].userId +'</a></div></li>');
				}
			}
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
	
	//console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/follow/followerList',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
		},
		success: function(data){
			if(data.fail != null){
				/* 값이 없는 경우 */
			}else{
				console.log(data.followerList);
				for(var i=0; i<data.followerList.length; i++){
					$('#follower_list').append('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+ data.followerList[i].userSeq +'-sm.jpg\" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\">'+ data.followerList[i].userId +'</a></div></li>');
				}
			}
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}


/** 
 * 주식관심종목 List
 */
function getInterestList(){
	
	//console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/interest/list',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
		},
		success: function(data){
			if(data.fail != null){
				/* 값이 없는 경우 */
			}else{
				for(var i=0; i<data.interestList.length; i++){
					$('#interest_list').append('<tr><td class="company-name"><div class="author-freshness"><a href="#" class="h6 title">'+ data.interestList[i].companyName +'</a></div></td><td class="stock-price"><a href="#" class="h6 count">38,750</a></td><td class="day-before-rate"><div class="author-freshness plus"><a href="#" class="h6 title">+ 1.90 %</a></div></td></tr>');
				}
			}
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}

/*
 * 유저 아이디 클릭시 data, modal
 */
function userData(){
	
	//console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/user/data',
		type : 'post',
		data : {
			"userId" : "tester01"
		},
		success: function(data){
			
			console.log("모달확인");
			$('#id2').replaceWith('<a href="#" id="id2" class="h4 author-name">'+ data.userData.userId +'</a>');
			$('#email2').replaceWith('<div class="email" id="email2">'+ data.userData.userEmail +'</div>');
			$('#nickName2').attr("placeholder", data.userData.userNickname);
			$('#detail2').attr("placeholder", data.userData.userDetail);
			
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
	
}



</script>
  
  

</body>
</html>







