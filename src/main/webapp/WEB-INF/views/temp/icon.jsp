<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SOS - 모의투자</title>
<jsp:include page="../includes/head.jsp"></jsp:include>
<style>
svg .olymp-three-dots-icon {
    height: 26px;
    width: 26px;
    display: inline-block;
}
</style>
</head>

<body>

  <%-- 우리한테 필요 없는 고정 양측 사이드바 --%>
  <!-- Fixed Sidebar Left -->
  <%-- <jsp:include page="includes/fixed-sidebar-left.jsp"></jsp:include> --%>
  <!-- end Fixed Sidebar Left -->

  <!-- Fixed Sidebar Right -->
  <%-- <jsp:include page="includes/fixed-sidebar-right.jsp"></jsp:include> --%>
  <!-- ... end Fixed Sidebar Right -->

  <!-- Header -->
  <%-- 테스트 로그인 ID로 Yegyeom Yu 보냄 --%>
  <jsp:include page="../includes/header.jsp">
    <jsp:param value="Yegyeom Yu" name="loginId" />
  </jsp:include>
  <!-- ... end Header -->
  <div class="header-spacer header-spacer-small"></div>


  <!-- Widget Weather -->

  <div class="container">
    <%-- 사이드 포함 row 시작 --%>
    <div class="row">
      <!-- Left Sidebar -->
      <aside class="col-xl-3 order-xl-1 col-lg-3 order-lg-1 col-md-3 order-md-1 col-sm-12 col-xs-12">
        <%-- 내 정보 위젯 --%>
        <jsp:include page="../widgets/profile-info.jsp"></jsp:include>
        <%-- 내 주식정보 위젯 --%>
        <jsp:include page="../widgets/twitter-feed.jsp"></jsp:include>
        <%-- 모의 투자 랭킹 위젯 --%>
        <jsp:include page="../widgets/ranking.jsp"></jsp:include>
      </aside>
      <!-- ... end Left Sidebar -->
      <%-- 사이드 제외 컨탠츠 열 시작 --%>
      
      
      <div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-9 order-md-2 col-sm-12 col-xs-12">
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-stats-arrow"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-little-delete"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-trophy-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-block-from-chat"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-weather-refresh-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-popup-left-arrow"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-popup-right-arrow"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-register-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-login-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-small-pin-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-small-calendar-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-post-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-like-post-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-accordion-open-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-comments-post-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-accordion-close-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-play-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-remove-playlist-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-save-playlist-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-heart-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-magnifying-glass-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-cupcake-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-weather-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-star-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-headphones-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-block-from-chat-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-add-to-conversation-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-speech-balloon-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-add-a-place-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-chat---messages-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-check-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-plus-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-albums-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-photos-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-day-calendar-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-week-calendar-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-month-calendar-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-checked-calendar-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-settings-v2-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-settings-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-blog-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-status-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-sticker-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-computer-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-manage-widgets-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-badge-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-newsfeed-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-camera-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-stats-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-calendar-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-happy-faces-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-three-dots-icon" style="height: 26px; width: 26px; display: inline-block;">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-thunder-icon"></use></svg>
        </a>
        <a href="#" class="more"><svg class="olymp-menu-icon">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-menu-icon"></use></svg>
        </a>
      </div>
      
      <%-- 사이드 제외 컨텐츠 열 끝 --%>
    </div>
    <%-- 사이드 포함 row 끝 --%>
  </div>

  <!-- ... end Widget Weather -->


  <!-- Window-popup-CHAT for responsive min-width: 768px -->
  <jsp:include page="../popup/popup-chat.jsp"></jsp:include>
  <!-- ... end Window-popup-CHAT for responsive min-width: 768px -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->

</body>
</html>