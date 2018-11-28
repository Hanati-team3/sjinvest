<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>login</title>
    <jsp:include page="../includes/head.jsp"></jsp:include>

</head>

<body class="overlay-enable modal-open">


<!-- login page start -->

<div class="modal fade show" id="fav-page-popup" style="display:block;">
	<div class="modal-dialog ui-block window-popup fav-page-popup">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
			<svg class="olymp-close-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
		</a>

		<div class="ui-block-title">
			<h6 class="title">회원로그인</h6>
		</div>

		<div class="ui-block-content">
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
                            <label class="control-label">비밀번호<sup>*</sup></label>
                            <input class="form-control" placeholder="" type="password" value="">
                        </div>
                    
                    <div>
                      <input type="checkbox" value="check" id="check" style="width: 3%; display: inline;">
                      <label for="check">아이디 저장</label>
                    </div>
                    
                    
                        <div style="margin-top: 20px; margin-bottom: 20px;">
                            <a href="/signup" style="color: grey; float: right; ">아직 회원이 아니신가요?</a>
                        </div>
						
                        <button class="btn btn-primary btn-lg full-width">로그인</button>
                        
                        <hr>

                        
                        <!-- 네이버, 구글 로그인 start -->

                        <jsp:include page="naverLogin.jsp"></jsp:include>
                        <!-- 네이버, 구글 로그인 end -->                        

                        </div>
                    </div>

             </form>
		 </div>
    </div>
</div>


<!-- ... login page end -->


    <!-- javascript 추가항목 start -->
    <jsp:include page="../includes/bottom.jsp"></jsp:include>
    <!-- javascript 추가항목 start --> 



</body>
</html>