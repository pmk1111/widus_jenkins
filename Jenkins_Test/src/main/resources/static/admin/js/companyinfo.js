// 회사명 수정
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#nameupdate").click(function() {
        // 입력 필드 활성화
        $("#companyName").prop("disabled", false);
        // 버튼 변경
        $("#nameupdate").addClass("d-none");
        $("#saveNameButton, #cancelNameButton").removeClass("d-none");
    });

    // 저장 버튼 클릭 시
    $("#saveNameButton").click(function() {
        // 입력 필드 비활성화
        $("#companyName").prop("disabled", true);
        // 버튼 변경
        $("#saveNameButton, #cancelNameButton").addClass("d-none");
        $("#nameupdate").removeClass("d-none");
    });

    // 취소 버튼 클릭 시
    $("#cancelNameButton").click(function() {
        // 입력 필드 비활성화
        $("#companyName").prop("disabled", true);
        // 버튼 변경
        $("#saveNameButton, #cancelNameButton").addClass("d-none");
        $("#nameupdate").removeClass("d-none");
    });


//url 수정
    // 수정 버튼 클릭 시
    $("#urlupdate").click(function() {
        // 입력 필드 활성화
        $("#companyDomain").prop("disabled", false);
        // 버튼 변경
        $("#urlupdate").addClass("d-none");
        $("#saveButton, #cancelButton").removeClass("d-none");
    });

    // 저장 버튼 클릭 시
    $("#saveButton").click(function() {
        // 입력 필드 비활성화
        $("#companyDomain").prop("disabled", true);
        // 버튼 변경
        $("#saveButton, #cancelButton").addClass("d-none");
        $("#urlupdate").removeClass("d-none");
    });

    // 취소 버튼 클릭 시
    $("#cancelButton").click(function() {
        // 입력 필드 비활성화
        $("#companyDomain").prop("disabled", true);
        // 버튼 변경
        $("#saveButton, #cancelButton").addClass("d-none");
        $("#urlupdate").removeClass("d-none");
    });

//주소 수정
    // 수정 버튼 클릭 시
    $("#addresspdate").click(function() {
        // 입력 필드 활성화
        $("#addr_dtl").prop("disabled", false);
        // 버튼 변경
        $("#addresspdate").addClass("d-none");
        $("#saveAddressButton, #cancelAdressButton").removeClass("d-none");
    });

    // 저장 버튼 클릭 시
    $("#saveAddressButton").click(function() {
        // 입력 필드 비활성화
        $("#addr_dtl").prop("disabled", true);
        // 버튼 변경
        $("#saveAddressButton, #cancelAdressButton").addClass("d-none");
        $("#addresspdate").removeClass("d-none");
    });

    // 취소 버튼 클릭 시
    $("#cancelAdressButton").click(function() {
        // 입력 필드 비활성화
        $("#addr_dtl").prop("disabled", true);
        // 버튼 변경
        $("#saveAddressButton, #cancelAdressButton").addClass("d-none");
        $("#addresspdate").removeClass("d-none");
    });
// 전용 URL 수정

$("#saveButton").click(function(){
	var companyId = $("#companyId").val();
	var companyDomain = $("#companyDomain").val(); 
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 

	if(!companyDomain){
    		alert('전용 URL을 입력하세요');
    		return false;
		}	
		else{
    // 서버로 업데이트 요청 보내기
    $.ajax({
        url: "../admin/updateName",
        type: "POST",
        data: {
            companyId: companyId,
            companyDomain: companyDomain
        },
        beforeSend: function(xhr) {
           xhr.setRequestHeader(header, token);
             },
        async: false,
        success: function(response) {
         if(updateName == 1){
         
         	alert ("업데이트 완료");
        }//if	 
        	
        }//success
    }); //ajax end
        }//else end
   }); //click end  


//회사명 수정
		
	$("#saveNameButton").click(function(){
	var companyId = $("#companyId").val();
	var companyName = $("#companyName").val() ;
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 

	if(!companyName){
    		alert('회사명을 입력하세요');
    		return false;
    		$("#companyName").focus();
		}	else{
    // 서버로 업데이트 요청 보내기
    console.log("여기는 ajax update")
    $.ajax({
        url: "../admin/updateName",
        type: "POST",
        data: {
            companyId: companyId,
            companyName: companyName
           
        },
 		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
             },        
        async: false,
        success: function(response) {
         if(updateName == 1){
         
         	alert ("업데이트 완료");
        	} 
        	
        }//success end
    }); //ajax end
         }//else end
   
});

//주소수정
		
	$("#saveAddressButton").click(function(){
	var companyId = $("#companyId").val();
	var companyZipcode = $("#zip_code").val() ;
	var companyAddress = $("#addr").val() ;
	var companyDetailAddress = $("#addr_dtl").val() ;
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content"); 

	if(!addr_dtl){
    		alert('상세주소를 입력하세요');
    		return false;
    		$("#addr_dtl").focus();
		}	else{
    // 서버로 업데이트 요청 보내기
    console.log("여기는 ajax update")
    $.ajax({
        url: "../admin/updateAddress",
        type: "POST",
        data: {
            companyId: companyId,
            companyZipcode: companyZipcode,
            companyAddress: companyAddress,
            companyDetailAddress: companyDetailAddress,
            
           
        },
 		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
             },        
        async: false,
        success: function(response) {
         if(updateName == 1){
         
         	alert ("업데이트 완료");
        	} 
        	
        }//success end
    }); //ajax end
         }//else end
   
});


  

});