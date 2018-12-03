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
  <%-- 테스트 로그인 ID로 Yegyeom Yu 보냄 --%>
  <jsp:include page="../includes/header.jsp"/>

          <%-- <jsp:param value="<%=loginId %>" name="userId" />
  </jsp:include> --%>

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
        <form class="w-search" style="width: 100%;">
          <div class="form-group with-button is-empty">
            <input id="autocompleteText" class="form-control" type="text" placeholder="캐시/태그/업종/다른유저">
            <button style="background-color: #3f4257;">
              <svg class="olymp-magnifying-glass-icon">
                <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-magnifying-glass-icon"></use></svg>
            </button>
            <span class="material-input"></span>
          </div>
        </form>
      </div>
      <%-- 검색 끝 --%> 
      
      
      <%-- 글 작성 시작 --%>
      <div class="ui-block">
        <div class="news-feed-form">

          <!-- Tab panes -->
          <div class="tab-content">
            <div class="tab-pane active" id="home-1" role="tabpanel"
              aria-expanded="true">
              <form>
                <div class="author-thumb">
                  <img
                    src="<%=application.getContextPath()%>/resources/img/author-page.jpg" alt="author">
                </div>
                <div
                  class="form-group with-icon label-floating is-empty">
                  <textarea class="form-control" placeholder="주식정보를 공유하여 주세요..!"></textarea>
                </div>
                <div class="add-options-message">
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="ADD PHOTOS"> 
                    <svg class="olymp-camera-icon" data-toggle="modal" data-target="#update-header-photo">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-camera-icon"></use></svg>
                  </a> 
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="TAG YOUR FRIENDS"> 
                    <svg class="olymp-computer-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-computer-icon"></use></svg>
                  </a> 
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="ADD LOCATION"> 
                     <svg class="olymp-small-pin-icon">
                     <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-small-pin-icon"></use></svg>
                  </a>

                  <button class="btn btn-primary btn-md-2">글올리기</button>

                </div>

              </form>
            </div>

          </div>
        </div>
      </div>
      <%-- 글 작성 끝 --%> 
      
      
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

  <!-- Window-popup-CHAT for responsive min-width: 768px -->
  <jsp:include page="../popup/popup-chat.jsp"></jsp:include>
  <!-- ... end Window-popup-CHAT for responsive min-width: 768px -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->
  
  


<!-- ################################# 비동기통신을 위한 AJax 처리 #################################### -->  

<script type="text/javascript">

/**  
 * 페이지 이동처리 방지를 위하여 시작시 실행
 */
$(document).ready( function() {

	getFeedList();	
	
   $('#myform').submit(function (e) {
    e.preventDefault();
    loginCheck();
  })
  $(document).ready(function(){
		$('#autocompleteText').autocomplete({
	        source : function(request, response) {
	            $.ajax({
	                type : 'get',
	                url : "<%=application.getContextPath()%>/sns/search",
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
	})
});

/** 
 * 로그인 처리를 위한 Ajax 통신
 */
function loginCheck() {

  var userId = $('#loginId').val();
  var userPw = $('#loginPw').val();

  console.log("aaa"+userId);
  console.log("bbb"+userPw);
  
  $.ajax({
    url : '/sos/user/login',
    type : 'post',
    data : {
      "userId" : userId,
      "userPw" : userPw
    },
    success : function(data) {
      if (data.message == "loginFail") {
        $('#checkMsg').html(
            "<p style='COLOR: red'>다시 로그인해주세요.</p>");
      } else{
    	
    	/* 쿠키 */
    	var userId = data.userId;
    	
    	alert(userId);
    	
        location.href="/sos/sns/newsfeed";        
      }
    },
    error : function() {
      alert("관리자에게 문의해주세요.");
    }
  });
  
} 

/** 
 * 회원가입 처리를 위한 Ajax 통신
 */
function signup(){
	
	
}

/** 
 * newsfeed의 list 목록 Ajax 통신
 */
function getFeedList(){
$.ajax({
	    url : '/sos/feed/list',
	    type : 'get',
	    success : function(data) {
	      if (data.feedList != null) {
	           console.log(data.feedList);
	           console.log(data.feedList[0].feedSeq);
	           console.log(data.feedList[1].feedSeq);
	           console.log(data.feedList[2].feedSeq);
	      }
	    },
	    error : function() {
	      alert("관리자에게 문의해주세요.");
	    }
	  });	
}
</script>
  
  

</body>
</html>







