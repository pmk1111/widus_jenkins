
$(document).ready(function() {
    $("#cancelButton").click(function() {
        window.history.back(); // 브라우저의 이전 페이지로 이동
    });
    var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 
	console.log("토큰 값 = " + token);
	console.log("헤더 값 = " + header);

	$("#usedPwd").on("keyup", function(event){
		if($("#usedPwd").val()==""){
			alert("현재 비밀번호를 입력해주세요");
			return false
		}
		 var email = "${email}";
         var usedPwd =$("#usedPwd").val();
         console.log(email)
         console.log(usedPwd)
   
         $.ajax({
             url: "check-pwd",
             beforeSend: function(xhr) {
                 xhr.setRequestHeader(header, token);
             },
             async:false,
             type: "POST",
             data : $("#changePassword").serializeArray(),
             success: function(data) {
                 if (data === 0) {
                     $("#message").text("비밀번호가 일치하지 않습니다.").css("color","red");
                     return false;
                 } else if(data==1){
                	  $("#message").text("");
                    $(".new").css("display","block");
                    $(".btnArea").css("display","block");
                	$("#newPwd").focus();
                       
                     }
                 }
            
         });
	})
		$("#changePassword").on("submit", function(event){
			
			var regPass= /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,15}$/;  
			
			if($("#newPwd").val()==""){
				alert("새 비밀번호를 입력해주세요");
				$("#newPwd").focus();
				return false;
			} else if($("#usedPwd").val() == $("#newPwd").val()){
				alert("현재 비밀번호와 새로운 비밀번호가 같습니다.");
				$("#newPwd").focus();
				return false;
			}else if(!regPass.test($("#newPwd").val())) {
  			    alert("비밀번호는 6~15자리이며, 최소 하나의 대문자, 소문자, 숫자를 포함해야 합니다.")
   			    $("#newPwd").focus();
    			return false;
			} 
			
			if($("#checkPwd").val()==""){
				alert("변경비밀번호를 입력해주세요");
				$("#checkPwd").focus();
				return false;
			}
			
			if ($("#newPwd").val() != $("#checkPwd").val()) {
				alert("새로운 비밀번호가 일치하지 않습니다.");
				$("#checkPwd").focus();
				return false;
			}	
			else {
				alert("비밀번호가 변경되었습니다. 로그인페이지로 이동합니다.")
	        }
	
	});//submit end
});//document end
