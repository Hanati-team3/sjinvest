<%@ page contentType="text/html; charset=utf-8" %>
<div class="ui-block">
  <div class="ui-block-title">
    <a href="#"><h6>Following & Follower</h6></a>
  </div>
	<div class="mCustomScrollbar" data-mcs-theme="dark" >

		<div class="ui-block-title ui-block-title-small">
			<a href="#" class="title">Following</a>
		</div>

		<ul class="chat-users" id="follow_list">
    
	  
    
        <!-- getFollowList Ajax 로 들어오는 부분 start-->
      
        <%-- sample data 
        <li class="inline-items">
        <div class="author-thumb">
        
        <img alt="author" src="<%=application.getContextPath()%>/resources/img/avatar3-sm.jpg" 
        class="avatar"></div>
        <div class="author-status">
        <a href="javascript:void(0);" class="h6 author-name" data-toggle="modal" data-target="#user_data" >tester02</a>
        </div>
        </li> --%>

      
        <!-- ..getFollowList Ajax 로 들어오는 부분 end-->
      
      
      
      
		</ul>

		<div class="ui-block-title ui-block-title-small">
			<a href="#" class="title">Follower</a>
		</div>

		<ul class="chat-users" id="follower_list">
    
	    <!-- getFollowerList Ajax 로 들어오는 부분 -->

		</ul>

	</div>

 </div>
 
 
