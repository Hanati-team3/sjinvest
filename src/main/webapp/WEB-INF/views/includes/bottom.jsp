<%@ page contentType="text/html; charset=utf-8" %>

<!-- jQuery first, then Other JS. -->
<script src="<%=application.getContextPath()%>/resources/js/jquery-3.2.0.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/jquery-ui.min.js"></script>

<!-- Js effects for material design. + Tooltips -->
<script src="<%=application.getContextPath()%>/resources/js/material.min.js"></script>

<!-- Helper scripts (Tabs, Equal height, Scrollbar, etc) -->
<script src="<%=application.getContextPath()%>/resources/js/theme-plugins.js"></script>

<!-- Init functions -->
<script src="<%=application.getContextPath()%>/resources/js/main.js"></script>

<!-- Load more news AJAX script -->
<script src="<%=application.getContextPath()%>/resources/js/ajax-pagination.js"></script>

<!-- Select / Sorting script -->
<script src="<%=application.getContextPath()%>/resources/js/selectize.min.js"></script>

<!-- Datepicker input field script-->
<script src="<%=application.getContextPath()%>/resources/js/moment.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/daterangepicker.min.js"></script>

<!-- Widget with events script-->
<script src="<%=application.getContextPath()%>/resources/js/simplecalendar.js"></script>

<!-- Lightbox plugin script-->
<script src="<%=application.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>

<!-- Swiper / Sliders -->
<script src="<%=application.getContextPath()%>/resources/js/swiper.jquery.min.js"></script>

<!-- Chart JS Generate scripts-->
<script src="<%=application.getContextPath()%>/resources/js/Chart.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/chartjs-plugin-deferred.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/circle-progress.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/run-chart.js"></script>

<script src="<%=application.getContextPath()%>/resources/js/mediaelement-and-player.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/mediaelement-playlist-plugin.min.js"></script>


<!-- SnackBar script -->
<script src="<%=application.getContextPath()%>/resources/SnackBar/dist/snackbar.min.js"></script> 

<!-- my scripts -->
<script src="<%=application.getContextPath()%>/resources/js/stock-common/stock-common.js"></script>

<script type="text/javascript">
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
	
</script>

