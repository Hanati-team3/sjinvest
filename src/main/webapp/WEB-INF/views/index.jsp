<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
    ================================================== -->
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SOS - 모의주식</title>
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="/sos/resources/index/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/sos/resources/index/css/font-awesome.css">

<!-- Slider
    ================================================== -->
<link href="/sos/resources/index/css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="/sos/resources/index/css/owl.theme.css" rel="stylesheet" media="screen">
<link href="/sos/resources/index/css/animate.css" rel="stylesheet" media="screen">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="/sos/resources/index/style.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#home-banner:before{
	background-color: aliceblue;
}
#home-banner h1, #home-banner h1 span, #home-banner span {
	color: red;
}

.arrow{
	color: darkslategrey;
}

.on{
	background-color: #3f4257 !important;
}
#bottom-footer{
	background-color: #3f4257;
}
#about-us-block{
	padding-top: 100px;
	padding-bottom: 0px;
}
#testimonials-block{
	padding: 25px 0;
}
#testimonial .item img{
	width: 400px;
	height: 400px;

}

</style>
</head>

<body>
<!-- Navigation
    ==========================================-->
<nav id="top-menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="/sos/"><img src="/sos/resources/img/sos.png" width="95px" class="img-responsive"><span>S.O.S</span></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
   
      <!--nav icon--> 
      <a id="nav-icon"> <span></span> <span></span> <span></span> </a> 
      <!--nav icon end-->
      
      <ul id="nav-top" class="nav navbar-nav navbar-right">
        <li><a href="/sos/sns/newsfeed" class="page-scroll">SNS 하러 가기</a></li>
        <li><a href="/sos/stock/index" class="page-scroll">모의 주식 하러 가기</a></li>
        <li><a href="#" class="page-scroll">회원가입</a></li>
        <li><a id="loginModal" href="#" class="page-scroll" data-toggle="modal" data-target="#login_modal">로그인</a></li>
      </ul>        
          <!--search form-->         
          <!-- <form method="get" action="/search" id="search">
            <input name="q" type="text" size="40" placeholder="Search..." />
          </form> -->
          <!--/search form--> 
          
           <nav class="bottom-nav">
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Privacy</a></li>
          </ul>
        </nav>
          
          <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<!-- banner Page
    ==========================================-->
<section id="home-banner" style="background-image: url(/sos/resources/index/img/mainChart.png);">
  <div class="content">
    <div class="container"  data-wow-duration="1s"> <span class="wow fadeIn">BY SJ</span> 
      <h1 class="wow fadeInUp" style="max-width: 750px;"><span>Sns</span> of <span>Stock</span></h1>
    </div>
  </div>
  <div class="arrow bounce"> <i class="fa fa-arrow-down fa-2x"></i> </div>
</section>

<!-- about us Page
    ==========================================-->
<section id="about-us-block">
  <div class="container">
    <div class="row"> 
      <!--section-title-->
      <div class="section-title text-center wow fadeInUp">
        <h2>About us</h2>
        <a href="/sos/stock/index">모의주식 시작하기</a>
        <p>주식이 어려운 그대를 위해 <span>"SJ Team"</span> 이 만든 S.O.S 입니다~~~</p>
      </div>
      <!--/section-title-->
      
    </div>
  </div>
</section>
<section id="testimonials-block" class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div id="testimonial" class="owl-carousel owl-theme">
          <div class="item"> <img src="/sos/resources/index/img/difficult.PNG">
            <h5>너무나 어려운 주식시장... (feat. 어려운 숫자 차트..)</h5>
            <p><strong>Dean Martin</strong> CEO Acme Inc.</p>
          </div>
          <div class="item"> <img src="/sos/resources/index/img/team/02.jpg">
            <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
            <p><strong>Rima Martin</strong> CEO Food Inc.</p>
          </div>
          <div class="item"> <img src="/sos/resources/index/img/team/03.jpg">
            <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
            <p><strong>Joe Martin</strong> CEO Chat Inc.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- contact us Page
    ==========================================-->
<section id="home-contact-block" style="background-color: #3f4257">
  <div class="container">
    <div class="row wow fadeInUp">
      <p>사람들과 소통하고 내 거래 주식 자랑해볼까요</p>
      <a href="/sos/sns/newsfeed">SNS 하러가기</a> </div>
  </div>
</section>

<!-- the process block
    ==========================================-->

<section id="process-block">
  <div class="container">
    <div class="row"> 
      <!--section-title-->
      <div class="section-title text-center wow fadeInUp">
        <h2>*사이트 이용방법*</h2>
      </div>
      <!--/section-title--> 
      <!--process tab-->
      <div> 
        <!--tab nav-->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#concept" data-toggle="tab"><i class="fa fa-star-o"></i>
                <h5>01. 주식 확인하고 거래해보자!</h5>
                </a>
            </li>
            <li><a href="#prototype" data-toggle="tab"><i class="fa fa-copy"></i>
                <h5>02. 관심종목으로 쉽게 알아보자</h5>
                </a>
            </li>
            <li><a href="#design" data-toggle="tab"><i class="fa fa-laptop"></i>
                <h5>03. 내가 한 거 자랑해보자</h5>
                </a>
            </li>
            <li><a href="#development" data-toggle="tab"><i class="fa fa-code"></i>
                <h5>04. 포인트로 쏠쏠하게 구매하자</h5>
                </a>
            </li>
        </ul>
        <!--/tab nav--> 
        <!--tab container-->
        <div class="tab-content"> 
          
          <!--tab nav item 1-->
          <div id="concept" class="tab-pane active"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="/sos/resources/index/img/tab-1.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>주식 어떤 것들이 있을까!!</h6>
              <p>주식과기업에 대한 정보들을 쉬운 것부터 알아보고 거래해봐요</p>
              </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 1--> 
          
          <!--tab nav item 2-->
          <div id="prototype" class="tab-pane"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="/sos/resources/index/img/03-screenshot.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>관심종목에 넣어두자</h6>
              <p>기업들 관심종목으로 선택해서 쉽게 확인하자</p>
              </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 2--> 
		  
           <!--tab nav item 3-->
          <div id="design" class="tab-pane"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="/sos/resources/index/img/02-screenshot.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>SNS 자랑해보기</h6>
              <p>친구와 주변 사람들에게 내가 잘한 것들 자랑하자!</p>
              </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 3-->     
		  
          <!--tab nav item 4-->
          <div id="development" class="tab-pane"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="/sos/resources/index/img/01-screenshot.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>포인트로 알뜰하게</h6>
              <p>거래 한 것들로 얻은 포인트로 커피 등 쿠폰 얻자!!  (수익률이 잘 안나와도 생기는 포인트!!)</p>
              </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 4--> 		  
        </div>
        <!--/tab container--> 
        
      </div>
      <!--\process tab--> 
      
    </div>
  </div>
