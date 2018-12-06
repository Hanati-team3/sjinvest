<%@ page contentType="text/html; charset=utf-8"%>

<!-- sns setting start -->


<!--  		<div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"> -->			
            <div class="ui-block">
				<div class="ui-block-title">
					<h6 class="title">SNS설정</h6>
				</div>
				<div class="ui-block-content">
					<form><!-- action=/sos/setting/update -->
						<div class="row">

                            <!-- 
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="form-group label-floating is-select">
									<label class="control-label">Who Can Friend You?</label>
									<select class="selectpicker form-control" size="auto">
										<option value="EO">Everyone</option>
										<option value="NO">No One</option>
									</select>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="form-group label-floating is-select">
									<label class="control-label">Who Can View Your Posts</label>
									<select class="selectpicker form-control" size="auto">
										<option value="US">Friends Only</option>
										<option value="EO">Everyone</option>
									</select>
								</div>
							</div>
                             -->

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">팔로잉글</div>
										<p>자신이 팔로잉하는 유저의 글을 알림으로 받습니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" name="setFeedNotice" id="setFeedNotice">
                                            <span class="toggle"></span>
										</label>
									</div>
								</div>
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">매매체결</div>
										<p>자신의 주식이 매매체결시 알림으로 받습니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" name="setTradeNotice" id="setTradeNotice">
                                            <span class="toggle"></span>
										</label>
									</div>
								</div>
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">공개설정</div>
										<p>자신의 프로필 공개여부를 설정합니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" name="setPrivacy" id="setPrivacy">
                                            <span class="toggle"></span>
										</label>
									</div>
								</div>
								<div class="description-toggle">
									<div class="description-toggle-content">
										<div class="h6">뉴스피드 방식</div>
										<p>팔로잉하는 유저의 뉴스피드만 알림으로 받습니다.</p>
									</div>

									<div class="togglebutton">
										<label>
											<input type="checkbox" name="setView" id="setView"> 
                                            <span class="toggle"></span>
										</label>
									</div>
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<button type="reset" class="btn btn-secondary btn-lg full-width">되돌리기</button>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<button type="button" class="btn btn-primary btn-lg full-width">저장하기</button> 
                                <!-- onclick="setting_sns_submit()" -->
							</div>
						</div>
					</form>
				</div>
			</div>
<!-- 		</div> -->

		

<!-- sns setting end -->


