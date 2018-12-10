<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<title>Profile Page</title>
<jsp:include page="../includes/head.jsp"></jsp:include>

</head>
<body>

<div class="fixed-sidebar right fixed-sidebar-responsive">

	<div class="fixed-sidebar-right sidebar--small" id="sidebar-right-responsive">

		<a href="#" class="olympus-chat inline-items js-chat-open">
			<svg class="olymp-chat---messages-icon"><use xlink:href="icons/icons.svg#olymp-chat---messages-icon"></use></svg>
		</a>

	</div>

</div>

<!-- ... end Fixed Sidebar Right -->


  <!-- header start -->
  <jsp:include page="../includes/header.jsp" />
  <!-- header end -->



<div class="header-spacer"></div>


<!-- Top Header -->

<div class="container">
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="top-header">
					<div class="top-header-thumb">
						<img src="<%=application.getContextPath()%>/resources/img/top-header1.jpg" alt="nature">
					</div>
					<div class="profile-section">
						<div class="row">
							<div class="col-lg-5 col-md-5 ">
								<ul class="profile-menu">
									<li>
										<a href="#" class="active">Timeline</a>
									</li>

									<li>
										<a href="#">Friends</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-5 ml-auto col-md-5">
								<ul class="profile-menu">
									<li>
										<a href="#">Photos</a>
									</li>
									<li>
										<a href="#">Videos</a>
									</li>

								</ul>
							</div>
						</div>


					</div>
					<div class="top-header-author">
						<a href="#" class="author-thumb">
							<img src="<%=application.getContextPath()%>/resources/img/author-main1.jpg" alt="author">
						</a>
						<div class="author-content">
							<a href="#" class="h4 author-name">${user.userNickname }</a>
							<div class="country">${user.userEmail }</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ... end Top Header -->



<div class="container">
	<div class="row">

		<!-- Main Content -->

		<div class="col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-xs-12">
			<div id="newsfeed-items-grid">

				<div class="ui-block">
					<article class="hentry post">

						<div class="post__author author vcard inline-items">
							<img src="<%=application.getContextPath()%>/resources/img/author-page.jpg" alt="author">

							<div class="author-date">
								<a class="h6 post__author-name fn" href="02-ProfilePage.html">James Spiegel</a>
								<div class="post__date">
									<time class="published" datetime="2017-03-24T18:18">
										19 hours ago
									</time>
								</div>
							</div>

							<div class="more"><svg class="olymp-three-dots-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
								<ul class="more-dropdown">
									<li>
										<a href="#">Edit Post</a>
									</li>
									<li>
										<a href="#">Delete Post</a>
									</li>

								</ul>
							</div>

						</div>

						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
							pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
							mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem
							accusantium doloremque.
						</p>

						<div class="post-additional-info inline-items">

							<a href="#" class="post-add-icon inline-items">
								<svg class="olymp-heart-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-heart-icon"></use></svg>
								<span>8</span>
							</a>

							<div class="comments-shared">
								<a href="#" class="post-add-icon inline-items">
									<svg class="olymp-speech-balloon-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-speech-balloon-icon"></use></svg>
									<span>17</span>
								</a>

								<a href="#" class="post-add-icon inline-items">
									<svg class="olymp-share-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>
									<span>24</span>
								</a>
							</div>


						</div>

						<div class="control-block-button post-control-button">

							<a href="#" class="btn btn-control">
								<svg class="olymp-like-post-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-like-post-icon"></use></svg>
							</a>

							<a href="#" class="btn btn-control">
								<svg class="olymp-comments-post-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-comments-post-icon"></use></svg>
							</a>

							<a href="#" class="btn btn-control">
								<svg class="olymp-share-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>
							</a>

						</div>

					</article>
				</div>


			</div>
		</div>

		<!-- ... end Main Content -->


		<!-- Left Sidebar -->
		<div class="col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">나의 프로필영역</h6>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-personal-info item-block">
						<li>
							<span class="title">About Me:</span>
							<span class="text">Hi, I’m James, I’m 36 and I work as a Digital Designer for the  “Daydreams” Agency in Pier 56.</span>
						</li>
						<li>
							<span class="title">Favourite TV Shows:</span>
							<span class="text">Breaking Good, RedDevil, People of Interest, The Running Dead, Found,  American Guy.</span>
						</li>
						<li>
							<span class="title">Favourite Music Bands / Artists:</span>
							<span class="text">Iron Maid, DC/AC, Megablow, The Ill, Kung Fighters, System of a Revenge.</span>
						</li>
					</ul>


				</div>
			</div>
		</div>
		<!-- ... end Left Sidebar -->


		<!-- Right Sidebar -->

		<div class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">머넣지?</h6>
				</div>
				<ul class="widget w-blog-posts">
					<li>
						<article class="hentry post">

							<a href="#" class="h4">My Perfect Vacations in South America and Europe</a>

							<p>Lorem ipsum dolor sit amet, consect adipisicing elit, sed do eiusmod por incidid ut labore et.</p>

							<div class="post__date">
								<time class="published" datetime="2017-03-24T18:18">
									7 hours ago
								</time>
							</div>

						</article>
					</li>
					<li>
						<article class="hentry post">

							<a href="#" class="h4">The Big Experience of Travelling Alone</a>

							<p>Lorem ipsum dolor sit amet, consect adipisicing elit, sed do eiusmod por incidid ut labore et.</p>

							<div class="post__date">
								<time class="published" datetime="2017-03-24T18:18">
									March 18th, at 6:52pm
								</time>
							</div>

						</article>
					</li>
				</ul>
			</div>
		</div>

		<!-- ... end Right Sidebar -->



	</div>
</div>



  <!-- Window-popup Update Header Photo -->
  <jsp:include page="../popup/upload-photo.jsp"></jsp:include>
  <!-- ... end Window-popup Update Header Photo -->

  <!-- Window-popup Choose from my Photo -->
  <jsp:include page="../popup/choose-from-my-photo.jsp"></jsp:include>
  <!-- ... end Window-popup Choose from my Photo -->

  <!-- Include js -->
  <jsp:include page="../includes/bottom.jsp"></jsp:include>
  <!-- End Include js -->
  
  <!-- user modal start-->
  <jsp:include page="../popup/user_profile.jsp"></jsp:include>
  <!-- ... end user modal -->
  
  <!-- user data start-->
  <jsp:include page="../popup/user_data.jsp"></jsp:include>
  <!-- ... end user data -->


</body>
</html>