<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sjinvest.sos.user.domain.User" %>
<%
boolean result_profile = true;

if((User)(request.getSession().getAttribute("user")) != null){

  if(((((User)request.getSession().getAttribute("user")).getUserPicture().split(":")[0]).equals("http") || (((User)request.getSession().getAttribute("user")).getUserPicture().split(":")[0]).equals("https"))){
    result_profile = true;
  }else{
    result_profile = false;
  }
}
%> 
<%-- 피드 목록 start --%>
<div id="makeFeed">
	<!-- for문으로 피드 글 보여주기  -->
	
</div>

	<div id="newsfeed-items-grid" style="display: none">
	  <div class="ui-block">
	    <article class="hentry post">
	
	      <div class="post__author author vcard inline-items">
	        <img name="userImage" src="" width="36px" height="36px" alt="author">
	
	        <div class="author-date">
	          <a name="postUserNickName"  href="javascript:void(0);" onclick="userModal(this)" class="h6 post__author-name fn" data-toggle="modal" data-target="#user_data"></a>
	          <div class="post__date">
	            <time name="postWriteDate" class="published"></time>
	          </div>
	        </div>
	
	        <div name="moreIcon" class="more" style="display: none">
	          <svg class="olymp-three-dots-icon">
	          <use
	              xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
	          <ul class="more-dropdown">
	            <li><a name="deleteFeed" href="javascript:void(0);" onclick="deleteFeed(this)">삭제</a></li>
	          </ul>
	        </div>
	      </div>
	
	      <p name="feedContent"></p>
	
	      <div class="post-additional-info inline-items">
	
	        <a name="likebyOthers" class="post-add-icon inline-items" href="javascript:void(0);" onclick="likeFeed(this)"> 
	        	<svg class="olymp-heart-icon">
	        		<use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-heart-icon"></use>
	      		</svg> 
	      		<span name="feedLike"></span>
	        </a>
	
	        <div class="comments-shared">
	          <a href="#" class="post-add-icon inline-items"> <svg
	              class="olymp-speech-balloon-icon">
	                  <use
	                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-speech-balloon-icon"></use></svg>
	
	            <span name="feedCommnetCount"></span>
	          </a> <a href="#" class="post-add-icon inline-items"> <svg
	              class="olymp-share-icon">
	                  <use
	                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>
	
	            <span name="feedShare"></span>
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
	  </div>
	</div>
<%-- ..피드 목록 end --%>

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
