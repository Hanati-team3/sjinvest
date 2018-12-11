<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="modal bd-example-modal-lg fade" id="sharing">
  <div class="modal-dialog modal-lg ui-block window-popup">
    <a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
      <svg class="olymp-close-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
    </a>
    <div class="ui-block-title">
      <h6 class="title">자랑하기</h6>
    </div>
<div class="ui-block">
        <div class="news-feed-form">

          <!-- Tab panes -->
          <div class="tab-content" id="tab-content">
            <div class="tab-pane active" id="home-1" role="tabpanel"
              aria-expanded="true">
              <form method="post">
                <div class="form-group with-icon label-floating is-empty">
                  <c:choose>
	                  <c:when test="${user.userId ne null }">
	                  	<textarea name="feedContent" class="form-control" placeholder="주식정보를 공유하여 주세요..!"></textarea>
	                  </c:when>
	                  <c:otherwise>
	                  	<textarea name="feedContent" class="form-control" placeholder="로그인이 필요합니다." readonly="readonly"></textarea>
	                  </c:otherwise>
                  </c:choose>
                </div>
<!-- 팔로잉 유저 타겟으로 하기...... -->                
                <div class="add-options-message">
					<c:choose>
	                  <c:when test="${user.userId ne null}">
	                  		<button id="write-wall" class="btn btn-primary btn-md-2">글올리기</button>
	                  </c:when>
	                  <c:otherwise>
	                  		<button class="btn btn-primary btn-md-2" disabled="disabled">글올리기</button>
	                  </c:otherwise>
                  </c:choose>
                </div>
              </form>
            
            </div>
          </div>
        </div>
      </div>
  </div>
</div>