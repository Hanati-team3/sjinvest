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

<!-- Lightbox popup script-->
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/magnific-popup.css">

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


</style>