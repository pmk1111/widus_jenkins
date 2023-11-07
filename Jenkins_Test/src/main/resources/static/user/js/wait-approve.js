$(document).ready(function() {
    
	
$(".btn_move").click(function() {
    window.location.href = '../user/login';
}); // btn_mave end

$(".btn_cancel").click(function(){

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content"); 
console.log('header:', header);
console.log('token:', token);
	
	// 확인 다이얼로그
	swal({
  	title: "확인",
  	text: "회사 가입을 취소하시겠습니까?",
  	icon: "warning",
  	buttons: true,
	}).then((confirmed) => {
  if (confirmed) {
    
   $.ajax({
             url: "../user/cancel-join",
             beforeSend: function(xhr) {
                 xhr.setRequestHeader(header, token);
             },
             type: "POST",
             success: function(response) {
                 if (response === 1) {
                     swal("완료", "회사가입이 취소되었습니다.", "success");
  				     window.location.href = '../../myhome/';
                 } 
             }//success end
            
         }); //ajax end
     }//if end
});//.then end

	
})// btn_cancel end
})//document end
