<%@ page contentType="text/html; charset=utf-8" %>

    <!-- 내프로필 left 항목 start -->
    <div class="col-xl-3 order-xl-1 col-lg-3 order-lg-1 col-md-12 order-md-2 col-sm-12 col-xs-12 responsive-display-none">
      <div class="ui-block">
        <div class="your-profile">
          <div class="ui-block-title ui-block-title-small">
            <h6 class="title">내 프로필</h6>
          </div>

          <div class="ui-block-title">
            <a href="javascript:void(0);" onclick="information()" class="h6 title">내정보확인</a>
          </div>
          
          <div class="ui-block-title" id="accordion" role="tablist" aria-multiselectable="true" style="padding: 10px 0px 0px 6px;">
            <div class="card">
              <div class="card-header" role="tab" id="headingOne">
                <h6 class="mb-0">
                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" >
                    팔로우
                    <svg class="olymp-dropdown-arrow-icon"><use xlink:href="../resources/icons/icons.svg#olymp-dropdown-arrow-icon"></use></svg>
                  </a>
                </h6>
              </div>

              <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                <ul class="your-profile-menu">
                  <li>
                    <a href="javascript:void(0);" onclick="follow()">팔로잉</a>
                  </li>
                  <li>
                    <a href="javascript:void(0);" onclick="follower()">팔로워</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          
          
          <div class="ui-block-title">
            <a href="javascript:void(0);" onclick="point()" class="h6 title">포인트내역</a>
          </div>
          <div class="ui-block-title">
            <a href="javascript:void(0);" onclick="setting_sns()" class="h6 title">SNS설정</a>
          </div>
          <div class="ui-block-title">
            <a href="javascript:void(0);" onclick="setting_stock()" class="h6 title">주식설정</a>
          </div>
          
        </div>
      </div>
    </div>
    <!-- 내프로필 left 항목 end -->