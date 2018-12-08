<%@ page contentType="text/html; charset=utf-8" %>
    
<!-- 개인정보 수정 start -->
     
<!--     <div class="col-xl-9 order-xl-2 col-lg-9 order-lg-2 col-md-12 order-md-1 col-sm-12 col-xs-12"> -->
      <div class="ui-block">
        <div class="ui-block-title">
          <h6 class="title">개인정보</h6>
          <font size=1 style="text-align:right">필수항목(*)</font>
        </div> 
        <div class="ui-block-content">
          <form action=/sos/user/update method="post">
            <div class="row">

              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="form-group label-floating">
                  <label class="control-label">아이디<sup>*</sup></label>
                  <input class="form-control" placeholder="" type="text" value="" id="id" name="userId" readonly>
                </div>

                <div class="form-group label-floating">
                  <label class="control-label">닉네임<sup>*</sup></label>
                  <input class="form-control" placeholder="" type="text" value="" id="nickName" name="userNickname" required>
                </div>
                
                <div class="form-group label-floating">
                  <label class="control-label">이메일<sup>*</sup></label>
                  <input class="form-control" placeholder="" type="email" value="" id="email" name="userEmail" required>
                </div>

                <div class="form-group label-floating is-empty">
                  <label class="control-label">비밀번호<sup>*</sup></label>
                  <input class="form-control" placeholder="" type="password" value="" id="password" name="userPw" required>
                </div>

              </div>


              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="form-group label-floating">
                  <label class="control-label">보유액(원)</label>
                  <input class="form-control" placeholder="" type="text" value="" id="money" name="userMoney" readonly>
                </div>
                
                <div class="form-group date-time-picker label-floating">
                  <label class="control-label">생년월일</label>
                  <input name="datetimepicker" value="" id="birth" name=""/>
                  <span class="input-group-addon">
                    <svg class="olymp-month-calendar-icon icon"><use xlink:href="../resources/icons/icons.svg#olymp-month-calendar-icon"></use></svg>
                  </span>
                </div>

                <div class="form-group label-floating is-select">
                  <label class="control-label">성별</label>
                  <select class="selectpicker form-control" size="auto">
                    <option value="1" >남자</option>
                    <option value="2" >여자</option>
                  </select>
                </div>


                <div class="form-group label-floating is-empty">
                  <label class="control-label">비밀번호확인<sup>*</sup></label>
                  <input class="form-control" placeholder="" type="password" required>
                </div>

              </div>
 

              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="form-group label-floating">
                  <label class="control-label">자기소개</label>
                  <textarea class="form-control" placeholder="" id="detail" name="userDetail"></textarea>
                </div>
              </div>

              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <button type="reset" class="btn btn-secondary btn-lg full-width">되돌리기</button>
              </div>
              <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <button type="submit" class="btn btn-primary btn-lg full-width">수정하기</button>
              </div>

            </div>
          </form>
        </div>
      </div>
<!--     </div> -->

<!-- 개인정보 수정 end -->     
       
       

<!-- Js effects for material design. + Tooltips -->
<script src="<%=application.getContextPath()%>/resources/js/material.min.js"></script>

<!-- Helper scripts (Tabs, Equal height, Scrollbar, etc) -->
<script src="<%=application.getContextPath()%>/resources/js/theme-plugins.js"></script>

<!-- Init functions -->
<script src="<%=application.getContextPath()%>/resources/js/main.js"></script>

<!-- Load more news AJAX script -->
<script src="<%=application.getContextPath()%>/resources/js/ajax-pagination.js"></script>

<!-- Select / Sorting script -->
<script src="<%=application.getContextPath()%>/resources/js/selectize.min.js"></script>

<!-- Datepicker input field script-->
<script src="<%=application.getContextPath()%>/resources/js/moment.min.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/daterangepicker.min.js"></script>

<!-- Widget with events script-->
<script src="<%=application.getContextPath()%>/resources/js/simplecalendar.js"></script>

<!-- Lightbox plugin script-->
<script src="<%=application.getContextPath()%>/resources/js/jquery.magnific-popup.min.js"></script>

<!-- Swiper / Sliders -->
<script src="<%=application.getContextPath()%>/resources/js/swiper.jquery.min.js"></script>
