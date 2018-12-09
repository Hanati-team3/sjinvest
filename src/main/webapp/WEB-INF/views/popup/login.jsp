<%@ page contentType="text/html; charset=utf-8" %>

<!-- login page start -->


<div class="modal fade" id="login_modal">
	<div class="modal-dialog ui-block window-popup fav-page-popup">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
		    <svg class="olymp-close-icon">
           <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
		</a>

		<div class="ui-block-title">
			<h6 class="title">회원로그인</h6>
		</div>

		<div class="ui-block-content" id="loginForm">
			<form method="post"> <!-- id="myform" -->
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-group label-floating">
							<label class="control-label">아이디<sup>*</sup></label>
							<input class="form-control" id="loginId" name="loginId" placeholder="" type="text" value="" required>
						</div>
					</div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form-group label-floating">
                            <label class="control-label">비밀번호<sup>*</sup></label>
                            <input class="form-control" id="loginPw" name="loginPw" placeholder="" type="password" value="" required>
                        </div>

 <!-- 로그인 실패시 Ajax 통신 후 text영역 -->
 <div style="color: red; text-align: center; margin-top: 10px; margin-bottom: 10px" id="checkMsg"></div>
                    
					    <div class="remember">
						  <div class="checkbox">
							<label>
							 <input name="optionsCheckboxes" type="checkbox" name="remember" id="rememeber">
							 아이디 저장
							 </label>
					   	  </div>
						  <a href="#" class="forgot" data-toggle="modal" data-target="#signup_modal">아직 회원이 아니신가요?</a>
					    </div>
                    
                        <button type="submit" class="btn btn-primary btn-lg full-width" >로그인</button>
                        <!-- form으로 제출하기 때문에 클릭 사용 onclick="loginCheck()" -->
                        <div class="or"></div>

                        <div class="row">
                          <!-- 네이버, 다음 로그인 start -->
                          <a style="width: 50%" id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=c7ab399d372865fa6d3eedac2f2b93a6&redirect_uri=http://localhost/sos/user/kakaologin&response_type=code">
                          	<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="88%" height="100%" style="margin-left: 10%;"/>
                          </a>
    						<a style="width: 50%" id="naverLoginA">
    							<img width="88%" height="100%" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" style="margin-right: 10%;"/>
    						</a>
                        <!-- 네이버, 다음 로그인 end -->
                        </div>                        
                    </div>
                </div>
             </form>
             
		 </div>
    </div>
</div>

<!-- ... login page end -->


  <!-- signup modal start -->
  <jsp:include page="../popup/signup.jsp"></jsp:include>
  <!-- ... end signup modal -->

