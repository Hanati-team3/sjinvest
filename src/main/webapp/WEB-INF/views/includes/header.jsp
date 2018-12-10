<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sjinvest.sos.user.domain.User" %>

<%
boolean result = true;

if((User)(request.getSession().getAttribute("user")) != null){

  if(((((User)request.getSession().getAttribute("user")).getUserPicture().split(":")[0]).equals("http") || (((User)request.getSession().getAttribute("user")).getUserPicture().split(":")[0]).equals("https"))){
    result = true;
  }else{
    result = false;
  }
}
%>

<!-- Header -->

<header class="header--standard header--standard-dark" id="header--standard-2" style="width: 100%; left: 0px; padding: 0px 55px;">
  <div class="header-content-wrapper" >
  
    <a href="<%=application.getContextPath()%>/sns/newsfeed" class="logo" style="float: left; padding:10px; min-width: 70px;">
      <img src="<%=application.getContextPath()%>/resources/img/sos.png" alt="Olympus" style="width: 70px; height: auto; margin: 0px">
    </a>
    <a href="<%=application.getContextPath()%>/sns/newsfeed" class="logo" style="float: left; padding: 20px 10px;" >
      <h6 class="logo-title" style="margin-top: 0px">SNS</h6>
    </a>
    <a href="<%=application.getContextPath()%>/stock/index" class="logo" style="float: left; padding: 20px 10px;" >
      <h6 class="logo-title" style="margin-top: 0px">STOCK</h6>
    </a>
    <a href="#" class="open-responsive-menu js-open-responsive-menu">
    	<svg class="olymp-menu-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-menu-icon"></use></svg>
    </a>


    <div class="control-block " style="padding: 10px 30px;">
      
      
      <%--로그인 판별 --%>
      <c:choose>
        <%--로그인 아님 --%>
        <c:when test="${user.userId eq null}">
          <a id="loginModal" href="#" class="link-find-friend header-a-padding" data-toggle="modal" data-target="#login_modal">Login</a>
          <a href="#" class="link-find-friend header-a-padding" data-toggle="modal" data-target="#signup_modal">Sign up</a>
        </c:when>
        
        <%--로그인 중 --%>
        <c:otherwise>
        
          <%-- SNS 알림 start --%>
          <div class="control-icon more has-items">
            <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
            <div id="snsCnt"></div>
    
            <div class="more-dropdown more-with-triangle triangle-top-center">
              <div class="ui-block-title ui-block-title-small">
                <h6 class="title">SNS 알림</h6>
              </div>
    
              <div class="mCustomScrollbar" data-mcs-theme="dark" >
                <ul class="notification-list friend-requests" id="sns-list">

                  <%-- sns 알림 sample
                  <li class="accepted">
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar57-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      <a href="#" class="h6 notification-friend">친구이름</a>
                    </div>
                  </li> 
                  --%>
    
    
                </ul>
              </div>
    
              <a href="#" class="view-all bg-blue">sns 알림</a>
            </div>
          </div>
          <%-- ..SNS 알림 end --%>
          
    
          <%-- stock 알림 start --%>
          <div class="control-icon more has-items">
            <svg class="olymp-thunder-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-thunder-icon"></use></svg>
            <div id="stockCnt"></div>
    
            <div class="more-dropdown more-with-triangle triangle-top-center">
              <div class="ui-block-title ui-block-title-small">
                <h6 class="title">Stock 알림</h6>
              </div>
              <div class="mCustomScrollbar" data-mcs-theme="dark">
                <ul class="notification-list" id="stock-list">
                
                  <%-- stock 알림 sample --%>

                </ul>
              </div>
              <a href="#" class="view-all bg-primary">stock 알림</a>
            </div>
          </div>
          <%-- ..stock 알림 end --%>
          
          
          <!-- 개인정보 시작  -->
          <div class="author-page author vcard inline-items more">
            <div class="author-thumb">
                <%if (result == true){ %>
                  <img alt="author" src="${user.userPicture}" width="36" height="36" class="avatar">
                  <%}else if(result == false){ %>
                  <img alt="author" src="<%=application.getContextPath()%>/resources/img/${user.userPicture}"width="36" height="36" class="avatar">
                  <%}%>
                  
              <!-- 마우스 오버 -->
              <div class="more-dropdown more-with-triangle">
                <div class="mCustomScrollbar" data-mcs-theme="dark">

                  <%-- 개인주식 start --%>
                  <div class="ui-block-title ui-block-title-small">
                    <h6 class="title">MY STOCK</h6>
                  </div>
                  <ul>
                    <li>
                      <a href="/sos/stock/interest/list">
                        <span>관심종목</span>
                      </a>
                    </li>
                    <li>
                      <a href="/sos/stock/trade-list">
                        <span>주문내역</span>
                      </a>
                    </li>
                    <li>
                      <a href="/sos/stock/holding/list">
                        <span>현재보유내역</span>
                      </a>
                    </li>
                  </ul>
                  <%-- ..개인주식 end --%>


                  <%-- 계정 설정 시작 --%>
                  <div class="ui-block-title ui-block-title-small">
                    <h6 class="title">Your Account</h6>
                  </div>
    
                  <ul class="account-settings">
                    <li>
                      <a href="/sos/sns/mypage_index">
                        <svg class="olymp-menu-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-menu-icon"></use></svg>
                        <span>마이페이지</span>
                      </a>
                    </li>
                    <li>
                      <a href="/sos/user/logout">
                        <svg class="olymp-logout-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-logout-icon"></use></svg>
                        <span>로그아웃</span>
                      </a>
                    </li>
                  </ul>
                  <%-- 계정 설정 끝 --%>
                  
                </div>
              </div>
              <!-- 마우스 오버 끝-->
            </div>
            <a href="/sos/sns/mypage_index" class="author-name fn">
              <div class="author-title">
                ${user.userNickname }
                <svg class="olymp-dropdown-arrow-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
              </div>
              <span class="author-subtitle"></span>
            </a>
          </div>
          <!-- 개인정보 끝  -->
        </c:otherwise>
      </c:choose>


    </div>
  </div>

