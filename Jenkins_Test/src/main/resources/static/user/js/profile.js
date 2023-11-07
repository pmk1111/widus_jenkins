$(document).ready(function() {
    
	let check = 0;
	$("#formAccountSettings").submit(function(){
	
   	event.preventDefault();
	
	if(check == 0){
		const value = $('#pic').val();
		const html = "<input type='hidden' value='" + value + "' name='check'>";
		$(this).append(html);
	} 
		this.submit();


	}) //$("#formAccountSettings") end
	
	   $('#upload').change(function(event){   
      const inputfile = $(this).val().split('\\');
      const filename = inputfile[inputfile.length - 1]; //inputfile.length - 1 = 2

      const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
      if(pattern.test(filename)){
         
         $('#filevalue').text(filename);
         
         const reader = new FileReader();   //파일을 읽기 위한 객체 생성
           reader.readAsDataURL(event.target.files[0]);
          reader.onload = function(){   //읽기에 성공했을 때 실행되는 이벤트 핸들러
         $('.profile-img  img').attr('src', this.result);  
        };
      } else {
         alert('이미지 파일(gif,jpg,jpeg,png)이 아닌 경우는 무시됩니다.');
         $(this).val('')
      }
      
      check++;
      console.log(check);
     
   })
	
     		
	$('#deleteUser').click(function() {
        if (!$('#agreeDelete').is(':checked')) {
            alert('동의버튼에 체크해주세요.');
            return false;
        } else {
        	alert('회원탈퇴 되었습니다. 홈으로 이동합니다');
        }
    }); //$('#deleteUser').click(function() { end
   $('#updateProfile').click(function(){
    	var phone=$("#phone").val();
   	    var regPhone=/^010-?([0-9]{4})-?([0-9]{4})$/;

        if(phone != "" && regPhone.test(phone) == false){
        	alert('전화번호를 형식에 맞게 입력해주세요');
        return false;
   		}
	}); // $('#updateProfile').click(function(){ end
})//document end