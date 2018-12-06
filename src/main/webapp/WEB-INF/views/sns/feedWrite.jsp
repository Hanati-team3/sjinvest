<%@ page contentType="text/html; charset=utf-8"%>

<div class="ui-block">
        <div class="news-feed-form">

          <!-- Tab panes -->
          <div class="tab-content">
            <div class="tab-pane active" id="home-1" role="tabpanel"
              aria-expanded="true">
              <form action=/sos/feed/write method="post">
                <div class="author-thumb">
                  <img
                    src="<%=application.getContextPath()%>/resources/img/author-page.jpg" alt="author">
                </div>
                <div
                  class="form-group with-icon label-floating is-empty">
                  <textarea name="feedContent" class="form-control" placeholder="주식정보를 공유하여 주세요..!"></textarea>
                </div>
                <div class="add-options-message">
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="ADD PHOTOS"> 
                    <svg class="olymp-camera-icon" data-toggle="modal" data-target="#update-header-photo">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-camera-icon"></use></svg>
                  </a> 
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="TAG YOUR FRIENDS"> 
                    <svg class="olymp-computer-icon">
                    <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-computer-icon"></use></svg>
                  </a> 
                  
                  <a href="#" class="options-message" data-toggle="tooltip" data-placement="top" data-original-title="ADD LOCATION"> 
                     <svg class="olymp-small-pin-icon">
                     <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-small-pin-icon"></use></svg>
                  </a>

                  <button class="btn btn-primary btn-md-2">글올리기</button>

                </div>

              </form>
            </div>

          </div>
        </div>
      </div>