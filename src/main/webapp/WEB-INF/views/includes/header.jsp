<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    
      <%--로그인중인지 아닌지 판별 --%>
      <c:choose>
        <%--로그인 아님 --%>
        <c:when test="${param.loginId eq null}">
          <a href="#" class="link-find-friend header-a-padding" data-toggle="modal" data-target="#login_modal">Login</a>
          <a href="#" class="link-find-friend header-a-padding" data-toggle="modal" data-target="#signup_modal">Sign up</a>
        </c:when>
        <%--로그인 중 --%>
        <c:otherwise>
        
          <%-- 알림 시작 --%>
          
          <%-- SNS 알림 시작 --%>
          <div class="control-icon more has-items">
            <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
            <div class="label-avatar bg-blue">6</div>
    
            <div class="more-dropdown more-with-triangle triangle-top-center">
              <div class="ui-block-title ui-block-title-small">
                <h6 class="title">SNS 알림</h6>
              </div>
    
              <div class="mCustomScrollbar" data-mcs-theme="dark">
                <ul class="notification-list friend-requests">
                  <li>
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar55-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      <a href="#" class="h6 notification-friend">Tamara Romanoff</a>
                      <span class="chat-message-item">Mutual Friend: Sarah Hetfield</span>
                    </div>
                    <span class="notification-icon">
                      <a href="#" class="accept-request">
                        <span class="icon-add without-text">
                          <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                        </span>
                      </a>
    
                      <a href="#" class="accept-request request-del">
                        <span class="icon-minus">
                          <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                        </span>
                      </a>
    
                    </span>
    
                    <div class="more">
                      <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                    </div>
                  </li>
    

                  <li class="accepted">
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar57-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      You and <a href="#" class="h6 notification-friend">Mary Jane Stark</a> just became friends. Write on <a href="#" class="notification-link">her wall</a>.
                    </div>
                    <span class="notification-icon">
                      <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </span>
    
                    <div class="more">
                      <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                      <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
                    </div>
                  </li>
    
    
                </ul>
              </div>
    
              <a href="#" class="view-all bg-blue">모든 sns 알림 읽기</a>
            </div>
          </div>
          <%-- SNS 알림 끝 --%>
          
    
          <%-- 주식 알림 시작 --%>
          <div class="control-icon more has-items">
            <svg class="olymp-thunder-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-thunder-icon"></use></svg>
    
            <div class="label-avatar bg-primary">8</div>
    
            <div class="more-dropdown more-with-triangle triangle-top-center">
              <div class="ui-block-title ui-block-title-small">
                <h6 class="title">Stock 알림</h6>
              </div>
              <div class="mCustomScrollbar" data-mcs-theme="dark">
                <ul class="notification-list">
                
                  <li>
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar62-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      <div><a href="#" class="h6 notification-friend">Mathilda Brinker</a> commented on your new <a href="#" class="notification-link">profile status</a>.</div>
                      <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">4 hours ago</time></span>
                    </div>
                      <span class="notification-icon">
                        <svg class="olymp-comments-post-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-comments-post-icon"></use></svg>
                      </span>
    
                    <div class="more">
                      <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                      <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
                    </div>
                  </li>
    
                  <li class="un-read">
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar63-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      <div>You and <a href="#" class="h6 notification-friend">Nicholas Grissom</a> just became friends. Write on <a href="#" class="notification-link">his wall</a>.</div>
                      <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">9 hours ago</time></span>
                    </div>
                      <span class="notification-icon">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
    
                    <div class="more">
                      <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                      <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
                    </div>
                  </li>
    
                  <li>
                    <div class="author-thumb">
                      <img src="<%=application.getContextPath()%>/resources/img/avatar65-sm.jpg" alt="author">
                    </div>
                    <div class="notification-event">
                      <div><a href="#" class="h6 notification-friend">Green Goo Rock</a> invited you to attend to his event Goo in <a href="#" class="notification-link">Gotham Bar</a>.</div>
                      <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">March 5th at 6:43pm</time></span>
                    </div>
                      <span class="notification-icon">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
    
                    <div class="more">
                      <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                      <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
                    </div>
                  </li>
    

                </ul>
              </div>
              <a href="#" class="view-all bg-primary">모든 stock 알림 읽기</a>
            </div>
          </div>
          <%-- 주식 알림 끝 --%>
          
          
          <!-- 개인정보 시작  -->
          <div class="author-page author vcard inline-items more">
            <div class="author-thumb">
              <img alt="author" src="<%=application.getContextPath()%>/resources/img/author-page.jpg" class="avatar">
              <span class="icon-status online"></span>
              <!-- 마우스 오버 -->
              <div class="more-dropdown more-with-triangle">
                <div class="mCustomScrollbar" data-mcs-theme="dark">

                  <%-- 기업정보 시작 --%>
                  <div class="ui-block-title ui-block-title-small">
                    <h6 class="title">MY STOCK</h6>
                  </div>
                  <ul>
                    <li>
                      <a href="#">
                        <span>관심종목</span>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <span>주문내역</span>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <span>현재보유내역</span>
                      </a>
                    </li>
                  </ul>
                  <%-- 기업정보 끝 --%>


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
                      <a href="#">
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
                ${param.loginId }
                <svg class="olymp-dropdown-arrow-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
              </div>
              <span class="author-subtitle">SPACE COWBOY</span>
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
            <div class="label-avatar bg-blue">6</div>
          </div>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#notification" role="tab">
          <div class="control-icon has-items">
            <svg class="olymp-thunder-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-thunder-icon"></use></svg>
            <div class="label-avatar bg-primary">8</div>
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
        <ul class="notification-list friend-requests">
          <li>
            <div class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/avatar55-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <a href="#" class="h6 notification-friend">Tamara Romanoff</a>
              <span class="chat-message-item">Mutual Friend: Sarah Hetfield</span>
            </div>
                  <span class="notification-icon">
                    <a href="#" class="accept-request">
                      <span class="icon-add without-text">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
                    </a>

                    <a href="#" class="accept-request request-del">
                      <span class="icon-minus">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
                    </a>

                  </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
            </div>
          </li>
          <li>
            <div class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/avatar56-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <a href="#" class="h6 notification-friend">Tony Stevens</a>
              <span class="chat-message-item">4 Friends in Common</span>
            </div>
                  <span class="notification-icon">
                    <a href="#" class="accept-request">
                      <span class="icon-add without-text">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
                    </a>

                    <a href="#" class="accept-request request-del">
                      <span class="icon-minus">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
                    </a>

                  </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
            </div>
          </li>
          <li class="accepted">
            <div class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/avatar57-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              You and <a href="#" class="h6 notification-friend">Mary Jane Stark</a> just became friends. Write on <a href="#" class="notification-link">her wall</a>.
            </div>
                  <span class="notification-icon">
                    <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                  </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
              <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
            </div>
          </li>
          <li>
            <div class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/avatar58-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <a href="#" class="h6 notification-friend">Stagg Clothing</a>
              <span class="chat-message-item">9 Friends in Common</span>
            </div>
                  <span class="notification-icon">
                    <a href="#" class="accept-request">
                      <span class="icon-add without-text">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
                    </a>

                    <a href="#" class="accept-request request-del">
                      <span class="icon-minus">
                        <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                      </span>
                    </a>

                  </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
            </div>
          </li>
        </ul>
        <a href="#" class="view-all bg-blue">Check all your Events</a>
      </div>

    </div>


    <div class="tab-pane " id="notification" role="tabpanel">

      <div class="mCustomScrollbar" data-mcs-theme="dark">
        <div class="ui-block-title ui-block-title-small">
          <h6 class="title">STOCK 알림</h6>
        </div>

        <ul class="notification-list">
          <li>
            <div class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/avatar62-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <div><a href="#" class="h6 notification-friend">Mathilda Brinker</a> commented on your new <a href="#" class="notification-link">profile status</a>.</div>
              <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">4 hours ago</time></span>
            </div>
                    <span class="notification-icon">
                      <svg class="olymp-comments-post-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-comments-post-icon"></use></svg>
                    </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
              <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
            </div>
          </li>

          <li class="un-read">
            <div class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/avatar63-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <div>You and <a href="#" class="h6 notification-friend">Nicholas Grissom</a> just became friends. Write on <a href="#" class="notification-link">his wall</a>.</div>
              <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">9 hours ago</time></span>
            </div>
                    <span class="notification-icon">
                      <svg class="olymp-happy-face-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                    </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
              <svg class="olymp-little-delete"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
            </div>
          </li>


        </ul>

        <a href="#" class="view-all bg-primary">View All Notifications</a>
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


