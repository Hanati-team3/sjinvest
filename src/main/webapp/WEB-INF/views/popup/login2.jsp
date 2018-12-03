<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- 로그인 처리를 위한 ajax 통신 시도해보던 파일 -->

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

	var userId = $('#userId').val();
	var userPw = $('#userPw').val();

	$.ajax({
		url : '/sos/sns/login',
		type : 'post',
		data : {
			userId : userId,
			userPw : userPw,
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


</body>
</html>


