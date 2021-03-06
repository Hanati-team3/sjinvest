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


          <!-- Nav tabs start -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a id="showAll" class="nav-link active inline-items" data-toggle="tab" href="#home-1" role="tab" aria-expanded="true">

                <span>All</span>
              </a>
            </li>
            <li class="nav-item">
              <a id="showFollwer" class="nav-link inline-items" data-toggle="tab" href="#profile-1" role="tab" aria-expanded="false">

                <span>Follower</span>
              </a>
            </li>

            <li class="nav-item">
              <a id="showOwn" class="nav-link inline-items" data-toggle="tab" href="#blog" role="tab" aria-expanded="false">

                <span>My</span>
              </a>
            </li>
          </ul>
          <!-- ...Nav tabs end -->      

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
	

	      <div name="feedContent"></div>
          <img name="feedImage" src=""  width="450px" height="200px" alt="picture">
	
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
	          </a> 
	          <a name="shareFeed" href="#" class="post-add-icon inline-items" href="javascript:void(0);" onclick="shareFeed(this)"> <svg
	              class="olymp-share-icon">
	                  <use
	                xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-share-icon"></use></svg>
	
	            <span name="feedShare"></span>
	          </a>
	          <a class="post-add-icon inline-items"><i class="fab fa-facebook fa-2x" aria-hidden="true"></i></a>
	          <a class="post-add-icon inline-items"><i class="fab fa-instagram fa-2x" aria-hidden="true"></i></a>
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
	    <div name="makeComment"></div>
	    
	    <!-- ...댓글 list end -->
	
	
	    <form class="comment-form inline-items">
	
	      <div class="post__author author vcard inline-items">
	      		<c:choose>
	                  <c:when test="${user.userId ne null }">
	      			<%if (result_profile){ %>
	              		<img src="${user.userPicture}" width="36px" height="36px" alt="author">
	              	<%}else{ %>
	              		<img src="<%=application.getContextPath()%>/resources/img/${user.userPicture}"  width="36px" height="36px" alt="author">
	             	<%} %>
					</c:when>
	                  <c:otherwise>
	                  	<img  src="<%=application.getContextPath()%>/resources/img/author-page.jpg" alt="author">
	                  </c:otherwise>
                  </c:choose>
	        <div class="form-group with-icon-right comment-div">
	        	<c:choose>
	                  <c:when test="${user.userId ne null }">
	          			<textarea name="commentForHere" class="form-control" placeholder="댓글을 입력해주세요"></textarea>
	          		  </c:when>
          			  <c:otherwise>
	          			<textarea name="commentForHere" class="form-control" placeholder="로그인 후 이용해주세요" disabled="disabled"></textarea>
	                  </c:otherwise>
                  </c:choose>
	          	
	          <div class="add-options-message">
	          <c:choose>
	                  <c:when test="${user.userId ne null }">
	                  	<a name="writeComment" onclick="writeComment(this);" class="options-message" title=""> 
	                  		<svg class="olymp-camera-icon">
		                    	<use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-check-icon"></use>
		                    </svg>
			            </a>
	          		  </c:when>
          			  <c:otherwise>
	                  </c:otherwise>
                  </c:choose>
	            
	          </div>
	        </div>
	      </div>
	    </form>
	
	  </div>
	</div>
<%-- ..피드 목록 end --%>
<div name="commentList" class="ui-block-title" id="accordion" role="tablist"
      aria-multiselectable="true" style="padding: 10px 0px 0px 6px; display: none">
  <div class="card">

    <div class="card-header" role="tab" id="headingOne">
      <h6 class="mb-0">
        <a data-toggle="collapse" data-parent="#accordion"
          href="#collapseOne" aria-expanded="true"
          aria-controls="collapseOne"
          style="text-align: center; font-size: 12px"> View
          more comments + <svg class="olymp-dropdown-arrow-icon">
          <use
              xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-dropdown-arrow-icon"></use>
      </svg>
        </a>
      </h6>
    </div>

    <div id="collapseOne" class="collapse show" role="tabpanel"
      aria-labelledby="headingOne">
      <ul name="commentListUL" class="comments-list" style="padding: 15px;"></ul>
      
    </div>

  </div>
</div>

<li name="commentLI" style="display:none">
	  <div class="post__author author vcard inline-items">
	    <img name="replyImage" src="<%=application.getContextPath()%>/resources/img/avatar10-sm.jpg" width="36px" height="36px" alt="author">
	
	    <div class="author-date">
	      <a name="replyName" class="h6 post__author-name fn"
	        href="javascript:void(0);" onclick="userModal(this)" data-toggle="modal" data-target="#user_data"></a>
	      <div class="post__date">
	        <time name="replyTime" class="published"
	          datetime="2004-07-24T18:18">
	        </time>
	      </div>
	    </div>
	
	
	 <div name="moreIconReply" class="more" style="display: none">
	   <svg class="olymp-three-dots-icon">
	     <use
	       xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon"></use></svg>
	   <ul class="more-dropdown" style="height: 50px; padding: 15px 20px" >
	     <li style="padding: 0px; background-color:#fff;"><a name="deleteComment" href="javascript:void(0);" onclick="deleteComment(this)">댓글삭제</a></li>
	   </ul>
	 </div>

   </div>
   <p name="replyContent"></p>
</li>


<%-- 더보기 버튼 start --%>
<a id="load-more-button" class="btn btn-control btn-more" title="11" href="javascript:void(0);" onclick="addPost(this)"> <svg
    class="olymp-three-dots-icon">
          <use
      xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-three-dots-icon">
          </use>
        </svg>
</a>
<%-- 더보기 버튼 end --%>
