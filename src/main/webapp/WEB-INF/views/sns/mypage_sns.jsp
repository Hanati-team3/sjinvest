<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>MyPageSNS</title>
<jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>


  <!-- header start -->
  <jsp:include page="../includes/header.jsp">
    <jsp:param value="Yegyeom Yu" name="loginId" />
  </jsp:include>
  <!-- header end -->


  <!-- mypage_profile start -->
  <jsp:include page="../includes/mypage_profile.jsp"></jsp:include>
  <!-- mypage_profile end -->


  <div class="container">
    <div class="row">


        <!-- sns setting start -->


		<div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">SNS설정</h6>
				</div>
				<div class="ui-block-content">
					<form>
						<div class="row">

                            <!-- 
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="form-group label-floating is-select">
									<label class="control-label">Who Can Friend You?</label>
									<select class="selectpicker form-control" size="auto">
										<option value="EO">Everyone</option>
										<option value="NO">No One</option>
									</select>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="form-group label-floating is-select">
									<label class="control-label">Who Can View Your Posts</label>
									<select class="selectpicker form-control" size="auto">
										<option value="US">Friends Only</option>
										<option value="EO">Everyone</option>
									</select>
								</div>
							</div>
                             -->

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">팔로잉글</div>
										<p>자신이 팔로잉하는 유저의 글을 알림으로 받습니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" checked="">
										</label>
									</div>
								</div>
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">매매체결</div>
										<p>자신의 주식이 매매체결시 알림으로 받습니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" checked="">
										</label>
									</div>
								</div>
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">공개설정</div>
										<p>자신의 프로필 공개여부를 설정합니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" checked="">
										</label>
									</div>
								</div>
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">뉴스피드 방식</div>
										<p>팔로잉하는 유저의 뉴스피드만 알림으로 받습니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" >
										</label>
									</div>
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<button class="btn btn-secondary btn-lg full-width">되돌리기</button>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<button class="btn btn-primary btn-lg full-width">저장하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		

        <!-- sns setting end -->



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
