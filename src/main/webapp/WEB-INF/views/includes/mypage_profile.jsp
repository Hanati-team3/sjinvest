<%@ page contentType="text/html; charset=utf-8" %>

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
              <a href="02-ProfilePage.html" class="h4 author-name">${user.userId }</a>
              <div class="country">${user.userEmail }</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 프로필 사진, 배경 end -->