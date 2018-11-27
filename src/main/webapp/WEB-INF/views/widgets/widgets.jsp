<!DOCTYPE html>
<html lang="en">
<head>

	<title>Components - Widgets</title>

	<!-- Required meta tags always come first -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">


	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="Bootstrap/dist/css/bootstrap-reboot.css">
	<link rel="stylesheet" type="text/css" href="Bootstrap/dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="Bootstrap/dist/css/bootstrap-grid.css">

	<!-- Theme Styles CSS -->
	<link rel="stylesheet" type="text/css" href="css/theme-styles.css">
	<link rel="stylesheet" type="text/css" href="css/blocks.css">

	<!-- Main Font -->
	<script src="js/webfontloader.min.js"></script>
	<script>
		WebFont.load({
			google: {
				families: ['Roboto:300,400,500,700:latin']
			}
		});
	</script>

	<link rel="stylesheet" type="text/css" href="css/fonts.css">
	<!-- Styles for plugins -->
	<link rel="stylesheet" type="text/css" href="css/simplecalendar.css">
	<link rel="stylesheet" type="text/css" href="css/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-select.css">
	<link rel="stylesheet" type="text/css" href="css/swiper.min.css">

</head>
<body>


<div class="container">
	<div class="row">
		<div class="col-xl-12">
			<h2 class="presentation-margin">Widgets</h2>
		</div>

		<div class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Profile Intro</h6>
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

					<div class="widget w-socials">
						<h6 class="title">Other Social Networks:</h6>
						<a href="#" class="social-item bg-facebook">
							<i class="fa fa-facebook" aria-hidden="true"></i>
							Facebook
						</a>
						<a href="#" class="social-item bg-twitter">
							<i class="fa fa-twitter" aria-hidden="true"></i>
							Twitter
						</a>
						<a href="#" class="social-item bg-dribbble">
							<i class="fa fa-dribbble" aria-hidden="true"></i>
							Dribbble
						</a>
					</div>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">James’s Badges</h6>
				</div>
				<div class="ui-block-content">

					<ul class="widget w-badges">
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge1.png" alt="author">
								<div class="label-avatar bg-primary">2</div>
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge4.png" alt="author">
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge3.png" alt="author">
								<div class="label-avatar bg-blue">4</div>
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge6.png" alt="author">
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge11.png" alt="author">
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge8.png" alt="author">
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge10.png" alt="author">
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge13.png" alt="author">
								<div class="label-avatar bg-breez">2</div>
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge7.png" alt="author">
							</a>
						</li>
						<li>
							<a href="24-CommunityBadges.html">
								<img src="img/badge12.png" alt="author">
							</a>
						</li>
					</ul>

				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">My Spotify Playlist</h6>
				</div>

				<ol class="widget w-playlist">
					<li>
						<div class="playlist-thumb">
							<img src="img/playlist6.jpg" alt="thumb-composition">
							<div class="overlay"></div>
							<a href="#" class="play-icon">
								<svg class="olymp-music-play-icon-big"><use xlink:href="icons/icons-music.svg#olymp-music-play-icon-big"></use></svg>
							</a>
						</div>

						<div class="composition">
							<a href="#" class="composition-name">The Past Starts Slow...</a>
							<a href="#" class="composition-author">System of a Revenge</a>
						</div>

						<div class="composition-time">
							<time class="published" datetime="2017-03-24T18:18">3:22</time>
							<div class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg>
								<ul class="more-dropdown">
									<li>
										<a href="#">Add Song to Player</a>
									</li>
									<li>
										<a href="#">Add Playlist to Player</a>
									</li>
								</ul>
							</div>
						</div>

					</li>

					<li>
						<div class="playlist-thumb">
							<img src="img/playlist7.jpg" alt="thumb-composition">
							<div class="overlay"></div>
							<a href="#" class="play-icon">
								<svg class="olymp-music-play-icon-big"><use xlink:href="icons/icons-music.svg#olymp-music-play-icon-big"></use></svg>
							</a>
						</div>

						<div class="composition">
							<a href="#" class="composition-name">The Pretender</a>
							<a href="#" class="composition-author">Kung Fighters</a>
						</div>

						<div class="composition-time">
							<time class="published" datetime="2017-03-24T18:18">5:48</time>
							<div class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg>
								<ul class="more-dropdown">
									<li>
										<a href="#">Add Song to Player</a>
									</li>
									<li>
										<a href="#">Add Playlist to Player</a>
									</li>
								</ul>
							</div>
						</div>

					</li>
					<li>
						<div class="playlist-thumb">
							<img src="img/playlist8.jpg" alt="thumb-composition">
							<div class="overlay"></div>
							<a href="#" class="play-icon">
								<svg class="olymp-music-play-icon-big"><use xlink:href="icons/icons-music.svg#olymp-music-play-icon-big"></use></svg>
							</a>
						</div>

						<div class="composition">
							<a href="#" class="composition-name">Blood Brothers</a>
							<a href="#" class="composition-author">Iron Maid</a>
						</div>

						<div class="composition-time">
							<time class="published" datetime="2017-03-24T18:18">3:06</time>
							<div class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg>
								<ul class="more-dropdown">
									<li>
										<a href="#">Add Song to Player</a>
									</li>
									<li>
										<a href="#">Add Playlist to Player</a>
									</li>
								</ul>
							</div>
						</div>

					</li>
					<li>
						<div class="playlist-thumb">
							<img src="img/playlist9.jpg" alt="thumb-composition">
							<div class="overlay"></div>
							<a href="#" class="play-icon">
								<svg class="olymp-music-play-icon-big"><use xlink:href="icons/icons-music.svg#olymp-music-play-icon-big"></use></svg>
							</a>
						</div>

						<div class="composition">
							<a href="#" class="composition-name">Seven Nation Army</a>
							<a href="#" class="composition-author">The Black Stripes</a>
						</div>

						<div class="composition-time">
							<time class="published" datetime="2017-03-24T18:18">6:17</time>
							<div class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg>
								<ul class="more-dropdown">
									<li>
										<a href="#">Add Song to Player</a>
									</li>
									<li>
										<a href="#">Add Playlist to Player</a>
									</li>
								</ul>
							</div>
						</div>

					</li>
					<li>
						<div class="playlist-thumb">
							<img src="img/playlist10.jpg" alt="thumb-composition">
							<div class="overlay"></div>
							<a href="#" class="play-icon">
								<svg class="olymp-music-play-icon-big"><use xlink:href="icons/icons-music.svg#olymp-music-play-icon-big"></use></svg>
							</a>
						</div>

						<div class="composition">
							<a href="#" class="composition-name">Killer Queen</a>
							<a href="#" class="composition-author">Archiduke</a>
						</div>

						<div class="composition-time">
							<time class="published" datetime="2017-03-24T18:18">5:40</time>
							<div class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg>
								<ul class="more-dropdown">
									<li>
										<a href="#">Add Song to Player</a>
									</li>
									<li>
										<a href="#">Add Playlist to Player</a>
									</li>
								</ul>
							</div>
						</div>

					</li>
				</ol>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Twitter Feed</h6>
				</div>

				<ul class="widget w-twitter">
					<li class="twitter-item">
						<div class="author-folder">
							<img src="img/twitter-avatar1.png" alt="avatar">
							<div class="author">
								<a href="#" class="author-name">Space Cowboy</a>
								<a href="#" class="group">@james_spiegelOK</a>
							</div>
						</div>
						<p>Tomorrow with the agency we will run 5 km for charity. Come and give us your support! <a href="#" class="link-post">#Daydream5K</a></p>
						<span class="post__date">
							<time class="published" datetime="2017-03-24T18:18">
								2 hours ago
							</time>
						</span>
					</li>
					<li class="twitter-item">
						<div class="author-folder">
							<img src="img/twitter-avatar1.png" alt="avatar">
							<div class="author">
								<a href="#" class="author-name">Space Cowboy</a>
								<a href="#" class="group">@james_spiegelOK</a>
							</div>
						</div>
						<p>Check out the new website of “The Bebop Bar”! <a href="#" class="link-post">bytle/thbp53f</a></p>
						<span class="post__date">
							<time class="published" datetime="2017-03-24T18:18">
								16 hours ago
							</time>
						</span>
					</li>
					<li class="twitter-item">
						<div class="author-folder">
							<img src="img/twitter-avatar1.png" alt="avatar">
							<div class="author">
								<a href="#" class="author-name">Space Cowboy</a>
								<a href="#" class="group">@james_spiegelOK</a>
							</div>
						</div>
						<p>The Sunday is the annual agency camping trip and I still haven’t got a tent  <a href="#" class="link-post">#TheWild #Indoors</a></p>
						<span class="post__date">
							<time class="published" datetime="2017-03-24T18:18">
								Yesterday
							</time>
						</span>
					</li>
				</ul>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Last Videos</h6>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-last-video">
						<li>
							<a href="https://vimeo.com/ondemand/viewfromabluemoon4k/147865858" class="play-video play-video--small">
								<svg class="olymp-play-icon"><use xlink:href="icons/icons.svg#olymp-play-icon"></use></svg>
							</a>
							<img src="img/video8.jpg" alt="video">
							<div class="video-content">
								<div class="title">System of a Revenge - Hypnotize...</div>
								<time class="published" datetime="2017-03-24T18:18">3:25</time>
							</div>
							<div class="overlay"></div>
						</li>
						<li>
							<a href="https://youtube.com/watch?v=excVFQ2TWig" class="play-video play-video--small">
								<svg class="olymp-play-icon"><use xlink:href="icons/icons.svg#olymp-play-icon"></use></svg>
							</a>
							<img src="img/video7.jpg" alt="video">
							<div class="video-content">
								<div class="title">Green Goo - Live at Dan’s Arena</div>
								<time class="published" datetime="2017-03-24T18:18">5:48</time>
							</div>
							<div class="overlay"></div>
						</li>
					</ul>
				</div>
			</div>

			<div class="ui-block">
				<div class="widget w-create-fav-page">
					<div class="icons-block">
						<svg class="olymp-star-icon left-menu-icon"  data-toggle="tooltip" data-placement="right"   data-original-title="FAV PAGE"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>

						<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
					</div>

					<div class="content">
						<span>Be like them and</span>
						<h3 class="title">Create your own Favourite Page!</h3>
						<a href="36-FavPage-SettingsAndCreatePopup.html" class="btn btn-bg-secondary btn-sm">Start Now!</a>
					</div>
				</div>
			</div>

		</div>
		<div class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Last Photos</h6>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-last-photo js-zoom-gallery">
						<li>
							<a href="img/last-photo10-large.jpg">
								<img src="img/last-photo10-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot11-large.jpg">
								<img src="img/last-phot11-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot12-large.jpg">
								<img src="img/last-phot12-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot13-large.jpg">
								<img src="img/last-phot13-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot14-large.jpg">
								<img src="img/last-phot14-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot15-large.jpg">
								<img src="img/last-phot15-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot16-large.jpg">
								<img src="img/last-phot16-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot17-large.jpg">
								<img src="img/last-phot17-large.jpg" alt="photo">
							</a>
						</li>
						<li>
							<a href="img/last-phot18-large.jpg">
								<img src="img/last-phot18-large.jpg" alt="photo">
							</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Blog Posts</h6>
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

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Friends (86)</h6>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-faved-page js-zoom-gallery">
						<li>
							<a href="#">
								<img src="img/avatar38-sm.jpg" alt="author">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar24-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar36-sm.jpg" alt="author">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar35-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar34-sm.jpg" alt="author">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar33-sm.jpg" alt="author">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar32-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar31-sm.jpg" alt="author">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar30-sm.jpg" alt="author">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar29-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar28-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar27-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar26-sm.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/avatar25-sm.jpg" alt="user">
							</a>
						</li>
						<li class="all-users">
							<a href="#">+74</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Favourite Pages</h6>
				</div>

				<ul class="widget w-friend-pages-added notification-list friend-requests">
					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar41-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">The Marina Bar</a>
							<span class="chat-message-item">Restaurant / Bar</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top"   data-original-title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar42-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Tapronus Rock</a>
							<span class="chat-message-item">Rock Band</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top"   data-original-title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar43-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Pixel Digital Design</a>
							<span class="chat-message-item">Company</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top"   data-original-title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar44-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Thompson’s Custom Clothing Boutique</a>
							<span class="chat-message-item">Clothing Store</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top"   data-original-title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar45-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Crimson Agency</a>
							<span class="chat-message-item">Company</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top"   data-original-title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar46-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Mannequin Angel</a>
							<span class="chat-message-item">Clothing Store</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top"   data-original-title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

				</ul>

			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">James's Poll</h6>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-pool">
						<li>
							<p>If you had to choose, which actor do you prefer to be the next Darkman? </p>
						</li>

						<li>
							<div class="skills-item">
								<div class="skills-item-info">
									<span class="skills-item-title">

										<span class="radio">
											<label>
												<input type="radio" name="optionsRadios">
											Thomas Bale
											</label>
										</span>
									</span>
									<span class="skills-item-count"><span class="count-animate" data-speed="1000" data-refresh-interval="50" data-to="62" data-from="0"></span><span class="units">62%</span></span>
								</div>
								<div class="skills-item-meter">
									<span class="skills-item-meter-active bg-primary" style="width: 62%"></span>
								</div>

								<div class="counter-friends">12 friends voted for this</div>

								<ul class="friends-harmonic">
									<li>
										<a href="#">
											<img src="img/friend-harmonic1.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic2.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic3.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic4.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic5.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic6.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic7.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic8.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic9.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#" class="all-users">+3</a>
									</li>
								</ul>

							</div>
						</li>

						<li>
							<div class="skills-item">
								<div class="skills-item-info">
									<span class="skills-item-title">

										<span class="radio">
											<label>
												<input type="radio" name="optionsRadios">
											Ben Robertson
											</label>
										</span>
									</span>
									<span class="skills-item-count"><span class="count-animate" data-speed="1000" data-refresh-interval="50" data-to="27" data-from="0"></span><span class="units">27%</span></span>
								</div>
								<div class="skills-item-meter">
									<span class="skills-item-meter-active bg-primary" style="width: 27%"></span>
								</div>
								<div class="counter-friends">7 friends voted for this</div>

								<ul class="friends-harmonic">
									<li>
										<a href="#">
											<img src="img/friend-harmonic7.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic8.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic9.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic10.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic11.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic12.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic13.jpg" alt="friend">
										</a>
									</li>
								</ul>
							</div>
						</li>

						<li>
							<div class="skills-item">
								<div class="skills-item-info">
									<span class="skills-item-title">
										<span class="radio">
											<label>
												<input type="radio" name="optionsRadios">
											Michael Streiton
											</label>
										</span>
									</span>
									<span class="skills-item-count"><span class="count-animate" data-speed="1000" data-refresh-interval="50" data-to="11" data-from="0"></span><span class="units">11%</span></span>
								</div>
								<div class="skills-item-meter">
									<span class="skills-item-meter-active bg-primary" style="width: 11%"></span>
								</div>

								<div class="counter-friends">2 people voted for this</div>

								<ul class="friends-harmonic">
									<li>
										<a href="#">
											<img src="img/friend-harmonic14.jpg" alt="friend">
										</a>
									</li>
									<li>
										<a href="#">
											<img src="img/friend-harmonic15.jpg" alt="friend">
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
					<a href="#" class="btn btn-md-2 btn-border-think custom-color c-grey full-width">Vote Now!</a>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Location</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>

				<div class="widget w-contacts">
					<!-- Google map -->

					<div class="section">
						<div id="map"></div>
						<script>
							var map;

							function initMap() {

								var myLatLng = {lat: -25.363, lng: 131.044};

								map = new google.maps.Map(document.getElementById('map'), {
									center: myLatLng,
									zoom: 14,
									scrollwheel: false//set to true to enable mouse scrolling while inside the map area
								});

								var marker = new google.maps.Marker({
									position: myLatLng,
									map: map,
									icon: {
										url: "img/marker-google.png",
										scaledSize: new google.maps.Size(50, 50)
									}

								});
							}


						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBESxStZOWN9aMvTdR3Nov66v6TXxpRZMM&callback=initMap"
								async defer></script>
					</div>

					<!-- End Google map -->

					<ul>
						<li>
							<span class="title">Address:</span>
							<span class="text">Fake Street 320, San Francisco California, USA.
							</span>
						</li>
						<li>
							<span class="title">Working Hours:</span>
							<span class="text">Mon-Fri 9:00am to 6:00pm
								Weekends 10:00am to 8:00pm
							</span>
						</li>
					</ul>
				</div>

			</div>
		</div>
		<aside class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">
			<div class="ui-block">
				<div class="widget w-wethear">
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>

					<div class="wethear-now inline-items">
						<div class="temperature-sensor">64°</div>
						<div class="max-min-temperature">
							<span>58°</span>
							<span>76°</span>
						</div>

						<svg class="olymp-weather-partly-sunny-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-partly-sunny-icon"></use></svg>
					</div>

					<div class="wethear-now-description">
						<div class="climate">Partly Sunny</div>
						<span>Real Feel: <span>67°</span></span>
						<span>Chance of Rain: <span>49%</span></span>
					</div>

					<ul class="weekly-forecast">

						<li>
							<div class="day">sun</div>
							<svg class="olymp-weather-sunny-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

							<div class="temperature-sensor-day">60°</div>
						</li>

						<li>
							<div class="day">mon</div>
							<svg class="olymp-weather-partly-sunny-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-partly-sunny-icon"></use></svg>
							<div class="temperature-sensor-day">58°</div>
						</li>

						<li>
							<div class="day">tue</div>
							<svg class="olymp-weather-cloudy-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

							<div class="temperature-sensor-day">67°</div>
						</li>

						<li>
							<div class="day">wed</div>
							<svg class="olymp-weather-rain-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>

							<div class="temperature-sensor-day">70°</div>
						</li>

						<li>
							<div class="day">thu</div>
							<svg class="olymp-weather-storm-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

							<div class="temperature-sensor-day">58°</div>
						</li>

						<li>
							<div class="day">fri</div>
							<svg class="olymp-weather-snow-icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

							<div class="temperature-sensor-day">68°</div>
						</li>

						<li>
							<div class="day">sat</div>

							<svg class="olymp-weather-wind-icon-header"><use xlink:href="icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

							<div class="temperature-sensor-day">65°</div>
						</li>

					</ul>

					<div class="date-and-place">
						<h5 class="date">Saturday, March 26th</h5>
						<div class="place">San Francisco, CA</div>
					</div>

				</div>
			</div>

			<div class="ui-block">
				<div class="calendar-container">
					<div class="calendar">
						<header>
							<h6 class="month">March 2017</h6>
							<a class="calendar-btn-prev fontawesome-angle-left" href="#"></a>
							<a class="calendar-btn-next fontawesome-angle-right" href="#"></a>
						</header>
						<table>
							<thead>
							<tr><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td><td>San</td></tr>
							</thead>
							<tbody>
							<tr>
								<td date-month="12" date-day="1">1</td>
								<td date-month="12" date-day="2" class="event-uncomplited event-complited">
									2
								</td>
								<td date-month="12" date-day="3">3</td>
								<td date-month="12" date-day="4">4</td>
								<td date-month="12" date-day="5">5</td>
								<td date-month="12" date-day="6">6</td>
								<td date-month="12" date-day="7">7</td>
							</tr>
							<tr>
								<td date-month="12" date-day="8">8</td>
								<td date-month="12" date-day="9">9</td>
								<td date-month="12" date-day="10" class="event-complited">10</td>
								<td date-month="12" date-day="11">11</td>
								<td date-month="12" date-day="12">12</td>
								<td date-month="12" date-day="13">13</td>
								<td date-month="12" date-day="14">14</td>
							</tr>
							<tr>
								<td date-month="12" date-day="15" class="event-complited-2">15</td>
								<td date-month="12" date-day="16">16</td>
								<td date-month="12" date-day="17">17</td>
								<td date-month="12" date-day="18">18</td>
								<td date-month="12" date-day="19">19</td>
								<td date-month="12" date-day="20">20</td>
								<td date-month="12" date-day="21">21</td>
							</tr>
							<tr>
								<td date-month="12" date-day="22">22</td>
								<td date-month="12" date-day="23">23</td>
								<td date-month="12" date-day="24">24</td>
								<td date-month="12" date-day="25">25</td>
								<td date-month="12" date-day="26">26</td>
								<td date-month="12" date-day="27">27</td>
								<td date-month="12" date-day="28" class="event-uncomplited">28</td>
							</tr>
							<tr>
								<td date-month="12" date-day="29">29</td>
								<td date-month="12" date-day="30">30</td>
								<td date-month="12" date-day="31">31</td>
							</tr>
							</tbody>
						</table>
						<div class="list">


							<div id="accordion-1" role="tablist" aria-multiselectable="true" class="day-event" date-month="12" date-day="2">
								<div class="ui-block-title ui-block-title-small">
									<h6 class="title">TODAY’S EVENTS</h6>
								</div>
								<div class="card">
									<div class="card-header" role="tab" id="headingOne-1">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">9:00am</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne-1" aria-expanded="true" aria-controls="collapseOne-1">
												Breakfast at the Agency<svg class="olymp-dropdown-arrow-icon"><use xlink:href="icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
											</a>
										</h5>
									</div>

									<div id="collapseOne-1" class="collapse" role="tabpanel" >
										<div class="card-body">
											Hi Guys! I propose to go a litle earlier at the agency to have breakfast and talk a little more about the new design project we have been working on. Cheers!
										</div>
										<div class="place inline-items">
											<svg class="olymp-add-a-place-icon"><use xlink:href="icons/icons.svg#olymp-add-a-place-icon"></use></svg>
											<span>Daydreamz Agency</span>
										</div>

										<ul class="friends-harmonic inline-items">
											<li>
												<a href="#">
													<img src="img/friend-harmonic5.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic10.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic7.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic8.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic2.jpg" alt="friend">
												</a>
											</li>
											<li class="with-text">
												Will Assist
											</li>
										</ul>
									</div>


								</div>

								<div class="card">
									<div class="card-header" role="tab" id="headingTwo-1">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">9:00am</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo-1" aria-expanded="true" aria-controls="collapseTwo-1">
												Send the new “Olympus” project files to the Agency<svg class="olymp-dropdown-arrow-icon"><use xlink:href="icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
											</a>
										</h5>
									</div>

									<div id="collapseTwo-1" class="collapse" role="tabpanel">
										<div class="card-body">
											Hi Guys! I propose to go a litle earlier at the agency to have breakfast and talk a little more about the new design project we have been working on. Cheers!
										</div>
									</div>

								</div>

								<div class="card">
									<div class="card-header" role="tab" id="headingThree-1">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">6:30am</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="false">
												Take Querty to the Veterinarian
											</a>
										</h5>
									</div>
									<div class="place inline-items">
										<svg class="olymp-add-a-place-icon"><use xlink:href="icons/icons.svg#olymp-add-a-place-icon"></use></svg>
										<span>Daydreamz Agency</span>
									</div>
								</div>

								<a href="#" class="check-all">Check all your Events</a>
							</div>

							<div id="accordion-2" role="tablist" aria-multiselectable="true" class="day-event" date-month="12" date-day="10">
								<div class="ui-block-title ui-block-title-small">
									<h6 class="title">TODAY’S EVENTS</h6>
								</div>
								<div class="card">
									<div class="card-header" role="tab" id="headingOne-2">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">9:00am</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne-2" aria-expanded="true" aria-controls="collapseOne-2">
												Breakfast at the Agency<svg class="olymp-dropdown-arrow-icon"><use xlink:href="icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
											</a>
										</h5>
									</div>

									<div id="collapseOne-2" class="collapse" role="tabpanel">
										<div class="card-body">
											Hi Guys! I propose to go a litle earlier at the agency to have breakfast and talk a little more about the new design project we have been working on. Cheers!
										</div>
										<div class="place inline-items">
											<svg class="olymp-add-a-place-icon"><use xlink:href="icons/icons.svg#olymp-add-a-place-icon"></use></svg>
											<span>Daydreamz Agency</span>
										</div>

										<ul class="friends-harmonic inline-items">
											<li>
												<a href="#">
													<img src="img/friend-harmonic5.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic10.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic7.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic8.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic2.jpg" alt="friend">
												</a>
											</li>
											<li class="with-text">
												Will Assist
											</li>
										</ul>
									</div>

								</div>

								<a href="#" class="check-all">Check all your Events</a>
							</div>

							<div id="accordion-3" role="tablist" aria-multiselectable="true" class="day-event" date-month="12" date-day="15">
								<div class="ui-block-title ui-block-title-small">
									<h6 class="title">TODAY’S EVENTS</h6>
								</div>
								<div class="card">
									<div class="card-header" role="tab" id="headingOne-3">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">9:00am</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne-3" aria-expanded="true" aria-controls="collapseOne-3">
												Breakfast at the Agency<svg class="olymp-dropdown-arrow-icon"><use xlink:href="icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
											</a>
										</h5>
									</div>

									<div id="collapseOne-3" class="collapse" role="tabpanel">
										<div class="card-body">
											Hi Guys! I propose to go a litle earlier at the agency to have breakfast and talk a little more about the new design project we have been working on. Cheers!
										</div>

										<div class="place inline-items">
											<svg class="olymp-add-a-place-icon"><use xlink:href="icons/icons.svg#olymp-add-a-place-icon"></use></svg>
											<span>Daydreamz Agency</span>
										</div>

										<ul class="friends-harmonic inline-items">
											<li>
												<a href="#">
													<img src="img/friend-harmonic5.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic10.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic7.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic8.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic2.jpg" alt="friend">
												</a>
											</li>
											<li class="with-text">
												Will Assist
											</li>
										</ul>
									</div>

								</div>

								<div class="card">
									<div class="card-header" role="tab" id="headingTwo-3">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">12:00pm</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo-3" aria-expanded="true" aria-controls="collapseTwo-3">
												Send the new “Olympus” project files to the Agency<svg class="olymp-dropdown-arrow-icon"><use xlink:href="icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
											</a>
										</h5>
									</div>

									<div id="collapseTwo-3" class="collapse" role="tabpanel" >
										<div class="card-body">
											Hi Guys! I propose to go a litle earlier at the agency to have breakfast and talk a little more about the new design project we have been working on. Cheers!
										</div>
									</div>

								</div>

								<div class="card">
									<div class="card-header" role="tab" id="headingThree-3">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">6:30pm</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#" aria-expanded="false">
												Take Querty to the Veterinarian
											</a>
										</h5>
									</div>
									<div class="place inline-items">
										<svg class="olymp-add-a-place-icon"><use xlink:href="icons/icons.svg#olymp-add-a-place-icon"></use></svg>
										<span>Daydreamz Agency</span>
									</div>
								</div>

								<a href="#" class="check-all">Check all your Events</a>
							</div>

							<div id="accordion-4" role="tablist" aria-multiselectable="true" class="day-event" date-month="12" date-day="28">
								<div class="ui-block-title ui-block-title-small">
									<h6 class="title">TODAY’S EVENTS</h6>
								</div>
								<div class="card">
									<div class="card-header" role="tab" id="headingOne-4">
										<div class="event-time">
											<span class="circle"></span>
											<time datetime="2004-07-24T18:18">9:00am</time>
											<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
										</div>
										<h5 class="mb-0">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne-4" aria-expanded="true" aria-controls="collapseOne-4">
												Breakfast at the Agency<svg class="olymp-dropdown-arrow-icon"><use xlink:href="icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
											</a>
										</h5>
									</div>

									<div id="collapseOne-4" class="collapse" role="tabpanel" aria-labelledby="headingOne-4">
										<div class="card-body">
											Hi Guys! I propose to go a litle earlier at the agency to have breakfast and talk a little more about the new design project we have been working on. Cheers!
										</div>
										<div class="place inline-items">
											<svg class="olymp-add-a-place-icon"><use xlink:href="icons/icons.svg#olymp-add-a-place-icon"></use></svg>
											<span>Daydreamz Agency</span>
										</div>

										<ul class="friends-harmonic inline-items">
											<li>
												<a href="#">
													<img src="img/friend-harmonic5.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic10.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic7.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic8.jpg" alt="friend">
												</a>
											</li>
											<li>
												<a href="#">
													<img src="img/friend-harmonic2.jpg" alt="friend">
												</a>
											</li>
											<li class="with-text">
												Will Assist
											</li>
										</ul>
									</div>

								</div>

								<a href="#" class="check-all">Check all your Events</a>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Pages You May Like</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>

				<ul class="widget w-friend-pages-added notification-list friend-requests">
					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar41-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">The Marina Bar</a>
							<span class="chat-message-item">Restaurant / Bar</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top" title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar42-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Tapronus Rock</a>
							<span class="chat-message-item">Rock Band</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top" title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar43-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Pixel Digital Design</a>
							<span class="chat-message-item">Company</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top" title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar44-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Thompson’s Custom Clothing Boutique</a>
							<span class="chat-message-item">Clothing Store</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top" title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar45-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Crimson Agency</a>
							<span class="chat-message-item">Company</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top" title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar46-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Mannequin Angel</a>
							<span class="chat-message-item">Clothing Store</span>
						</div>
						<span class="notification-icon" data-toggle="tooltip" data-placement="top" title="ADD TO YOUR FAVS">
							<a href="#">
								<svg class="olymp-star-icon"><use xlink:href="icons/icons.svg#olymp-star-icon"></use></svg>
							</a>
						</span>
					</li>

				</ul>

			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Faved this Page</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-faved-page">
						<li>
							<a href="#">
								<img src="img/faved-page1.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page2.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page3.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page4.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page5.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page6.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page7.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page8.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page9.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page7.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page10.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page11.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page7.jpg" alt="user">
							</a>
						</li>
						<li>
							<a href="#">
								<img src="img/faved-page12.jpg" alt="user">
							</a>
						</li>
						<li class="all-users">
							<a href="#">+5k</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Page Intro</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>
				<div class="ui-block-content">
					<ul class="widget w-personal-info item-block">
						<li>
							<span class="text">We are Rock Band from Los Angeles, now based in San Francisco, come and listen to us play!</span>
						</li>
						<li>
							<span class="title">Created:</span>
							<span class="text">September 17th, 2013</span>
						</li>
						<li>
							<span class="title">Based in:</span>
							<span class="text">San Francisco, California</span>
						</li>
						<li>
							<span class="title">Contact:</span>
							<a href="#" class="text">greengoo_gigs@youmail.com</a>
						</li>
						<li>
							<span class="title">Website:</span>
							<a href="#" class="text">www.ggrock.com</a>
						</li>
						<li>
							<span class="title">Favourites:</span>
							<a href="#" class="text">5630 </a>
						</li>
					</ul>

					<div class="widget w-socials">
						<h6 class="title">Other Social Networks:</h6>
						<a href="#" class="social-item bg-facebook">
							<i class="fa fa-facebook" aria-hidden="true"></i>
							Facebook
						</a>
						<a href="#" class="social-item bg-twitter">
							<i class="fa fa-twitter" aria-hidden="true"></i>
							Twitter
						</a>
						<a href="#" class="social-item bg-green">
							<i class="fa fa-dribbble" aria-hidden="true"></i>
							Spotify
						</a>
					</div>
				</div>
			</div>

		</aside>
		<aside class="col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-12 col-xs-12">

			<div class="ui-block">
				<div class="widget w-birthday-alert">
					<div class="icons-block">
						<svg class="olymp-cupcake-icon"><use xlink:href="icons/icons.svg#olymp-cupcake-icon"></use></svg>
						<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
					</div>

					<div class="content">
						<div class="author-thumb">
							<img src="img/avatar48-sm.jpg" alt="author">
						</div>
						<span>Today is</span>
						<a href="#" class="h4 title">Marina Valentine’s Birthday!</a>
						<p>Leave her a message with your best wishes on her profile page!</p>
					</div>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Friend Suggestions</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>

				<ul class="widget w-friend-pages-added notification-list friend-requests">
					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar38-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Francine Smith</a>
							<span class="chat-message-item">8 Friends in Common</span>
						</div>
						<span class="notification-icon">
							<a href="#" class="accept-request">
								<span class="icon-add without-text">
									<svg class="olymp-happy-face-icon"><use xlink:href="icons/icons.svg#olymp-happy-face-icon"></use></svg>
								</span>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar39-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Hugh Wilson</a>
							<span class="chat-message-item">6 Friends in Common</span>
						</div>
						<span class="notification-icon">
							<a href="#" class="accept-request">
								<span class="icon-add without-text">
									<svg class="olymp-happy-face-icon"><use xlink:href="icons/icons.svg#olymp-happy-face-icon"></use></svg>
								</span>
							</a>
						</span>

					</li>

					<li class="inline-items">
						<div class="author-thumb">
							<img src="img/avatar40-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Karen Masters</a>
							<span class="chat-message-item">6 Friends in Common</span>
						</div>
						<span class="notification-icon">
							<a href="#" class="accept-request">
								<span class="icon-add without-text">
									<svg class="olymp-happy-face-icon"><use xlink:href="icons/icons.svg#olymp-happy-face-icon"></use></svg>
								</span>
							</a>
						</span>

					</li>

				</ul>

			</div>

			<div class="ui-block">

				<div class="ui-block-title">
					<h6 class="title">Activity Feed</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>

				<ul class="widget w-activity-feed notification-list">
					<li>
						<div class="author-thumb">
							<img src="img/avatar49-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Marina Polson</a> commented on Jason Mark’s <a href="#" class="notification-link">photo.</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">2 mins ago</time></span>
						</div>
					</li>

					<li>
						<div class="author-thumb">
							<img src="img/avatar9-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Jake Parker </a> liked Nicholas Grissom’s <a href="#" class="notification-link">status update.</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">5 mins ago</time></span>
						</div>
					</li>

					<li>
						<div class="author-thumb">
							<img src="img/avatar50-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Mary Jane Stark </a> added 20 new photos to her <a href="#" class="notification-link">gallery album.</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">12 mins ago</time></span>
						</div>
					</li>

					<li>
						<div class="author-thumb">
							<img src="img/avatar51-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Nicholas Grissom </a> updated his profile <a href="#" class="notification-link">photo</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">1 hour ago</time></span>
						</div>
					</li>
					<li>
						<div class="author-thumb">
							<img src="img/avatar48-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Marina Valentine </a> commented on Chris Greyson’s <a href="#" class="notification-link">status update</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">1 hour ago</time></span>
						</div>
					</li>

					<li>
						<div class="author-thumb">
							<img src="img/avatar52-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Green Goo Rock </a> posted a <a href="#" class="notification-link">status update</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">1 hour ago</time></span>
						</div>
					</li>
					<li>
						<div class="author-thumb">
							<img src="img/avatar10-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Elaine Dreyfuss  </a> liked your <a href="#" class="notification-link">blog post</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">2 hours ago</time></span>
						</div>
					</li>

					<li>
						<div class="author-thumb">
							<img src="img/avatar10-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Elaine Dreyfuss  </a> commented on your <a href="#" class="notification-link">blog post</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">2 hours ago</time></span>
						</div>
					</li>

					<li>
						<div class="author-thumb">
							<img src="img/avatar53-sm.jpg" alt="author">
						</div>
						<div class="notification-event">
							<a href="#" class="h6 notification-friend">Bruce Peterson </a> changed his <a href="#" class="notification-link">profile picture</a>.
							<span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">15 hours ago</time></span>
						</div>
					</li>

				</ul>
			</div>

			<div class="ui-block">
				<div class="widget w-action">

					<img src="img/logo.png" alt="Olympus">
					<div class="content">
						<h4 class="title">OLYMPUS</h4>
						<span>THE BEST SOCIAL NETWORK THEME IS HERE!</span>
						<a href="01-LandingPage.html" class="btn btn-bg-secondary btn-md">Register Now!</a>
					</div>
				</div>
			</div>

			<div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">Twitter Feed</h6>
					<a href="#" class="more"><svg class="olymp-three-dots-icon"><use xlink:href="icons/icons.svg#olymp-three-dots-icon"></use></svg></a>
				</div>

				<ul class="widget w-twitter">
					<li class="twitter-item">
						<div class="author-folder">
							<img src="img/twitter-avatar.png" alt="avatar">
							<div class="author">
								<a href="#" class="author-name">Green Goo Rock</a>
								<a href="#" class="group">@greengoo_rock</a>
								<span class="verified"><i class="fa fa-check" aria-hidden="true"></i></span>
							</div>
						</div>
						<p>This Friday at 8pm we’ll be playing a song of our new album, come and join us! <a href="#" class="link-post">#NewsoftheGoo</a></p>
						<span class="post__date">
							<time class="published" datetime="2017-03-24T18:18">
								4 hours ago
							</time>
						</span>
					</li>
					<li class="twitter-item">
						<div class="author-folder">
							<img src="img/twitter-avatar.png" alt="avatar">
							<div class="author">
								<a href="#" class="author-name">Green Goo Rock</a>
								<a href="#" class="group">@greengoo_rock</a>
								<span class="verified"><i class="fa fa-check" aria-hidden="true"></i></span>
							</div>
						</div>
						<p>Tickets for the Marina Party are now available on <a href="#" class="link-post">www.ggrock.com</a></p>
						<span class="post__date">
							<time class="published" datetime="2017-03-24T18:18">
								Yesterday
							</time>
						</span>
					</li>
					<li class="twitter-item">
						<div class="author-folder">
							<img src="img/twitter-avatar.png" alt="avatar">
							<div class="author">
								<a href="#" class="author-name">Green Goo Rock</a>
								<a href="#" class="group">@greengoo_rock</a>
								<span class="verified"><i class="fa fa-check" aria-hidden="true"></i></span>
							</div>
						</div>
						<p>We had a great time playing in Italy. Thanks a lot to the incredible fans! <a href="#" class="link-post">#GGinRome #PisaArena </a></p>
						<span class="post__date">
							<time class="published" datetime="2017-03-24T18:18">
								5 days ago
							</time>
						</span>
					</li>
				</ul>
			</div>
		</aside>

		<div class="col-xl-12">
			<div class="ui-block">
			<div class="ui-block-title">
				<h6 class="title">Extended Forecast</h6>
			</div>

			<div class="swiper-container pagination-bottom" data-slide="fade">
				<div class="swiper-wrapper">
					<div class="swiper-slide swiper-slide-weather" data-swiper-parallax="-500">
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Tomorrow</div>

							<svg class="olymp-weather-sunny-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">60°</div>
								<div class="max-min-temperature">
									<span>55°</span>
									<span class="high">69°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Monday 28</div>
							<svg class="olymp-weather-wind-icon-header icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">58°</div>
								<div class="max-min-temperature">
									<span>52°</span>
									<span class="high">64°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Tuesday 29</div>

							<svg class="olymp-weather-cloudy-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">67°</div>
								<div class="max-min-temperature">
									<span>62°</span>
									<span class="high">77°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Wednesday 30</div>
							<svg class="olymp-weather-rain-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>
							<div class="wethear-now">
								<div class="temperature-sensor">70°</div>
								<div class="max-min-temperature">
									<span>65°</span>
									<span class="high">82°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Thursday 31</div>
							<svg class="olymp-weather-storm-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">73°</div>
								<div class="max-min-temperature">
									<span>68°</span>
									<span class="high">79°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Friday 1</div>
							<svg class="olymp-weather-snow-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">68°</div>
								<div class="max-min-temperature">
									<span>56°</span>
									<span class="high">69°</span>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-slide swiper-slide-weather" data-swiper-parallax="-500">
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Tomorrow</div>

							<svg class="olymp-weather-sunny-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">60°</div>
								<div class="max-min-temperature">
									<span>55°</span>
									<span class="high">69°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Monday 28</div>
							<svg class="olymp-weather-wind-icon-header icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">58°</div>
								<div class="max-min-temperature">
									<span>52°</span>
									<span class="high">64°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Tuesday 29</div>

							<svg class="olymp-weather-cloudy-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">67°</div>
								<div class="max-min-temperature">
									<span>62°</span>
									<span class="high">77°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Wednesday 30</div>
							<svg class="olymp-weather-rain-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>
							<div class="wethear-now">
								<div class="temperature-sensor">70°</div>
								<div class="max-min-temperature">
									<span>65°</span>
									<span class="high">82°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Thursday 31</div>
							<svg class="olymp-weather-storm-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">73°</div>
								<div class="max-min-temperature">
									<span>68°</span>
									<span class="high">79°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Friday 1</div>
							<svg class="olymp-weather-snow-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">68°</div>
								<div class="max-min-temperature">
									<span>56°</span>
									<span class="high">69°</span>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-slide swiper-slide-weather" data-swiper-parallax="-500">
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Tomorrow</div>

							<svg class="olymp-weather-sunny-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-sunny-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">60°</div>
								<div class="max-min-temperature">
									<span>55°</span>
									<span class="high">69°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Monday 28</div>
							<svg class="olymp-weather-wind-icon-header icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-wind-icon-header"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">58°</div>
								<div class="max-min-temperature">
									<span>52°</span>
									<span class="high">64°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Tuesday 29</div>

							<svg class="olymp-weather-cloudy-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-cloudy-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">67°</div>
								<div class="max-min-temperature">
									<span>62°</span>
									<span class="high">77°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Wednesday 30</div>
							<svg class="olymp-weather-rain-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-rain-icon"></use></svg>
							<div class="wethear-now">
								<div class="temperature-sensor">70°</div>
								<div class="max-min-temperature">
									<span>65°</span>
									<span class="high">82°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Thursday 31</div>
							<svg class="olymp-weather-storm-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-storm-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">73°</div>
								<div class="max-min-temperature">
									<span>68°</span>
									<span class="high">79°</span>
								</div>
							</div>
						</div>
						<div class="day-wethear-item" data-mh="wethear-item">
							<div class="title">Friday 1</div>
							<svg class="olymp-weather-snow-icon icon"><use xlink:href="icons/icons-weather.svg#olymp-weather-snow-icon"></use></svg>

							<div class="wethear-now">
								<div class="temperature-sensor">68°</div>
								<div class="max-min-temperature">
									<span>56°</span>
									<span class="high">69°</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- If we need pagination -->
				<div class="swiper-pagination pagination-blue"></div>
			</div>

		</div>
		</div>
	</div>
</div>


<!-- jQuery first, then Other JS. -->
<script src="js/jquery-3.2.0.min.js"></script>
<!-- Js effects for material design. + Tooltips -->
<script src="js/material.min.js"></script>
<!-- Helper scripts (Tabs, Equal height, Scrollbar, etc) -->
<script src="js/theme-plugins.js"></script>
<!-- Init functions -->
<script src="js/main.js"></script>

<!-- Select / Sorting script -->
<script src="js/selectize.min.js"></script>

<!-- Datepicker input field script-->
<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.min.js"></script>

<!-- Widget with events script-->
<script src="js/simplecalendar.js"></script>
<!-- Swiper / Sliders -->
<script src="js/swiper.jquery.min.js"></script>

<script src="js/mediaelement-and-player.min.js"></script>
<script src="js/mediaelement-playlist-plugin.min.js"></script>


</body>
</html>