<%@ page contentType="text/html; charset=utf-8" %>
<div class="ui-block">

  <div class="ui-block-title">
    <a href="#"><h6>나의 주식정보</h6></a>
  </div>

  <ul class="widget w-activity-feed notification-list">

    
        <%-- 관심종목 목록 row 시작 --%>
        <div class="row">
          <%-- 관심종목 목록 카드 시작 --%>
          <div class="col-xl-12 order-xl-1 col-lg-12 order-lg-1 col-md-12 order-md-1 col-sm-12 col-xs-12">
              
              
              <table class="forums-table wow">
                <thead style="background: white;" >
                  <tr>
                    <th class=company-name><font color="black">기업명</font></th>
                    <th class="now-price"><font color="black">매수량</font></th>
                    <th class="chang-percent"><font color="black">임시입니다.</font></th>
                  </tr>
                </thead>
    
                <tbody id="mystock-info">
                
                <!-- 현재주가, 등락률 값 못 받아옴.. -->
                  <!-- <tr>
                    <td class="company-name">
                      <div class="author-freshness">
                        <a href="#" class="h6 title">하나금융지주</a>
                      </div>
                    </td>
                    
                    <td class="stock-price">
                      <a href="#" class="h6 count">38,750</a>
                    </td>

                    <td class="day-before-rate">
                      <div class="author-freshness plus">
                        <a href="#" class="h6 title">+ 1.90 %</a>
                      </div>
                    </td>
                  </tr> -->
                  
                  
                </tbody>
              </table>
          </div>
          <%-- 관심종목 목록 카드 끝 --%>
        </div>
        <%-- 관심종목 목록 row 끝 --%>
    

  </ul>
</div>