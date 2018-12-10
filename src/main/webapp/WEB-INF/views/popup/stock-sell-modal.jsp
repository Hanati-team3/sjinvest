<%@ page contentType="text/html; charset=utf-8" %>

  <!-- 판매 modal start -->
  <div class="modal fade" id="stock_sell_modal">
    <div class="modal-dialog ui-block window-popup create-event">
      <a href="#" class="close icon-close" data-dismiss="modal"
        aria-label="Close"> <svg class="olymp-close-icon">
          <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-close-icon"></use></svg>
      </a>

      <div class="ui-block-title">
        <h6 class="title">판매</h6>
      </div>

      <div class="ui-block-content">
        <input hidden="true" id="sell-modal-company-number"></input>
        <input hidden="true" id="sell-modal-company-name"></input>
        <div class="form-group label-floating">
          <label class="control-label">가격</label> 
          <input class="form-control" id="price" placeholder="" value="." type="text" readonly="readonly">
        </div>

        <div class="form-group label-floating is-empty">
          <label class="control-label">수량</label> 
          <input class="form-control" id="amount"  placeholder="" value="" type="number" min="0">
        </div>
        
        <div class="form-group label-floating">
          <label class="control-label">현재보유수량</label> 
          <input class="form-control" id="sell-modal-holding-amount"  placeholder="" value="0" type="number" readonly="readonly">
        </div>

        <div class="form-group label-floating">
          <label class="control-label">예상 판매액</label> 
          <input class="form-control" id="totalPrice" placeholder="" value="." type="text" readonly="readonly">
        </div>

        <div class="form-group label-floating">
          <label class="control-label">판매 후 잔액</label> 
          <input class="form-control" id="balance" placeholder="" value="${user.userMoney}" type="text" readonly="readonly">
        </div>

        <button class="btn btn-breez btn-lg full-width" id='sell-button'>판매</button>

      </div>

    </div>
  </div>
  <!-- ... 판매 modal end  -->
