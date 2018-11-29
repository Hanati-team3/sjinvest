<%@ page contentType="text/html; charset=utf-8" %>
<div class="ui-block">

  <div class="ui-block-title">
    <a href="#"><h6>관심종목</h6></a>
  </div>

  <ul class="widget w-activity-feed notification-list">

    <li>
      <div class="author-thumb">
        <img src="<%=application.getContextPath()%>/resources/img/avatar50-sm.jpg" alt="author">
      </div>
      <div class="notification-event">
        <a href="#" class="h6 notification-friend">Mary Jane Stark </a> added 20 new photos to her <a href="#" class="notification-link">gallery album.</a>.
        <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">12 mins ago</time></span>
      </div>
    </li>

    <li>
      <div class="author-thumb">
        <img src="<%=application.getContextPath()%>/resources/img/avatar48-sm.jpg" alt="author">
      </div>
      <div class="notification-event">
        <a href="#" class="h6 notification-friend">Marina Valentine </a> commented on Chris Greyson’s <a href="#" class="notification-link">status update</a>.
        <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">1 hour ago</time></span>
      </div>
    </li>

    <li>
      <div class="author-thumb">
        <img src="<%=application.getContextPath()%>/resources/img/avatar53-sm.jpg" alt="author">
      </div>
      <div class="notification-event">
        <a href="#" class="h6 notification-friend">Bruce Peterson </a> changed his <a href="#" class="notification-link">profile picture</a>.
        <span class="notification-date"><time class="entry-date updated" datetime="2004-07-24T18:18">15 hours ago</time></span>
      </div>
    </li> 

  </ul>
</div>