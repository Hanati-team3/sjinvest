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

		<div class="ui-block-content">
			<form method="post" id="myform"> <!-- id="myform" -->
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
						  <a href="#" class="forgot" data-toggle="modal" data-target="#sign_modal">아직 회원이 아니신가요?</a>
					    </div>
                    
                        <button type="submit" class="btn btn-primary btn-lg full-width" >로그인</button>
                        <!-- form으로 제출하기 때문에 클릭 사용 onclick="loginCheck()" -->
                        <div class="or"></div>

                        
                        <!-- 네이버, 구글 로그인 start -->
                        <a href="#" class="btn btn-lg bg-facebook full-width btn-icon-left"><i class="fa fa-facebook" aria-hidden="true"></i>login with facebook</a>
                        <a href="#" class="btn btn-lg bg-twitter full-width btn-icon-left"><i class="fa fa-twitter" aria-hidden="true"></i>login with twitter</a>

                        <%-- <jsp:include page="naverLogin.jsp"></jsp:include> --%>
                        <!-- 네이버, 구글 로그인 end -->                        

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

