<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sjinvest.sos.user.domain.User" %>
<div class="row">

<%--
  <!-- mypage_profile start -->
  <jsp:include page="../includes/mypage_profile.jsp"></jsp:include>
  <!-- mypage_profile end --> 
--%>
  
<!-- 프로필 사진, 배경 start -->

<div class="container">
  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="ui-block">
        <div class="top-header">
          
          <div class="top-header-thumb">
            <img src="<%=application.getContextPath()%>/resources/img/top-header4.png" alt="nature">
          </div>
          <div class="profile-section">
          </div>
          
          <c:choose>
          
          <c:when test="${userId ne null }">
          <div class="top-header-author">
            <a href="#" class="author-thumb" data-toggle="modal" data-target="#update-header-photo">
            	<%if ((((User)request.getAttribute("user")).getUserPicture().split(":")[0]).equals("http") || (((User)request.getAttribute("user")).getUserPicture().split(":")[0]).equals("https")){ %>
              		<img src="${user.userPicture}" width="124" height="124" alt="author">
              <%}else{ %>
              		<img src="<%=application.getContextPath()%>/resources/img/${user.userPicture}" width="124" height="124" alt="author">
              
              <%} %>
            </a>
            <div class="author-content">
              <a href="#" class="h4 author-name">${user.userId }</a>
              
              <div class="email">${user.userEmail }</div>
            </div>
          </div>
          </c:when>
          
          <c:otherwise>
          <div class="top-header-author">
            <div class="author-content">
              <div class="email" style="font-weight:bold; font-size:15px; color:red;">로그인 후 <br>이용하세요.</div>
            </div>
          </div>
          </c:otherwise>
          
          
          </c:choose>


        </div>
      </div>
    </div>
  </div>
</div>

<!-- 프로필 사진, 배경 end -->

</div>

