<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>MyPageFollow2</title>
  <jsp:include page="../includes/head.jsp"></jsp:include>

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
  



<!-- follow2 항목 start -->

		<div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">팔로워 목록</h6>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="birthday-item inline-items">
					<div class="author-thumb">
						<img src="../resources/img/avatar21-sm.jpg" alt="author">
					</div>
					<div class="birthday-author-name">
						<a href="#" class="h6 author-name">Rachel Howlett</a>
						<div class="birthday-date">February 4th, 1992</div>
					</div>
					<a href="20-CalendarAndEvents-MonthlyCalendar.html" class="btn btn-sm bg-blue">Create Event</a>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="birthday-item inline-items">
					<div class="author-thumb">
						<img src="../resources/img/avatar4-sm.jpg" alt="author">
					</div>
					<div class="birthday-author-name">
						<a href="#" class="h6 author-name">Chris Greyson</a>
						<div class="birthday-date">February 7th, 1988</div>
					</div>
					<a href="20-CalendarAndEvents-MonthlyCalendar.html" class="btn btn-sm bg-blue">Create Event</a>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="birthday-item inline-items">
					<div class="author-thumb">
						<img src="../resources/img/avatar22-sm.jpg" alt="author">
					</div>
					<div class="birthday-author-name">
						<a href="#" class="h6 author-name">Dave Marinara</a>
						<div class="birthday-date">February 12th, 1980</div>
					</div>
					<a href="20-CalendarAndEvents-MonthlyCalendar.html" class="btn btn-sm bg-blue">Create Event</a>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="birthday-item inline-items">
					<div class="author-thumb">
						<img src="../resources/img/avatar23-sm.jpg" alt="author">
					</div>
					<div class="birthday-author-name">
						<a href="#" class="h6 author-name">Jessica Stevens</a>
						<div class="birthday-date">February 18th, 1986</div>
					</div>
					<a href="20-CalendarAndEvents-MonthlyCalendar.html" class="btn btn-sm bg-blue">Create Event</a>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="birthday-item inline-items">
					<div class="author-thumb">
						<img src="../resources/img/avatar1-sm.jpg" alt="author">
					</div>
					<div class="birthday-author-name">
						<a href="#" class="h6 author-name">Mathilda Brinker</a>
						<div class="birthday-date">February 23rd, 1988</div>
					</div>
					<a href="20-CalendarAndEvents-MonthlyCalendar.html" class="btn btn-sm bg-blue">Create Event</a>
				</div>
			</div>
		</div>

		<div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="birthday-item inline-items">
					<div class="author-thumb">
						<img src="../resources/img/avatar2-sm.jpg" alt="author">
					</div>
					<div class="birthday-author-name">
						<a href="#" class="h6 author-name">Nicholas Grissom</a>
						<div class="birthday-date">February 27th, 1990</div>
					</div>
					<a href="20-CalendarAndEvents-MonthlyCalendar.html" class="btn btn-sm bg-blue">Create Event</a>
				</div>
			</div>
		</div>

    
<!-- follow2 항목 end -->




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