</section>

<!-- Company counter section
    ==========================================-->
<section id="company-counter" style="background-image:url(/sos/resources/index/img/count-bg.jpg);">
  <div class="container">
    <div class="row text-center">
      <div class="col-md-12 wow fadeInDown">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-building-o"></i><span class="counter">1606</span>
            <p>기업</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-user"></i><span class="counter">23</span>
            <p>유저</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-folder-o"></i><span class="counter">234</span>
            <p>게시글 수</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-shopping-cart"></i><span class="counter">456</span>
            <p>거래량</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /Company counter section --> 


<!-- latest news block
    ==========================================-->

<section id="latest-news-block">
  <div class="container">
    <div class="row"> 
      <!--section-title-->
      <div class="section-title text-center wow fadeInUp">
        <h2>모의 주식 시작해볼까요!!</h2>
        <a href="sos/stock/index" style="margin-top: 50px;">모의 주식 하러가기</a>
        <a href="/sos/sns/newsfeed" style="margin-right:15px; margin-top:50px;">SNS 보러가기</a>
        </div>
      <!--/section-title--> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <a href="blog-post.html"><img src="/sos/resources/index/img/04-screenshot.jpg" alt="image 1"></a>
          <a href="blog-post.html"><h6>10 Incredible Quotes To Guide Your Life</h6></a>
           <a href="#">Web-design</a> , <a href="#">Front-end</a> </header></a>
      </article>
      <!--/home article --> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <img src="/sos/resources/index/img/02-screenshot.jpg" alt="image 1"> <a href="#">
          <h6>Responsive Website in 2017 – 
            Step by Step Guide</h6>
          </a> <a href="#">Web-design</a> </header>
      </article>
      <!--/home article --> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <img src="/sos/resources/index/img/03-screenshot.jpg" alt="image 1"> <a href="#">
          <h6>10 Incredible Quotes To Guide Your Life</h6>
          </a> <a href="#">Web-design</a> , <a href="#">Front-end</a> </header>
      </article>
      <!--/home article --> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <img src="/sos/resources/index/img/01-screenshot.jpg" alt="image 1"> <a href="#">
          <h6>HEADING 6 in use here</h6>
          </a> <a href="#">Web-design</a> </header>
      </article>
      <!--/home article --> 
      
    </div>
  </div>
</section>
<footer id="bottom-footer">
  <div class="container">
    <div class="row wow fadeInUp">
      <div class="col-md-4 col-sm-4 col-xs-12"> 
        <!--copyright-->
        <p class="copyright">© 2018 <a href="https://dcrazed.com/">SJ</a>. All rights reserved</p>
        <!--/copyright--> 
      </div>
      <!--bottom nav-->
      <div class="col-md-4 col-sm-4 col-xs-12">
        <nav class="bottom-nav">
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Pricing</a></li>
          </ul>
        </nav>
      </div>
      <!--/bottom nav--> 
      
      <!--Social Links-->
      <div class="col-md-4 col-sm-4 col-xs-12">
        <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
        </ul>
      </div>
      <!--/Social Links--> 
      
    </div>
  </div>
</footer>

  <!-- login modal start-->
  <jsp:include page="popup/login.jsp"></jsp:include>
  <!-- ... end login modal -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script type="text/javascript" src="/sos/resources/index/js/bootstrap.js"></script> 
<script type="text/javascript" src="/sos/resources/index/js/SmoothScroll.js"></script> 
<script type="text/javascript" src="/sos/resources/index/js/jquery.isotope.js"></script> 
<script src="/sos/resources/index/js/owl.carousel.js"></script> 
<script src="/sos/resources/index/js/jquery.waypoints.min.js"></script> 
<!-- Custom Javascripts
    ================================================== --> 
<script type="text/javascript" src="/sos/resources/index/js/main.js"></script> 
<script src="/sos/resources/index/js/wow.min.js"></script> 
<script>
    jQuery(document).ready(function( $ ) {
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    });
</script> 
<script>
new WOW().init();
$(document).ready( function() {
	snsList();
	stockList();
	
	$(document).ready( function() {
		
		
		$('#loginModal').on('click', function() {
			$.ajax({
			    url : '/sos/user/naverlogin',
			    type : 'get',
			    dataType: "json",
			    success : function(data) {
			    	console.log(data.url)
			    	$('#naverLoginA').attr('href',data.url);
			    	$('#login_modal').show();
			    },
			    error : function() {
			      alert("관리자에게 문의해주세요.");
			    }
			});
		});
	});

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
	    dataType:'json',
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
});

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
    dataType:'json',
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
</body>
</html>