<%@ page contentType="text/html; charset=utf-8"%>

  <!-- user_profile modal start -->

  <div class="modal fade" id="user_modal">
    <div class="modal-dialog ui-block window-popup fav-page-popup">
      <a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close"> 
        <svg class="olymp-close-icon">
        <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
      </a>

      <div class="ui-block-title">
        <h6 class="title">회원 프로필</h6>
      </div>

      <div class="ui-block-content">
        <form>
          <div class="row">

            <!-- mypage_profile start -->
            <jsp:include page="../includes/mypage_profile.jsp"></jsp:include>
            <!-- mypage_profile end -->


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <input class="form-control" placeholder="쩌리" type="text" style="text-align:center">
                <textarea class="form-control" placeholder="">
                안녕하세요! 주식에 관심이 많은 학생입니다.
                모의투자를 통해서 많이 배우고 싶어요!
                관심있는 분은 팔로우해서 주식정보 나누어요!
                </textarea>
            </div>

              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <button class="btn btn-secondary btn-lg full-width">주식정보보기</button>
              </div>
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <button class="btn btn-secondary btn-lg full-width">뉴스피드보기</button>
              </div>

          </div>

        </form>
      </div>

    </div>
  </div>

  <!-- ... user_profile modal end -->

