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

<style>
#tagColor{
	border: 2px solid #01DF01;
    padding: 5px;
    border-radius: 10px;
}


</style>

<div class="ui-block">
        <div class="news-feed-form">

          <!-- Tab panes -->
          <div class="tab-content">
            <div class="tab-pane active" id="home-1" role="tabpanel"
              aria-expanded="true">
             <form id="writeForm">
                <div class="author-thumb">
                	<c:choose>
	                  <c:when test="${user.userPicture ne null }">
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
                	
                </div>
                <div
                  class="form-group with-icon label-floating is-empty">
                  <c:choose>
	                  <c:when test="${user.userId ne null }">
                    

                    <textarea id="feedContentT" name="feedContentT" class="form-control" placeholder="주식정보를 공유하여 주세요..!"></textarea>
                  
                    <%-- <div contentEditable="true">
                        대표 이미지를 텍스트와 함께 입력이 가능
                        <img  src="<%=application.getContextPath()%>/resources/img/author-page.jpg" alt="author">
                    </div> --%>
                  
	                  </c:when>
	                  <c:otherwise>
	                  	<textarea class="form-control" placeholder="로그인이 필요합니다." readonly="readonly"></textarea>
	                  </c:otherwise>
                  </c:choose>
                </div>
                <div class="add-options-message">
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="ADD PHOTOS"> 
                    <svg class="olymp-camera-icon" data-toggle="modal" data-target="#update-header-photo">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-camera-icon"></use></svg>
                  </a> 

					<c:choose>
	                  <c:when test="${user.userId ne null }">
	                  		<button class="btn btn-primary btn-md-2">글올리기</button>
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
      
      