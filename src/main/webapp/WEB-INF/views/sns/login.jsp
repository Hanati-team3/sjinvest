<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>login</title>
    <jsp:include page="../includes/head.jsp"></jsp:include>
    
    
<script type="text/javascript">

/**  
 * 페이지 이동처리 방지를 위하여 시작시 실행
 */
$(document).ready( function() {
	$('#myform').submit(function (e) {
		e.preventDefault();
		loginCheck();
	})
});

/** 
 * 로그인 처리를 위한 Ajax 통신
 */
function loginCheck() {

	var id = $('#id').val();
	var pw = $('#pw').val();

	$.ajax({
		url : '/sos/sns/login',
		type : 'post',
		data : {
			id : id,
			pw : pw,
			login : 'login'
		},
		success : function(data) {
			if ($.trim(data) == "loginfail") {
				$('#checkMsg').html(
						"<p style='COLOR: red'>다시 로그인해주세요.</p>");
			} else{
				location.href="/sos/sns/newsfeed";				
			}
		},
		error : function() {
			alert("관리자에게 문의해주세요.");
		}
	});
	
} 

</script>

</head>

<body class="overlay-enable modal-open">


<!-- login page start -->

<div class="modal fade show" id="login_modal" tabindex="-1" role="dialog" aria-hidden="true" style="display:block;">
	<div class="modal-dialog ui-block window-popup fav-page-popup">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
			<svg class="olymp-close-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
		</a>

		<div class="ui-block-title">
			<h6 class="title">회원로그인</h6>
		</div>

		<div class="ui-block-content">
			<form method="post" id="myform">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="form-group label-floating">
							<label class="control-label">아이디<sup>*</sup></label>
							<input class="form-control" id="id" name="id" placeholder="" type="text" value="" required>
						</div>
					</div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="form-group label-floating">
                            <label class="control-label">비밀번호<sup>*</sup></label>
                            <input class="form-control" id="pw" name="pw" placeholder="" type="password" value="" required>
                        </div>

 <!-- 로그인 실패시 Ajax 통신 후 text영역 -->
 <div style="text-align: center; margin-top: 10px; margin-bottom: 10px" id="checkMsg"></div>
                    
					    <div class="remember">
						  <div class="checkbox">
							<label>
							 <input name="optionsCheckboxes" type="checkbox" name="remember" id="rememeber">
							 아이디 저장
							 </label>
					   	  </div>
						  <a href="<%=application.getContextPath()%>/sns/signup" class="forgot">아직 회원이 아니신가요?</a>
					    </div>
                    
                        <button type="submit" class="btn btn-primary btn-lg full-width" onclick="loginCheck()">로그인</button>
                        
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


    <!-- javascript 추가항목 start -->
    <jsp:include page="../includes/bottom.jsp"></jsp:include>
    <!-- javascript 추가항목 start --> 



</body>
</html>