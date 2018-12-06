<%@ page contentType="text/html; charset=utf-8" %>

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
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/css/jquery-ui.min.css">


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

/* 전체적용 */

.header--standard-dark .header-a-padding{
  padding: 10px 30px;
}

.forums-table a {
}

.forums-table .fa, .far, .fas{
  font-size: 15px;
}

.minus {
  color : blue;
}
.plus {
  color : #ff5e3a;
}

/* 주식 전체 적용 */
.stock .realtime{
  margin-top: 10px;
}

/*주식 index*/
.stock-index-ul {
  text-align: center; 
  font-weight: bold; 
}

.stock-index-ul li {
  width: 16.66%;
}

.stock-index-ul li :hover {
    color: #ff5e3a;
}

.stock-index-news .h6 {
  min-width: 100px;
}

.stock-index-news .notification-list li {
  padding: 15px 25px;
}

.stock-index-news .notification-list li .news-title{
    color: #515365;
}

.stock-index-tab .tab-content .ui-block {
  border : none;
}

.stock-index-tab .tab-content .ui-block-title {
  border : none;
  margin-top : 2px;
}

.stock-my-interest .statistics-slide .company-name {
    font-size: 20px;
    color: #515365;
    margin-bottom: 0px;

}
.stock-my-interest .statistics-slide .company-stock {
    font-size: 40px;
}

.stock-index-trend .chart-js-pie-color {
  margin-top: 60px; 
}

.stock-index-main .h6{
}


/*검색 목록*/
.stock-search-main .forums-table .text{
  font-size: 10px;
}

.stock-search-main .forums-table th{
  padding : 15px 5px;
}
.stock-search-main .forums-table td{
  padding : 15px 5px;
}

.stock-search-main .forums-table .company-number{
  width : 100px;
}

.stock-search-main .forums-table tbody .company-name{
  text-align: left;
}

.stock-search-main .forums-table .stock-price{
  width : 100px;
}
.stock-search-main .forums-table .trading-amount{
  width : 100px;
}
.stock-search-main .forums-table .day-before{
  width : 100px;
}
.stock-search-main .forums-table .day-before-rate{
  width : 100px;
}
.stock-search-main .forums-table .add-to-interest{
  width : 100px;
}

/*회사 상세*/
.stock-company-main .statistics-slide .company-name {
    font-size: 40px;
    color: #515365;
    margin-bottom: 0px;

}
.stock-company-main .statistics-slide .company-stock {
    font-size: 30px;
    color: #ff5e3a;
}

.stock-company-main .company-main-card .company-name {
    font-size: 40px;
    color: #515365;
    margin-bottom: 0px;
    text-align: center;
    font-weight: nomal;

}
.stock-company-main .company-main-card .company-stock {
    font-size: 30px;
    color: #ff5e3a;
    text-align: center;
    font-weight: nomal;
    margin-bottom: 20px;
}
.stock-company-main .company-main-card-sub .ui-block {
  border:none;
}

.post-control-button .bg-interest {
    background-color: #f9708d;
}

.company-main-card .btn-md-2 {
  margin : 0 auto;
}

.company-info-card table {
  width : 80%;
  margin-left : 13%;
}
.company-info-card table a{
  float: left;
}
.company-info-card table tr{
  height: 70px;
}
.company-info-card table .stat{
  float: left;
}
.company-info-card table .figure{
  font-size: 20px;
  font-weight: bold;
  color : #515365;
}

.stock-company-main .check-point-card .count-stat {
  font-size : 45px;
}
.stock-company-main .small {
  font-size : 11px;
}
.stock-company-main .company-today-table {
}
.stock-company-main .company-today-table thead th{
  padding : 5px 5px;
}
.stock-company-main .company-today-table td{
  padding : 5px 5px;
}
.stock-company-main .monthly-indicator-wrap .monthly-indicator{
  width:155px;
}

/*관심종목*/
.stock-interest-main .forums-table .text{
  font-size: 10px;
}

.stock-interest-main .forums-table th{
  padding : 15px 5px;
}
.stock-interest-main .forums-table td{
  padding : 15px 5px;
}

.stock-interest-main .forums-table .company-number{
  width : 100px;
}

.stock-interest-main .forums-table tbody .company-name{
  text-align: left;
}

.stock-interest-main .forums-table .stock-price{
  width : 100px;
}
.stock-interest-main .forums-table .trading-amount{
  width : 100px;
}
.stock-interest-main .forums-table .day-before{
  width : 100px;
}
.stock-interest-main .forums-table .day-before-rate{
  width : 100px;
}
.stock-interest-main .forums-table .add-to-interest{
  width : 100px;
}


/* 거래목록 */
.stock-trade-list-main .forums-table .text{
  font-size: 10px;
}

.stock-trade-list-main .forums-table th{
  padding : 15px 5px;
}
.stock-trade-list-main .forums-table td{
  padding : 15px 5px;
}

.stock-trade-list-main .forums-table .trade-date{
  width : 100px;
}

.stock-trade-list-main .forums-table .trade-type{
  width : 60px;
}

.stock-trade-list-main .forums-table .company-number{
  width : 90px;
}

.stock-trade-list-main .forums-table tbody .company-name{
  text-align: left;
}

.stock-trade-list-main .forums-table .stock-price{
  width : 100px;
}
.stock-trade-list-main .forums-table .stock-amount{
  width : 90px;
}
.stock-trade-list-main .forums-table .trade-amount{
  width : 100px;
}
.stock-trade-list-main .forums-table .profit-rate{
  width : 100px;
}



/* 보유자산 */
.stock-holding-main .forums-table .text{
  font-size: 10px;
}

.stock-holding-mainn .forums-table th{
  padding : 15px 5px;
}
.stock-holding-main .forums-table td{
  padding : 15px 5px;
}

.stock-holding-main .forums-table .company-number{
  width : 100px;
}

.stock-holding-main .forums-table tbody .company-name{
  text-align: left;
}

.stock-holding-main .forums-table .stock-price{
  width : 100px;
}
.stock-holding-main .forums-table .holding-amount{
  width : 90px;
}
.stock-holding-main .forums-table .holding-total-money{
  width : 100px;
}
.stock-holding-main .forums-table .profit-rate{
  width : 100px;
}
.stock-holding-main .forums-table .holding-sell{
  width : 100px;
}


.wow thead th{
  padding: 0px 0px;
  padding-top: 10px;
  padding-bottom: 10px;
}

.wow td{
  padding: 0px 0px;
  padding-top: 20px;
  padding-bottom: 20px;
}

</style>

