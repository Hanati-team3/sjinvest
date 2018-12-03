<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active inline-items" data-toggle="tab" href="#home-1" role="tab" aria-expanded="true">

                <span>전체</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link inline-items" data-toggle="tab" href="#profile-1" role="tab" aria-expanded="false">

                <span>팔로워</span>
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link inline-items" data-toggle="tab" href="#blog" role="tab" aria-expanded="false">

                <span>내글만</span>
              </a>
            </li>
          </ul>


<%-- 피드 목록 시작--%>

<c:forEach var="i" begin="1" end="10" step="1">
  <div id="newsfeed-items-grid">
    <div class="ui-block">
      <article class="hentry post">

        <div class="post__author author vcard inline-items">
          <img
            src="<%=application.getContextPath()%>/resources/img/avatar7-sm.jpg"
            alt="author">

          <div class="author-date">
            <a href="#" class="h6 post__author-name fn" data-toggle="modal" data-target="#user_modal">
            윤형철
            </a>
            <div class="post__date">
              <time class="published" datetime="2004-07-24T18:18">
                March 4 at 2:05pm </time>
            </div>
          </div>

          <div class="more">
            <svg class="olymp-three-dots-icon">
            <use
                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
            <ul class="more-dropdown">
              <li><a href="#">수정</a></li>
              <li><a href="/sos/feed/delete">삭제</a></li>
            </ul>
          </div>
        </div>

        <p>여기는 SNS 게시판입니다. 어떤 내용이 입력되어있을까요?</p>

      <%-- 비디오링크 
      <div class="post-video">
        <div class="video-thumb">
          <img src="<%=application.getContextPath()%>/resources/img/video-youtube1.jpg" alt="photo"> 
          <a href="https://youtube.com/watch?v=excVFQ2TWig"
            class="play-video"> 
            <svg class="olymp-play-icon">
              <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-play-icon"></use>
            </svg>
          </a>
        </div>

        <div class="video-content">
          <a href="#" class="h4 title">Iron Maid - ChillGroves</a>
          <p>Lorem ipsum dolor sit amet, consectetur ipisicing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna
            aliqua...</p>
          <a href="#" class="link-site">YOUTUBE.COM</a>
        </div>
      </div> --%>

        <div class="post-additional-info inline-items">

          <a href="#" class="post-add-icon inline-items"> <svg
              class="olymp-heart-icon">
          <use
                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-heart-icon"></use>
        </svg> <span>18</span>
          </a>

          <div class="comments-shared">
            <a href="#" class="post-add-icon inline-items"> <svg
                class="olymp-speech-balloon-icon">
                    <use
                  xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-speech-balloon-icon"></use></svg>

              <span>5</span>
            </a> <a href="#" class="post-add-icon inline-items"> <svg
                class="olymp-share-icon">
                    <use
                  xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>

              <span>16</span>
            </a>
          </div>


        </div>

        <div class="control-block-button post-control-button">

          <a href="#" class="btn btn-control"> <svg
              class="olymp-like-post-icon">
                  <use
                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-like-post-icon"></use></svg>
          </a> <a href="#" class="btn btn-control"> <svg
              class="olymp-comments-post-icon">
                  <use
                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-comments-post-icon"></use></svg>
          </a> <a href="#" class="btn btn-control"> <svg
              class="olymp-share-icon">
                  <use
                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>
          </a>

        </div>

      </article>


      <!-- 댓글 list start -->
      <div class="ui-block-title" id="accordion" role="tablist"
        aria-multiselectable="true" style="padding: 10px 0px 0px 6px;">
        <div class="card">

          <div class="card-header" role="tab" id="headingOne">
            <h6 class="mb-0">
              <a data-toggle="collapse" data-parent="#accordion"
                href="#collapseOne" aria-expanded="true"
                aria-controls="collapseOne"
                style="text-align: center; font-size: 12px"> View
                more comments + <svg class="olymp-dropdown-arrow-icon">
                <use
                    xlink:href="../resources/icons/icons.svg#olymp-dropdown-arrow-icon"></use>
            </svg>
              </a>
            </h6>
          </div>

          <div id="collapseOne" class="collapse show" role="tabpanel"
            aria-labelledby="headingOne">
            <ul class="comments-list">
              <li>
                <div class="post__author author vcard inline-items">
                  <img
                    src="<%=application.getContextPath()%>/resources/img/avatar10-sm.jpg"
                    alt="author">

                  <div class="author-date">
                    <a class="h6 post__author-name fn"
                      href="02-ProfilePage.html" data-toggle="modal" data-target="#user_modal">James Spiegel</a>
                    <div class="post__date">
                      <time class="published"
                        datetime="2004-07-24T18:18"> 38 mins ago
                      </time>
                    </div>
                  </div>

              
              <div class="more">
                <svg class="olymp-three-dots-icon">
                  <use
                    xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                <ul class="more-dropdown">
                  <li><a href="#">댓글수정</a></li>
                  <li><a href="/sos/feed/delete">댓글삭제</a></li>
                </ul>
              </div>

                </div>

                <p>이것은 게시글에 대한 댓글입니다.</p>

              </li>

              <li>

                <div class="post__author author vcard inline-items">
                  <img
                    src="<%=application.getContextPath()%>/resources/img/avatar17-sm.jpg"
                    alt="author">

                  <div class="author-date">
                    <a class="h6 post__author-name fn"
                      href="02-ProfilePage.html" data-toggle="modal" data-target="#user_modal">Tony Stark</a>
                    <div class="post__date">
                      <time class="published"
                        datetime="2004-07-24T18:18"> 12 mins ago
                      </time>
                    </div>
                  </div>

                  <%-- <div class="more">
                <svg class="olymp-three-dots-icon">
                  <use
                    xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
                <ul class="more-dropdown">
                  <li><a href="#">댓글수정</a></li>
                  <li><a href="/sos/feed/delete">댓글삭제</a></li>
                </ul>
              </div> --%>

                </div>
                <p>이것은 게시글대한 댓글222입니다.</p>
              </li>

            </ul>
          </div>

        </div>
      </div>
      <!-- ...댓글 list end -->


      <form class="comment-form inline-items">

        <div class="post__author author vcard inline-items">
          <img
            src="<%=application.getContextPath()%>/resources/img/author-page.jpg"
            alt="author">

          <div class="form-group with-icon-right ">
            <textarea class="form-control" placeholder=""></textarea>
            <div class="add-options-message">
              <a href="#" class="options-message" data-toggle="modal"
                data-target="#update-header-photo"> <svg
                  class="olymp-camera-icon">
                      <use
                    xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-camera-icon"></use></svg>
              </a>
            </div>
          </div>
        </div>

      </form>

    </div>
  </div>
</c:forEach>

<%-- 피드 목록 끝 --%>



<%-- 더보기 버튼 start --%>
<a id="load-more-button" href="#" class="btn btn-control btn-more"
  data-load-link="items-to-load.html"
  data-container="newsfeed-items-grid"> <svg
    class="olymp-three-dots-icon">
          <use
      xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon">
          </use>
        </svg>
</a>
<%-- 더보기 버튼 end --%>
