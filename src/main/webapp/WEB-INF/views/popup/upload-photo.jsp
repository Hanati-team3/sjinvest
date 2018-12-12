<%@ page contentType="text/html; charset=utf-8" %>
<div class="modal fade" id="update-header-photo">
  <div class="modal-dialog ui-block window-popup update-header-photo">
    <a href="#" class="close icon-close" data-dismiss="modal" aria-label="Close">
      <svg class="olymp-close-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
    </a>

    <div class="ui-block-title">
      <h6 class="title">My Photo</h6>
    </div>


    <a href="#" class="upload-photo-item">
      <svg class="olymp-computer-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-computer-icon"></use></svg>
      <h6>프로필사진</h6>
      <span>Browse your computer.</span>
<form action="/sos/user/updateImage" method="post">
    <input type="file" value="파일선택" name="file"/>
    <input type="submit" value="변경하기" />
</form>
    </a>

     <a href="#" class="upload-photo-item" data-toggle="modal" data-target="#choose-from-my-photo">
      <svg class="olymp-photos-icon"><use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-photos-icon"></use></svg>
      <h6>주식정보공유</h6>
      <span>Choose from my stock</span>
<form action="/sos/feed/updateImage" method="post">
    <input type="file" value="파일선택" name="file2"/>
    <input type="submit" value="공유하기" />
</form>      
    </a>
  </div>
</div>