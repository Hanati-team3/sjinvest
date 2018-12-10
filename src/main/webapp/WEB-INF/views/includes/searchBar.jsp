<%@ page contentType="text/html; charset=utf-8" %>
<div class="ui-block">
    <form class="w-search" style="width: 100%;" action="/sos/stock/search" method="get">
       <div class="form-group with-button is-empty">
          <input id="autocompleteT" class="form-control" type="text" name="keyword" placeholder="회사명/업종 검색...">
          <button style="background-color: #3f4257;">
            <svg class="olymp-magnifying-glass-icon">
              <use xlink:href="<%=application.getContextPath()%>/resources/icons/icons.svg#olymp-magnifying-glass-icon"></use></svg>
          </button>
          <span class="material-input"></span>
       </div>
    </form>
</div>
<script type="text/javascript">
$(function(){
	$('#autocompleteT').autocomplete({
        source : function(request, response) {
            $.ajax({
                type : 'get',
                url : "<%=application.getContextPath()%>/stock/searchAuto",
                data : {
                    term : request.term
                },
                dataType: "json",
                success : function(data) {
                	console.log(data);
                	response(
                           $.map(data, function(item) {
                               return {
                                   label: item,
                                   value: item
                               }
                           })
                       );
                }
            });
        }
    });
 });
 </script>
              