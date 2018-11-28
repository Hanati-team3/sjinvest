<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%-- HEAD JSP FILE
     모든 페이지의 head 태그 안에 인클루드되어야 하는 head.jsp 파일
 --%>

<!-- Required meta tags always come first -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Main Font -->
  <script src="<%=application.getContextPath()%>/resources/js/webfontloader.min.js"></script>
  <script>
      WebFont.load({
          google: {
              families: ['Roboto:300,400,500,700:latin',
            	  'Nanum Myeongjo', 'Nanum Gothic']
          }
      });
  </script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/Bootstrap/dist/css/bootstrap-reboot.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/Bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/Bootstrap/dist/css/bootstrap-grid.css">


<!-- Theme Styles CSS -->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/theme-styles.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/blocks.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/fonts.css">


<!-- Styles for plugins -->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/mediaelement-playlist-plugin.min.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/mediaelementplayer.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/bootstrap-select.css">
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/daterangepicker.css">


<!-- Lightbox popup script-->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/magnific-popup.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>
.stock-index-ul {
  text-align: center; 
  font-weight: bold; 
  font-family: 'Nanum Myeongjo', sans-serif;
}

.stock-index-ul li {
  width: 16.66%;
}

.stock-index-ul li :hover {
    color: #ff5e3a;
}

.header--standard-dark .header-menu .header-a-padding{
  padding: 20px 30px;
}

.stock-index-news .h6 {
  font-family: 'Nanum Myeongjo', sans-serif;
  min-width: 100px;
}

.stock-index-news .notification-list li {
  padding: 15px 25px;
}

.stock-index-tab .tab-content .ui-block {
  border : none;
}

.stock-index-tab .tab-content .ui-block-title {
  border : none;
  margin-top : 2px;
}

.stock-my-interests .statistics-slide .company-name {
    font-size: 20px;
    color: #515365;
    margin-bottom: 0px;

}
.stock-my-interests .statistics-slide .company-stock {
    font-size: 40px;
    color: #ff5e3a;
}

.stock-index-trend .chart-js-pie-color {
  margin-top: 60px; 
}

.stock-index-main {
  margin-top : 20px;
}

.stock-index-main .h6{
  margin-top : 20px;
    font-family: 'Nanum Myeongjo', sans-serif;
}
</style>

