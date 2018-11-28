<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>signup</title>
    <jsp:include page="../includes/head.jsp"></jsp:include>

</head>

<body class="overlay-enable modal-open">


<!-- signup page start -->

<div class="modal fade show" id="fav-page-popup" style="display:block;">
	<div class="modal-dialog ui-block window-popup fav-page-popup">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
			<svg class="olymp-close-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
		</a>

		<div class="ui-block-title">
			<h6 class="title">회원가입</h6>
		</div>

		<div class="ui-block-content">
        <div style="text-align:right">필수항목(*)</div>
			<form>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-group label-floating">
							<label class="control-label">아이디<sup>*</sup></label>
							<input class="form-control" placeholder="" type="text" value="">
						</div>
					</div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-group label-floating">
							<label class="control-label">닉네임<sup>*</sup></label>
							<input class="form-control" placeholder="" type="text" value="">
						</div>

						<div class="form-group label-floating">
							<label class="control-label">이메일<sup>*</sup></label>
							<input placeholder="e.g.hana@kosta.co.kr" type="email" value="">
						</div>

                        <div class="form-group label-floating">
                            <label class="control-label">비밀번호<sup>*</sup></label>
                            <input class="form-control" placeholder="" type="password" value="">
                        </div>
            
						<div class="form-group label-floating">
							<label class="control-label">자기소개</label>
							<textarea class="form-control" placeholder=""></textarea>
						</div>

						<button class="btn btn-primary btn-lg full-width">가입하기</button>
					</div>


				</div>

			</form>
		</div>

	</div>
</div>

<!-- ... signup page end -->


    <!-- javascript 추가항목 start -->
    <jsp:include page="../includes/bottom.jsp"></jsp:include>
    <!-- javascript 추가항목 start --> 


</body>
</html>