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
                <input class="form-control" placeholder="${user.userNickname }" type="text" style="text-align:center; background: white" readonly>
                <input class="form-control" placeholder="${user.userDetail }" type="text" style="text-align:center; background: white" readonly>
            </div>

              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <a class="btn btn-secondary btn-lg full-width" style="color:white">>>주식정보보기</a>
              </div>
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <a class="btn btn-secondary btn-lg full-width" style="color:white">>>뉴스피드보기</a>
              </div>

          </div>

        </form>
      </div>

    </div>
  </div>

  <!-- ... user_profile modal end -->

