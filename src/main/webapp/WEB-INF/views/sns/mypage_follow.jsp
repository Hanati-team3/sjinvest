<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>MyPageFollow</title>

  <!-- Required meta tags always come first -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">


  <!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="../resources/Bootstrap/dist/css/bootstrap-reboot.css">
  <link rel="stylesheet" type="text/css" href="../resources/Bootstrap/dist/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="../resources/Bootstrap/dist/css/bootstrap-grid.css">

  <!-- Theme Styles CSS -->
  <link rel="stylesheet" type="text/css" href="../resources/css/theme-styles.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/blocks.css">

  <!-- Main Font -->
  <script src="/resources/js/webfontloader.min.js"></script>
  <script>
    WebFont.load({
      google: {
        families: ['Roboto:300,400,500,700:latin']
      }
    });
  </script>

  <link rel="stylesheet" type="text/css" href="../resources/css/fonts.css">

  <!-- Styles for plugins -->
  <link rel="stylesheet" type="text/css" href="../resources/css/daterangepicker.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/jquery.mCustomScrollbar.min.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-select.css">


</head>
<body>


<!-- header start -->
<jsp:include page="../includes/header.jsp">
  <jsp:param value="Yegyeom Yu" name="loginId"/>
</jsp:include>
<!-- header end -->


<!-- mypage_profile start -->
<jsp:include page="../includes/mypage_profile.jsp"></jsp:include>
<!-- mypage_profile end -->


<!-- Your Account Personal Information -->

<div class="container">
  <div class="row">
  



<!-- follow 항목 start -->

<div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12">
      <div class="ui-block">
        <div class="ui-block-title">
          <h6 class="title">Friend Requests</h6>
          <a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="../resources/icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
        </div>

        <ul class="notification-list friend-requests">
          <li>
            <div class="author-thumb">
              <img src="/resources/img/avatar15-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <a href="#" class="h6 notification-friend">Tamara Romanoff</a>
              <span class="chat-message-item">Mutual Friend: Sarah Hetfield</span>
            </div>
            <span class="notification-icon">
              <a href="#" class="accept-request">
                <span class="icon-add">
                  <svg class="olymp-happy-face-icon"><use xlink:href="../resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                </span>
                Accept Friend Request
              </a>

              <a href="#" class="accept-request request-del">
                <span class="icon-minus">
                  <svg class="olymp-happy-face-icon"><use xlink:href="../resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                </span>
              </a>

            </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="../resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
              <svg class="olymp-little-delete"><use xlink:href="../resources/icons/icons.svg#olymp-little-delete"></use></svg>
            </div>
          </li>

          <li>
            <div class="author-thumb">
              <img src="/resources/img/avatar16-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              <a href="#" class="h6 notification-friend">Tony Stevens</a>
              <span class="chat-message-item">4 Friends in Common</span>
            </div>
            <span class="notification-icon">
              <a href="#" class="accept-request">
                <span class="icon-add">
                  <svg class="olymp-happy-face-icon"><use xlink:href="../resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                </span>
                Accept Friend Request
              </a>

              <a href="#" class="accept-request request-del">
                <span class="icon-minus">
                  <svg class="olymp-happy-face-icon"><use xlink:href="../resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
                </span>
              </a>

            </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="../resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
              <svg class="olymp-little-delete"><use xlink:href="../resources/icons/icons.svg#olymp-little-delete"></use></svg>
            </div>
          </li>

          <li class="accepted">
            <div class="author-thumb">
              <img src="/resources/img/avatar17-sm.jpg" alt="author">
            </div>
            <div class="notification-event">
              You and <a href="#" class="h6 notification-friend">Mary Jane Stark</a> just became friends. Write on <a href="#" class="notification-link">his wall</a>.
            </div>
            <span class="notification-icon">
              <svg class="olymp-happy-face-icon"><use xlink:href="../resources/icons/icons.svg#olymp-happy-face-icon"></use></svg>
            </span>

            <div class="more">
              <svg class="olymp-three-dots-icon"><use xlink:href="../resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
              <svg class="olymp-little-delete"><use xlink:href="../resources/icons/icons.svg#olymp-little-delete"></use></svg>
            </div>
          </li>

      </div>
    </div>

    
<!-- follow 항목 end -->




    <!-- mypage leftside start -->
    <jsp:include page="../includes/mypage_leftside.jsp"></jsp:include>
    <!-- mypage leftside end -->
    
    
  </div>
</div>


    <!-- javascript 추가항목 start -->
    <jsp:include page="../includes/bottom.jsp"></jsp:include>
    <!-- javascript 추가항목 start --> 
    




</body>
</html>
