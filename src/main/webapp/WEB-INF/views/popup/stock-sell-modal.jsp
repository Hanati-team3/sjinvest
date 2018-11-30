<%@ page contentType="text/html; charset=utf-8" %>

  <!-- 판매 modal start -->
  <div class="modal fade" id="stock_sell_modal">
    <div class="modal-dialog ui-block window-popup create-event">
      <a href="#" class="close icon-close" data-dismiss="modal"
        aria-label="Close"> <svg class="olymp-close-icon">
          <use xlink:href="../resources/icons/icons.svg#olymp-close-icon"></use></svg>
      </a>

      <div class="ui-block-title">
        <h6 class="title">판매</h6>
      </div>

      <div class="ui-block-content">

        <div class="form-group label-floating is-empty">
          <label class="control-label">가격</label> 
          <input class="form-control" placeholder="" value="" type="text">
        </div>

        <div class="form-group label-floating is-empty">
          <label class="control-label">수량</label> 
          <input class="form-control" placeholder="" value="" type="text">
        </div>

        <div class="form-group label-floating is-empty">
          <label class="control-label">예상 구매액</label> 
          <input class="form-control" placeholder="" value="" type="text">
        </div>

        <div class="form-group label-floating is-empty">
          <label class="control-label">판매 후 잔액</label> 
          <input class="form-control" placeholder="" value="" type="text">
        </div>



        <button class="btn btn-breez btn-lg full-width">판매</button>

      </div>

    </div>
  </div>
  <!-- ... 판매 modal end  -->
