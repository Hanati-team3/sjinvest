<%@ page contentType="text/html; charset=utf-8" %>

<!-- signup page start -->

<div class="modal fade" id="signup_modal" >
	<div class="modal-dialog ui-block window-popup fav-page-popup">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
			<svg class="olymp-close-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
		</a>

		<div class="ui-block-title">
			<h6 class="title">회원가입</h6>
		</div>

		<div class="ui-block-content">
        <div style="text-align:right">필수항목(*)</div>
			<form action=/sos/user/regist method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-group label-floating">
							<label class="control-label">아이디<sup>*</sup></label>
							<input class="form-control" name="userId" placeholder="" type="text" value="">
						</div>
					</div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-group label-floating">
							<label class="control-label">닉네임<sup>*</sup></label>
							<input class="form-control" name="userNickname" placeholder="" type="text" value="">
						</div>

						<div class="form-group label-floating">
							<label class="control-label">이메일<sup>*</sup></label>
							<input placeholder="e.g.hana@kosta.co.kr" name="userEmail" type="email" value="">
						</div>

                        <div class="form-group label-floating">
                            <label class="control-label">비밀번호<sup>*</sup></label>
                            <input class="form-control" name="userPw" placeholder="" type="password" value="">
                        </div>
            
						<div class="form-group label-floating">
							<label class="control-label">자기소개</label>
							<textarea class="form-control" name="userDetail" placeholder=""></textarea>
						</div>

						<button class="btn btn-primary btn-lg full-width" type="submit">가입하기</button>
					</div>


				</div>

			</form>
		</div>

	</div>
</div>

<!-- ... signup page end -->


