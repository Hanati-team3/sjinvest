<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- user_profile modal start -->

  <div class="modal fade" id="user_data">
    <div class="modal-dialog ui-block window-popup fav-page-popup">
      <a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close"> 
        <svg class="olymp-close-icon">
        <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
      </a>

      <div class="ui-block-title">
        <h6 class="title">회원 data</h6>
      </div>

      <div class="ui-block-content">
        <form>
          <div class="row">

            <!-- mypage_profile start -->
            <div class="row">


  
<!-- 프로필 사진, 배경 start -->

<div class="container">
  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="ui-block">
        <div class="top-header">
          
          <div class="top-header-thumb">
            <img src="<%=application.getContextPath()%>/resources/img/top-header1.jpg" alt="nature">
          </div>
          <div class="profile-section">
          </div>
          <div class="top-header-author">
            <a href="#" class="author-thumb">
              <img src="<%=application.getContextPath()%>/resources/img/author-main1.jpg" alt="author">
            </a>
            <div class="author-content">
              <a href="#" id="id2" class="h4 author-name"></a>
              <div class="email" id="email2"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

        <div class="control-block-button post-control-button">
  
          <a href="#" class="btn btn-control" onclick="userFollow()"> <svg class="olymp-like-post-icon">
            <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-like-post-icon"></use></svg>
          </a>
  
        </div>



<!-- 프로필 사진, 배경 end -->

</div>
            <!-- mypage_profile end -->


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <input class="form-control" id="nickName2" placeholder="" type="text" style="text-align:center; background: white" readonly>
                <input class="form-control" id="detail2" placeholder="" type="text" style="text-align:center; background: white" readonly>
            </div>

              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <a class="btn btn-secondary btn-lg full-width" style="color:white; padding:0px 0px; padding-top: 10px; padding-bottom: 10px">
                주식정보보기
                </a>
              </div>
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <a class="btn btn-secondary btn-lg full-width" style="color:white; padding:0px 0px; padding-top: 10px; padding-bottom: 10px">
                뉴스피드보기
                </a>
              </div>

          </div>

        </form>
      </div>

    </div>
  </div>

  <!-- ... user_profile modal end -->

