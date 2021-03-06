<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Newsfeed</title>
<jsp:include page="../includes/head.jsp"></jsp:include>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
.hashtag{
  border: 1px solid #AAF0D1;
  border-radius: 25px;
  background-color: #AAF0D1;
}
img[name=feedImage]:hover{
	cursor:pointer;
   -webkit-transform:scale(2);

}
</style>
</head>
<body>

  <!-- Header -->
  <jsp:include page="../includes/header.jsp"/>
  <!-- ... end Header -->

  <div class="header-spacer" style="height:80px"></div>
  
  <div class="container" style="margin-top: 20px">
    <%-- realtime row 시작 --%>
    <div class="row realtime">
      <!-- realtime start -->
      <div class="col-xl-12 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12" style="float:right">
      <jsp:include page="../includes/realtime.jsp"></jsp:include>
      </div>
      <!-- ..realtime end -->
    </div>
    <%-- realtime row 끝 --%>

    <div class="row">
      <!-- Main Content -->

      <main class="col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12">
      
      <%-- 검색 시작 --%>
      <div class="ui-block">
        <div class="w-search" style="width: 100%;">
          <div class="form-group with-button is-empty">
            <input id="autocompleteText" class="form-control" type="text" placeholder="캐시태그($)/업종(@)/다른유저 검색하기" onkeypress="if(event.keyCode==13) {searching(); return false;}">
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

        <c:if test="${user.userId ne null }">
        <%-- 내 주식정보 위젯 --%>
        <jsp:include page="../widgets/mystock-info.jsp"></jsp:include>
        </c:if>
        
        <%-- 모의 투자 랭킹 위젯 --%>
        <jsp:include page="../widgets/ranking.jsp"></jsp:include>
      </aside>
      <!-- ... end Left Sidebar -->

      <!-- Right Sidebar -->
      <aside class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">
        
        <c:if test="${user.userId ne null }">
        <%-- 관심 종목 위젯--%>
        <jsp:include page="../widgets/activity-feed.jsp"></jsp:include>
        <%-- 팔로잉, 팔로워 --%>
        <jsp:include page="../widgets/follow.jsp"></jsp:include>
        </c:if>

        <%-- 추천 페이지 위젯인데 우리도 추천 계정 해주면 좋을듯.. --%>
        <%-- <jsp:include page="../widgets/recommend-page.jsp"></jsp:include> --%>
        
        <%-- 추천 친구 위젯인데 이것도..? --%>
        <%-- <jsp:include page="../widgets/recommend-friend.jsp"></jsp:include> --%>
      
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
	getRankingList();
	getHoldingList();
	getRealTime();
	
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
		    dataType:'json',
		    success : function(data) {
		    	if(data){
	          		/* console.log(data) */
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
		    dataType:'json',
		    success : function(data) {
		    	if(data){
		    		console.log('내거');
	          		/* console.log(data) */
	          		showFeedList(data);
	            }
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
	
	$("#writeForm").on("submit", function(event) {
		event.preventDefault();
		var feedContent = $('#feedContentT').val()
		feedContent = feedContent.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		/* console.log("내용!!! "+comment); */
		$.ajax({
		    url : '/sos/feed/write',
		    type : 'post',
		    data : {
		    	feedContent : feedContent
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


function writeComment(obj){
	console.log("뭐지");
	var feedSeq = $(obj).attr('title');
	var content = $(obj).closest("div.comment-div").find('textarea').val()
	console.log(feedSeq);
	console.log(content);
	$.ajax({
	    url : '/sos/comment/writing',
	    type : 'post',
	    data : {
	    	commentContent : content,
	    	feedSeq : feedSeq,
	    	userSeq : "${user.userSeq}"	
	    },
	    dataType:'json',
	    success : function(data) {
	    	showFeedList(data)
	    },
	    error : function() {
	      alert("관리자에게 문의해주세요.");
	    }
  });
}



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
	          		showFeedList(data)
	            }
			}
      });
}

function searchingByTag(obj){
	$.ajax({
      	type : 'post',
          url: '<%=application.getContextPath()%>/feed/search',
          data: {
              text: $(obj).find('.hashtag').text()
          },
          dataType : 'json',
          success : function(data) {
        	  	if(data){
	          		showFeedList(data)
	            }
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
	    dataType: 'json',
	    success : function(data) {
	    	if(data){
          		/* console.log(data) */
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
	console.log(data);
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
		var feedImage = $('img[name=feedImage]')
		if(data.feedList[i].feedPicture != null){
			$(feedImage[i]).attr('src', "/sos/resources/img/"+data.feedList[i].feedPicture);
			$(feedImage[i]).css('display', "");
		}else{
			$(feedImage[i]).attr('src', "");
			$(feedImage[i]).css('display', "none");
			
		}
		
		var content = $('div[name=feedContent]');
		var newContent = data.feedList[i].feedContent;
		var splitArray = newContent.split(' ');
		var fullText = ""
		/* for(var word in splitArray){
		   console.log(word)
			
		   if(word.indexOf('#') == 0 || word.indexOf('$') == 0 || word.indexOf('@') == 0) // # 문자를 찾는다.
		   {
		      word = '<a href="#"><span class=\"hashtag\">'+word+'</span></a>'; 
		   }
		   fullText += word+' ';
		} */
		for(var j = 0; j< splitArray.length; j++){
			var newWord = splitArray[j].split('\n')
			/* console.log(newWord); */
			if(newWord.length > 2){
				/* console.log('뭐지?') */
				var tempText = ""
				for(var k=0; k <newWord.length; k++){
					if(newWord[k].indexOf('#') == 0 || newWord[k].indexOf('$') == 0 || newWord[k].indexOf('@') == 0) // # 문자를 찾는다.
					   {
						newWord[k] = '<a href="javascript:void(0);" onclick="searchingByTag(this);" style="color:black"><span class=\"hashtag\">'+ newWord[k] +'</span></a>'; 
					   }
					tempText += newWord[k] + ' ';
				}
				fullText += tempText + ' ';
			}else{
				if(splitArray[j].indexOf('#') == 0 || splitArray[j].indexOf('$') == 0 || splitArray[j].indexOf('@') == 0) // # 문자를 찾는다.
				   {
					splitArray[j] = '<a href="javascript:void(0);" onclick="searchingByTag(this)" style="color:black"><span class=\"hashtag\">'+splitArray[j]+'</span></a>'; 
				   }
				   fullText += splitArray[j]+' ';
			}
		}
		$(content[i]).html(fullText);

		var like = $('span[name=feedLike]');
		$(like[i]).text(data.feedList[i].feedLikeCnt);
		
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
		$(commentCount[i]).text(data.feedList[i].feedReplyCnt);
		var shareFeed = $('span[name=feedShare]');
		$(shareFeed[i]).text(data.feedList[i].feedShareCnt);
		/* 공유 */
		var shareFeed = $('a[name=shareFeed]')
		$(shareFeed[i]).attr('title', data.feedList[i].feedSeq)
		if("${user.userSeq}" == data.feedList[i].userSeq){
			$(shareFeed[i]).attr("onclick", "")
		}else{
			$(shareFeed[i]).attr("onclick", "shareFeed(this)")
		}
		
		/* 댓글 */
		var commentCard = $("div[name=makeComment]")
		var reply = $('div[name=commentList]');
		
		var replyUL = $('ul[name=commentListUL]');
		var replyLI = $('li[name=commentLI]');
		if(data.feedList[i].feedReplyCnt == 0){
			$(commentCard[i]).css("display", "none");
			$(commentCard[i]).html(reply[i]);
		}else{
			$(commentCard[i]).css("display", "")
			$(replyUL[i]).css("display", "")
			$(reply[i]).css("display", "")
			$(commentCard[i]).html(reply[i]);
			
		}
		
		/* if(data.feedList[i].feedReplyCnt == 0){
			$(CommentCard[i]).html("");
		}else{
			var replyUL = $('ul[name=commentListUL]');
			$(reply[i]).css("display", "");
			for (var j = replyCnt; j < replyCnt + data.feedList[i].feedReplyCnt; j++) {
				var replyOther = $('li[name=commentFromOther]');
				var replyName = $('a[name=replyName]');
				var replyTime = $('time[name=replyTime]');
				var replyContent = $('p[name=replyContent]');
				$(replyName[j]).text(data.replyUser[j].userNickname);
				$(replyTime[j]).text(data.replyList[j].commentRegdate);
				$(replyContent[j]).text(data.replyList[j].commentContent);
				console.log(data.replyList[j].commentContent);
				$(replyOther[j]).css("display", "");
				if(j == replyCnt){
					$(replyUL[i]).html(replyOther[j]);
				}else{
					$(replyUL[i]).append(replyOther[j]);
				}
				$(CommentCard[i]).html(reply[replyTemp++]);
			}
			replyCnt += data.feedList[i].feedReplyCnt;
		} */
		
		var writeComment = $('a[name=writeComment]')
		$(writeComment[i]).attr('title',data.feedList[i].feedSeq)
		
		/* 좋아요도 등록 */
		var likeComment = $('a[name=likebyOthers]')
		$(likeComment[i]).attr('title',data.feedList[i].feedSeq)
		/* 수정 */
		var editComment = $('a[name=editFeed]')
		$(editComment[i]).attr('title',data.feedList[i].feedSeq)
		/* 삭제 */
		var deleteComment = $('a[name=deleteFeed]')
		$(deleteComment[i]).attr('title',data.feedList[i].feedSeq)
		
	
		var moreIcon = $('div[name=moreIcon]');
		if("${user.userSeq}" != null){
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
	var replyCnt = 0
	/* 댓글 */
	var replyUL = $('ul[name=commentListUL]');
	for (var i = 0; i < data.feedList.length; i++) {
		
		if(data.feedList[i].feedReplyCnt == 0){
			
		}else{
			for (var j = 0; j < data.feedList[i].feedReplyCnt; j++) {
				var replyLI = $('li[name=commentLI]')
				if(j==0){
					$(replyUL[i]).html(replyLI.html());
					
				}else{
					$(replyUL[i]).append(replyLI.html());
					//console.log("왜 안 나오니");
				}
			}
			var replyName = $('a[name=replyName]');
			var replyTime = $('time[name=replyTime]');
			var replyContent = $('p[name=replyContent]');
			var replyImage = $('img[name=replyImage]')
			var deleteComment = $('a[name=deleteComment]')
			
			var moreIconReply = $('div[name=moreIconReply]')
			for (var k = replyCnt; k < replyCnt + data.feedList[i].feedReplyCnt; k++){
				//console.log("댓글");
				var replyLI = $('li[name=commentLI]');
				
				$(replyName[k]).text(data.replyUser[k].userNickname);
				$(replyTime[k]).text(data.replyList[k].commentRegdate);
				$(replyContent[k]).text(data.replyList[k].commentContent);
				if(data.replyUser[k].userPicture != null){
					if(data.replyUser[k].userPicture.split(':')[0] == 'http' || data.replyUser[k].userPicture.split(':')[0] == 'https'){
						//console.log("뭐지");
						$(replyImage[k]).attr('src', data.replyUser[k].userPicture)
					}else{
						$(replyImage[k]).attr('src', '/sos/resources/img/'+data.replyUser[k].userPicture)
					}
				}else{
					$(replyImage[k]).attr('src', '/sos/resources/img/author-page.jpg')
				}
				
				if('${user.userSeq}' != null){
					var currentUser = "${user.userNickname}";
					if(currentUser == data.replyUser[k].userNickname){
						$(moreIconReply[k]).css('display',"");
						$(deleteComment[k]).attr('id', data.replyList[k].commentSeq);
						$(deleteComment[k]).attr('title', data.replyList[k].feedSeq);
					}else{
						$(moreIconReply[k]).css('display',"none");
					}
				}
				
				/* $(replyLI[k]).css("display",""); */
			}
			replyCnt += data.feedList[i].feedReplyCnt;
		}
	}
	/* var replyLI = $('li[name=commentLI]')
	$(replyLI[replyCnt]).css("display", "none"); */
	
}

function addPost(obj){
	var startNum = $(obj).attr('title')
	$(obj).attr('title', startNum+10)
	$.ajax({
	    url : '/sos/feed/listmore',
	    type : 'get',
	    data: {
	    	startNum : startNum
	    },
	    dataType:'json',
	    success : function(data) {
	    	if(data){
          		addFeedList(data);
            }
	    },
	    error : function() {
	      alert("관리자에게 문의해주세요.");
	    }
  });
}

function addFeedList(data){
	var feedCard = $("#makeFeed");
	$(feedCard).html("");
	console.log(data);
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
		var feedImage = $('img[name=feedImage]')
		if(data.feedList[i].feedPicture != null){
			$(feedImage[i]).attr('src', "/sos/resources/img/"+data.feedList[i].feedPicture);
			$(feedImage[i]).css('display', "");
		}else{
			$(feedImage[i]).attr('src', "");
			$(feedImage[i]).css('display', "none");
			
		}
		
		var content = $('div[name=feedContent]');
		var newContent = data.feedList[i].feedContent;
		var splitArray = newContent.split(' ');
		var fullText = ""
		/* for(var word in splitArray){
		   console.log(word)
			
		   if(word.indexOf('#') == 0 || word.indexOf('$') == 0 || word.indexOf('@') == 0) // # 문자를 찾는다.
		   {
		      word = '<a href="#"><span class=\"hashtag\">'+word+'</span></a>'; 
		   }
		   fullText += word+' ';
		} */
		for(var j = 0; j< splitArray.length; j++){
			var newWord = splitArray[j].split('\n')
			/* console.log(newWord); */
			if(newWord.length > 2){
				/* console.log('뭐지?') */
				var tempText = ""
				for(var k=0; k <newWord.length; k++){
					if(newWord[k].indexOf('#') == 0 || newWord[k].indexOf('$') == 0 || newWord[k].indexOf('@') == 0) // # 문자를 찾는다.
					   {
						newWord[k] = '<a href="javascript:void(0);" onclick="searchingByTag(this);" style="color:black"><span class=\"hashtag\">'+ newWord[k] +'</span></a>'; 
					   }
					tempText += newWord[k] + ' ';
				}
				fullText += tempText + ' ';
			}else{
				if(splitArray[j].indexOf('#') == 0 || splitArray[j].indexOf('$') == 0 || splitArray[j].indexOf('@') == 0) // # 문자를 찾는다.
				   {
					splitArray[j] = '<a href="javascript:void(0);" onclick="searchingByTag(this)" style="color:black"><span class=\"hashtag\">'+splitArray[j]+'</span></a>'; 
				   }
				   fullText += splitArray[j]+' ';
			}
		}
		$(content[i]).html(fullText);

		var like = $('span[name=feedLike]');
		$(like[i]).text(data.feedList[i].feedLikeCnt);
		
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
		$(commentCount[i]).text(data.feedList[i].feedReplyCnt);
		var shareFeed = $('span[name=feedShare]');
		$(shareFeed[i]).text(data.feedList[i].feedShareCnt);
		/* 공유 */
		var shareFeed = $('a[name=shareFeed]')
		$(shareFeed[i]).attr('title', data.feedList[i].feedSeq)
		if("${user.userSeq}" == data.feedList[i].userSeq){
			$(shareFeed[i]).attr("onclick", "")
		}else{
			$(shareFeed[i]).attr("onclick", "shareFeed(this)")
		}
		
		/* 댓글 */
		var commentCard = $("div[name=makeComment]")
		var reply = $('div[name=commentList]');
		
		var replyUL = $('ul[name=commentListUL]');
		var replyLI = $('li[name=commentLI]');
		if(data.feedList[i].feedReplyCnt == 0){
			$(commentCard[i]).css("display", "none");
			$(commentCard[i]).html(reply[i]);
		}else{
			$(commentCard[i]).css("display", "")
			$(replyUL[i]).css("display", "")
			$(reply[i]).css("display", "")
			$(commentCard[i]).html(reply[i]);
			
		}
		
		/* if(data.feedList[i].feedReplyCnt == 0){
			$(CommentCard[i]).html("");
		}else{
			var replyUL = $('ul[name=commentListUL]');
			$(reply[i]).css("display", "");
			for (var j = replyCnt; j < replyCnt + data.feedList[i].feedReplyCnt; j++) {
				var replyOther = $('li[name=commentFromOther]');
				var replyName = $('a[name=replyName]');
				var replyTime = $('time[name=replyTime]');
				var replyContent = $('p[name=replyContent]');
				$(replyName[j]).text(data.replyUser[j].userNickname);
				$(replyTime[j]).text(data.replyList[j].commentRegdate);
				$(replyContent[j]).text(data.replyList[j].commentContent);
				console.log(data.replyList[j].commentContent);
				$(replyOther[j]).css("display", "");
				if(j == replyCnt){
					$(replyUL[i]).html(replyOther[j]);
				}else{
					$(replyUL[i]).append(replyOther[j]);
				}
				$(CommentCard[i]).html(reply[replyTemp++]);
			}
			replyCnt += data.feedList[i].feedReplyCnt;
		} */
		
		var writeComment = $('a[name=writeComment]')
		$(writeComment[i]).attr('title',data.feedList[i].feedSeq)
		
		/* 좋아요도 등록 */
		var likeComment = $('a[name=likebyOthers]')
		$(likeComment[i]).attr('title',data.feedList[i].feedSeq)
		/* 수정 */
		var editComment = $('a[name=editFeed]')
		$(editComment[i]).attr('title',data.feedList[i].feedSeq)
		/* 삭제 */
		var deleteComment = $('a[name=deleteFeed]')
		$(deleteComment[i]).attr('title',data.feedList[i].feedSeq)
		
	
		var moreIcon = $('div[name=moreIcon]');
		if("${user.userSeq}" != null){
			var currentUser = "${user.userNickname}";
			if(currentUser == data.userList[i].userNickname){
				$(moreIcon[i]).css('display',"");
			}else{
				$(moreIcon[i]).css('display',"none");
			}
		}
		
		
		
		var feed = $('#newsfeed-items-grid').html(); 
		$(feedCard).append(feed);
		
	}
	var replyCnt = 0
	/* 댓글 */
	var replyUL = $('ul[name=commentListUL]');
	for (var i = 0; i < data.feedList.length; i++) {
		
		if(data.feedList[i].feedReplyCnt == 0){
			
		}else{
			for (var j = 0; j < data.feedList[i].feedReplyCnt; j++) {
				var replyLI = $('li[name=commentLI]')
				if(j==0){
					$(replyUL[i]).html(replyLI.html());
					
				}else{
					$(replyUL[i]).append(replyLI.html());
					//console.log("왜 안 나오니");
				}
			}
			var replyName = $('a[name=replyName]');
			var replyTime = $('time[name=replyTime]');
			var replyContent = $('p[name=replyContent]');
			var replyImage = $('img[name=replyImage]')
			var deleteComment = $('a[name=deleteComment]')
			
			var moreIconReply = $('div[name=moreIconReply]')
			for (var k = replyCnt; k < replyCnt + data.feedList[i].feedReplyCnt; k++){
				//console.log("댓글");
				var replyLI = $('li[name=commentLI]');
				
				$(replyName[k]).text(data.replyUser[k].userNickname);
				$(replyTime[k]).text(data.replyList[k].commentRegdate);
				$(replyContent[k]).text(data.replyList[k].commentContent);
				if(data.replyUser[k].userPicture != null){
					if(data.replyUser[k].userPicture.split(':')[0] == 'http' || data.replyUser[k].userPicture.split(':')[0] == 'https'){
						//console.log("뭐지");
						$(replyImage[k]).attr('src', data.replyUser[k].userPicture)
					}else{
						$(replyImage[k]).attr('src', '/sos/resources/img/'+data.replyUser[k].userPicture)
					}
				}else{
					$(replyImage[k]).attr('src', '/sos/resources/img/author-page.jpg')
				}
				
				if("${user}" != null){
					var currentUser = "${user.userNickname}";
					if(currentUser == data.replyUser[k].userNickname){
						$(moreIconReply[k]).css('display',"");
						$(deleteComment[k]).attr('id', data.replyList[k].commentSeq);
						$(deleteComment[k]).attr('title', data.replyList[k].feedSeq);
					}else{
						$(moreIconReply[k]).css('display',"none");
					}
				}
				
				/* $(replyLI[k]).css("display",""); */
			}
			replyCnt += data.feedList[i].feedReplyCnt;
		}
	}
	/* var replyLI = $('li[name=commentLI]')
	$(replyLI[replyCnt]).css("display", "none"); */
	
	
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
				$('#follow_list').html('유저가 없습니다.')
			}else{
				//console.log(data.followList);
				for(var i=0; i<data.followList.length; i++){
					if(i == 0){
						$('#follow_list').html('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followList[i].userNickname +'</a></div></li>');
					}else{
						$('#follow_list').append('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followList[i].userNickname +'</a></div></li>');
					}
				}
			}
			appendFollowEvent();
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}

/* 좋아요 글 누르기 */
function likeFeed(obj){
	
	var feedSeq = $(obj).attr('title');
	/* console.log(feedSeq); */
	$.ajax({
		url : '/sos/like/handle',
		type : 'post',
		data : {
			"userSeq" : "${user.userSeq}",
			"feedSeq" : feedSeq
		},
		dataType:'json',
		success: function(data){
			 $(obj).find('span').text(data);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	}) 
}

/* 글 수정 */
function editFeed(obj){
	var feedSeq = $(obj).attr('title');
	var feedUser = $(obj).closest("article.hentry").find('a[name=postUserNickName]').html();
	var user = "${user.userNickname}"
	$.ajax({
		url : '/sos/feed/edit',
		type : 'post',
		data : {
			"userSeq" : "${user.userSeq}",
			"feedSeq" : feedSeq
		},
		dataType:'json',
		success: function(data){
			 $(obj).find('span').text(data);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	}) 
}

/* 글 삭제 */
function deleteFeed(obj){
	var feedSeq = $(obj).attr('title');
	var user = "${user.userNickname}"
	$.ajax({
		url : '/sos/feed/delete',
		type : 'post',
		data : {
			"feedSeq" : feedSeq
		},
		dataType:'json',
		success: function(data){
			showFeedList(data); 
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	}) 
}

/* 글 공유 */
function shareFeed(obj){
	var feedSeq = $(obj).attr('title');
	$.ajax({
		url : '/sos/wall/share',
		type : 'post',
		data : {
			"feedSeq" : feedSeq,
			"wantedSeq" : "${user.userSeq}"
		},
		dataType:'json',
		success: function(data){
			showFeedList(data);
			alert('공유 되었습니다.');
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	}) 
}

/* 댓글 삭제 */
function deleteComment(obj){
	var commentSeq = $(obj).attr('id');
	var feedSeq = $(obj).attr('title');
	$.ajax({
		url : '/sos/comment/delete',
		type : 'post',
		data : {
			"commentSeq" : commentSeq,
			"feedSeq" : feedSeq
		},
		dataType:'json',
		success: function(data){
			showFeedList(data); 
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
				$('#follower_list').html('유저가 없습니다.')
			}else{
				//console.log(data.followerList);
				for(var i=0; i<data.followerList.length; i++){
					if (i == 0){
    					$('#follower_list').html('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followerList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followerList[i].userNickname +'</a></div></li>');
					}else{
						$('#follower_list').append('<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+data.followerList[i].userSeq+'-sm.jpg" class=\"avatar\"></div><div class=\"author-status\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\" >'+ data.followerList[i].userNickname +'</a></div></li>');
					}
				}
			}
			appendFollowerEvent();
			
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
					$('#interest_list').append('<tr><td class="company-number"><div class="author-freshness"><a href="/sos/stock/company/'+ data.interestList[i].companyNumber +'" class="h6 title">'+ data.interestList[i].companyNumber +'</a></div></td><td class="company-name"><a href="/sos/stock/company/'+ data.interestList[i].companyNumber +'" class="h6 count">'+ data.interestList[i].companyName +'</a></td></tr>');

				}
			}
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}

/** 
 * 주식보유종목 List
 */
function getHoldingList(){
	
	//console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/holding/list',
		type : 'get',
		data : {
			"userSeq" : "${user.userSeq}"
		},
		success: function(data){

			if(data.fail != null){
				/* 값이 없는 경우 */
			}else{
				for(var i=0; i<data.holdingList.length; i++){
					$('#holding_list').append('<tr><td class="company-number"><div class="author-freshness"><a href="/sos/stock/company/'+data.holdingList[i].companyNumber+'" class="h6 title";>'+ data.holdingList[i].companyNumber +'</a></div></td><td class="company-name"><a href="/sos/stock/company/'+data.holdingList[i].companyNumber+'" class="h6 count">'+ data.holdingList[i].companyName +'</a></td><td class="holding-amount"><a href="#" class="h6 count">'+ data.holdingList[i].holdingAmount +'</a></td></tr>');

				}
			}
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
	
}


/** 
 * 주식랭킹 top5
 */
function getRankingList(){
	
	//console.log("${user.userSeq}");
	$.ajax({
		
		url : '/sos/user/ranking',
		type : 'get',
		/* data : {
		}, */
		success: function(data){

 			if(data.fail != null){
				/* 값이 없는 경우 */
			}else{
				for(var i=0; i<data.userRanking.length; i++){
					
					$('#rankingList').append(
							'<li class=\"inline-items\"><div class=\"author-thumb\"><img alt=\"author\" src=\"<%=application.getContextPath()%>/resources/img/avatar'+ data.userRanking[i].userSeq +'-sm.jpg\" class=\"avatar\"></div><div class=\"author-status\" style=\"margin-left:10px;\"><a href=\"javascript:void(0);\" class=\"h6 author-name\" data-toggle=\"modal\" data-target=\"#user_data\">'+ data.userRanking[i].userNickname +'</a><div style=\"color:red;\">'+ data.userRanking[i].userTotalMargin +'%</div></div></li>'
					);
				}
			}
 			appendRankEvent();
		},
		error : function() {
	        alert("관리자에게 문의에게 문의해주세요.");
	    }
	
	})
	
}


/*
 * newsfeed 닉네임 클릭시 유저 modal
 */
function userModal(obj){
	$.ajax({
		url : '/sos/user/dataNick',
		type : 'post',
		data : {
			"userNickname" : obj.text,
			"followUserSeq" : "${user.userSeq}"
		},
		success: function(data){
			modal(data);
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	});
};	
	

/*
 * ranking 유저 click시 modal
 */
function appendRankEvent(){
	$('#rankingList li a').on('click', function(){

		$.ajax({
			url : '/sos/user/dataNick',
			type : 'post',
			data : {
				"userNickname" : this.text,
				"followUserSeq" : "${user.userSeq}"
			},
			success: function(data){
				modal(data);
			},
			error : function() {
		        alert("관리자에게 문의해주세요.");
		    }
		
		})
		
	})

};

/*
 * follow 유저 click시 modal
 */
function appendFollowEvent() {
	$('#follow_list li a').on('click', function(){

		$.ajax({
			url : '/sos/user/dataNick',
			type : 'post',
			async : false,
			data : {
				"userNickname" : this.text,
				"followUserSeq" : "${user.userSeq}"
			},
			success: function(data){
				modal(data)
			},
			error : function() {
		        alert("관리자에게 문의해주세요.");
		    }
		
		})
	});
}

/*
 * follower 친구 아이디 click시 modal
 */
function appendFollowerEvent(){
	$('#follower_list li a').on('click', function(){

		$.ajax({
			url : '/sos/user/dataNick',
			type : 'post',
			async : false,
			data : {
				"userNickname" : this.text,
				"followUserSeq" : "${user.userSeq}"
			},
			success: function(data){
				modal(data)
			},
			error : function() {
		        alert("관리자에게 문의해주세요.");
		    }
		
		})
		
	});
};


function modal(data){
	$('#id2').replaceWith('<a href="#" id="id2" class="h4 author-name">'+ data.userData.userId +'</a>');
	$('#email2').replaceWith('<div class="email" id="email2">'+ data.userData.userEmail +'</div>');
	$('#nickName2').attr("placeholder", data.userData.userNickname);
	$('#detail2').attr("placeholder", data.userData.userDetail);
	$('#heartIcon').attr("title", data.userData.userId);
	$('#goPersonal').attr('href', '/sos/sns/personal/'+data.userData.userId);
	var pictureData = data.userData.userPicture
	if(pictureData != null){
		if(pictureData.split(':')[0]=='http' || pictureData.split(':')[0] == 'https'){
			$('#userProfileData').attr('src', pictureData);
		}else{
			$('#userProfileData').attr('src', "/sos/resources/img/"+pictureData);
		}
	}else{
		$('#userProfileData').attr('src', "/sos/resources/img/author-main1.jpg")
	}
	if(data.isFollow == 'true'){
		console.log("팔로우");
		$('#heartIcon').css('background-color', '#ff5e3a');
	}else{
		$('#heartIcon').css('background-color', '');
		console.log("no팔로우");
	}
};

/*
 * follower 친구 아이디 click시 modal
 */
function appendFollowerEvent(){
	$('#follower_list li a').on('click', function(){

		$.ajax({
			url : '/sos/user/dataNick',
			type : 'post',
			async : false,
			data : {
				"userNickname" : this.text,
				"followUserSeq" : "${user.userSeq}"
			},
			success: function(data){
				modal(data)
			},
			error : function() {
		        alert("관리자에게 문의해주세요.");
		    }
		
		})
		
	});
};

/*
 * realtime
 */
function getRealTime(){
	$.ajax({
		url : '/sos/stock/realtime',
		type : 'get',
		success: function(data){
          var realTimeList = $("ul#scroll li a");
          for(var i = 0; i < realTimeList.length; i++){
        	  realTimeList.eq(i).text((i+1)+"  "+data[i].stockName+" "+numberWithCommas(data[i].total));
        	  realTimeList.eq(i).attr('href','company/'+data[i].stockCode);
          }
          setTimeout(getRealTime, 2000);
		},
		error : function() {
	        
	    }
	
	})
};


</script>

</body>
</html>







