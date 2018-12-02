$(document).ready(function () {
   $.ajax({
      type: 'POST',
      data: { 설비명: 'M3500', 이름: '보관실' },
       url: '@Url.Action("detail_view","home")',
       success: function (result) {
       $('#M3500').html(result);
       
       }
       })
});