</header>
<!-- ... end Header -->









<!-- Responsive Header -->

<header class="header header-responsive" id="site-header-responsive">

  <div class="header-content-wrapper">
    <ul class="nav nav-tabs mobile-app-tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#request" role="tab">
          <div class="control-icon has-items">
            <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
            <div class="label-avatar bg-blue" id="snsCnt"></div>
          </div>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#notification" role="tab">
          <div class="control-icon has-items">
            <svg class="olymp-thunder-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-thunder-icon"></use></svg>
            <div class="label-avatar bg-primary" id="stockCnt"></div>
          </div>
        </a>
      </li>
    </ul>
  </div>

  <!-- Tab panes -->
  <div class="tab-content tab-content-responsive">

    <div class="tab-pane " id="request" role="tabpanel">

      <div class="mCustomScrollbar" data-mcs-theme="dark">
        <div class="ui-block-title ui-block-title-small">
          <h6 class="title">SNS 알림</h6>
        </div>
        <ul class="notification-list friend-requests" id="sns-list">

        <!-- 목록 들어와야할 영역 -->
        
        </ul>
        <a href="#" class="view-all bg-blue">sns 알림</a>
      </div>

    </div>


    <div class="tab-pane " id="notification" role="tabpanel">

      <div class="mCustomScrollbar" data-mcs-theme="dark">
        <div class="ui-block-title ui-block-title-small">
          <h6 class="title">STOCK 알림</h6>
        </div>

        <ul class="notification-list" id="stock-list">

        <!-- 목록 들어와야할 영역 -->

        </ul>

        <a href="#" class="view-all bg-primary">stock 알림</a>
      </div>

    </div>
  </div>
  <!-- ... end  Tab panes -->

</header>

<!-- ... end Responsive Header -->


 
  <!-- login modal start-->
  <jsp:include page="../popup/login.jsp"></jsp:include>
  <!-- ... end login modal -->
 
  <!-- signup modal start -->
  <jsp:include page="../popup/signup.jsp"></jsp:include>
  <!-- ... end signup modal -->


<script src="<%=application.getContextPath()%>/resources/js/jquery-3.2.0.min.js"></script>

<script type="text/javascript">



$(document).ready( function() {
	snsList();
	stockList();
});

 

/**
 * header의 sns 목록 함수
 */
function snsList(){
	
	//console.log("sns리스트 시작.");
	
	$.ajax({
		
		url : '/sos/notice/snsList',
		type : 'get',
		data : {
			
			"userId" : "${user.userId}"
		},
		success: function(data){
			if(!data.fail){
    			if(data.snsList.length != null){	
    				for(var i=0; i<data.snsList.length; i++){
    				
    				//console.log("sns정보"+data.snsList[i].noticeContent);
    				$('#snsCnt').replaceWith('<div class="label-avatar bg-blue" id="snsCnt">'+ data.snsList.length +'</div>');
    				$('#sns-list').append('<li><div><a href="#" class="h6 notification-friend">'+ data.snsList[i].noticeContent +'</a></div><span class="notification-date">'+ data.snsList[i].noticeDate +'</span></li>');
    			
    				}		
				}
			}
		},
		error : function() {
	        alert("관리자에게 문의해주세요.");
	    }
	
	})
}

/**
 * header의 stock 목록 함수
 */
function stockList(){
	
	//console.log("stock리스트 시작.");
	
	$.ajax({
		
		url : '/sos/notice/stockList',
		type : 'get',
		data : {
			"userId" : "${user.userId}"
		},
		success: function(data){
			if(!data.fail){
				if(data.stockList.length != null){	
					for(var i=0; i<data.stockList.length; i++){
						
						//console.log("주식정보 : "+data.stockList[i].noticeContent);
						$('#stockCnt').replaceWith('<div class="label-avatar bg-primary" id="stockCnt">'+ data.stockList.length +'</div>');
						$('#stock-list').append('<li><div><a href="/sos/stock/trade-list" class="h6 notification-friend">'+ data.stockList[i].noticeContent +'</a></div><span class="notification-date">'+ data.stockList[i].noticeDate +'</span></li> ');	

					}
				}
			}
		},
		error : function() {
	       alert("관리자에게 문의해주세요.");
	    }
	
	})
}


</script>


