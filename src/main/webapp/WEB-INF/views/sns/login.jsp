<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>login</title>

	<!-- Required meta tags always come first -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/Bootstrap/dist/css/bootstrap-reboot.css">
	<link rel="stylesheet" type="text/css" href="/resources/Bootstrap/dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="/resources/Bootstrap/dist/css/bootstrap-grid.css">

	<!-- Theme Styles CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/theme-styles.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/blocks.css">

	<!-- Main Font -->
	<script src="/resources/js/webfontloader.min.js"></script>
	<script>
		WebFont.load({
			google: {
				families: ['Roboto:300,400,500,700:latin']
			}
		});
	</script>

	<link rel="stylesheet" type="text/css" href="/resources/css/fonts.css">

	<!-- Styles for plugins -->
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap-select.css">

</head>

<body class="overlay-enable modal-open">


<!-- login page start -->

<div class="modal fade show" id="fav-page-popup" style="display:block;">
	<div class="modal-dialog ui-block window-popup fav-page-popup">
		<a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
			<svg class="olymp-close-icon"><use xlink:href="/resources/icons/icons.svg#olymp-close-icon"></use></svg>
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


                        <%@ include file="naverLogin.jsp" %>
                        <!-- 네이버, 구글 로그인 end -->                        
          



                        </div>
                        
                                                

                    </div>


				</div>

			</form>
		</div>

	</div>
</div>

<!-- ... login page end -->



<!-- jQuery first, then Other JS. -->
<script src="/resources/js/jquery-3.2.0.min.js"></script>
<!-- Js effects for material design. + Tooltips -->
<script src="/resources/js/material.min.js"></script>
<!-- Helper scripts (Tabs, Equal height, Scrollbar, etc) -->
<script src="/resources/js/theme-plugins.js"></script>
<!-- Init functions -->
<script src="/resources/js/main.js"></script>

<!-- Select / Sorting script -->
<script src="/resources/js/selectize.min.js"></script>

<script src="/resources/js/mediaelement-and-player.min.js"></script>
<script src="/resources/js/mediaelement-playlist-plugin.min.js"></script>

</body>
</html>