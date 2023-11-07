
function chkAuthMailNum() {		
	var authRandNum = $("#authRandNum").val();
    var inAuthMailNum = $("#verify").val();	//입력받은 인증번호
    
    const $verifyMessage = $("#verify_message");	//오류를 출력하기 위한 메세지태그

    if(authRandNum === ''){
    	$verifyMessage.attr("style","visibility:visible");
        $verifyMessage.html('인증번호받기 버튼을 눌러 인증번호를 받으세요.');
        return;	
    }
    if(inAuthMailNum === '') {
    	$verifyMessage.attr("style","visibility:visible");
        $verifyMessage.html('인증번호를 입력하세요.');
        return;
    }
    if (inAuthMailNum == $("#authRandNum").val()) {
        alert("인증성공");
        $("#isChkverify").val("Y");
        $verifyMessage.attr("style","visibility:hidden");
    } else {
        alert("인증실패");
        $("#isChkverify").val("N");
    }
}

function printErrMsg(id,msg,color){
	const printErrObj = $("#"+id);
	printErrObj.html(msg);
	printErrObj.attr("style","visibility:visible");
	
	if(color != undefined && color != ""){
		printErrObj.css("color",color);
	}else{
		printErrObj.css("color","red");
	}
}

function emailValCheck(email) {
    if (email === '') return "empty";
    const emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    return emailPattern.test(email) ? "valid" : "invalid";
}


$(document).ready(function () {
	
    $("#chkIdBtn").on('click', function () {
        const pattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{5,12}$/;
        const id = $("#userId").val();
        
        if (id == "") {
        	printErrMsg('id_message','아이디를 입력하세요.');
			return;
        }

        if (!pattern.test(id)) {
        	printErrMsg('id_message','영문, 숫자 조합하여 5~12글자까지 가능합니다.');
			return;
        }

        $("#id_message").attr("style","visibility:hidden");

        $.ajax({
            url: "idcheck.net",
            data: { "id": id },
            success: function (resp) {
                if (resp == -1) {
                	printErrMsg('id_message','사용가능한 아이디입니다.','green');
                    $("#isChkId").val("Y");
                } else {
                	printErrMsg('id_message','사용 중인 아이디입니다.');
                    $("#isChkId").val("N");
                }
            }
        });
    });

    $("#password").on('focusout', function () {
        const pass = $("#password").val();
        const pattern = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{5,12}$/;

        if (!pattern.test(pass)) {
        	printErrMsg('pw_message','영문자 숫자로 5~12자 가능합니다.');
            $("#isChkPassword").val("N");
        } else {
        	printErrMsg('pw_message','사용 가능한 비밀번호입니다.','green');
            $("#isChkPassword").val("Y");
        }
    });

    $("#userName").on('focusout', function () {
        const name = $("#userName").val();
        const pattern = /^([가-힣]{2,4}|[a-zA-Z]{2,15})$/;
        if (!pattern.test(name)) {
        	printErrMsg('name_message','한글 2~4자 또는 영문 2~15자 가능합니다.');
            $("#isChkName").val("N");
        } else {
        	printErrMsg('name_message','사용 가능한 이름입니다.','green');
            $("#isChkName").val("Y");
        }
    });

    $("#confirmPassword").on('focusout', function () {
        const pass = $("#password").val();
        const passwd = $("#confirmPassword").val();
       
        const $passwdMessage = $("#pw_check_message");

        if (pass !== '' && passwd !== '' && pass !== passwd) {
        	printErrMsg('pw_check_message','비밀번호가 다릅니다.');
            $("#isChkPassword2").val("N");
        } else {
        	$('#pw_check_message').attr("style","visibility:hidden");
            $("#isChkPassword2").val("Y");
        }
    });

    
    var emailAuthTimer;
    var sendMailAble = 'Y';
    
    $("#emailAuthBtn").on("click", function () {
        const email = $("#email").val();
        const emailCheckResult = emailValCheck(email);
        
        if (emailCheckResult === "empty") {
         	printErrMsg('email_message','이메일을 입력하세요.');
            return false;
        } else if (emailCheckResult === "invalid") {
        	printErrMsg('email_message','이메일 형식에 맞게 입력하세요.');
            return false;
        } else
        	printErrMsg('name_message','사용 가능한 이메일입니다.','green');
        	$("#isChkEmail").val("Y");
        
        if(sendMailAble =="N"){
        	printErrMsg('email_message','1분 후 다시 발송가능합니다.');
            return false;
        }
        $('#email_message').attr("style","visibility:hidden");

        var url = "confirmEmail.net";
        alert("인증번호가 발송되었습니다.");

        $.ajax({
            url: url,
            data: { email: email },
            success: function (resp) {
                $("#authRandNum").val(resp);
            },
        });

        // 타이머를 시작합니다. 초(60000ms) 후에 버튼을 다시 활성하고 텍스트를 변경합니다.
        clearTimeout(emailAuthTimer);
        sendMailAble="N";
        emailAuthTimer = setTimeout(function () {
            printErrMsg('email_message','이메일을 입력하세요.','green');
            clearTimeout(emailAuthTimer);
            sendMailAble="Y";
        }, 60000);
    });

    $("#verifyBtn").on("click", function () {
        chkAuthMailNum();
    });
   
});



function validationcheck() {
 	const isChkId = $("#isChkId").val();
    const isChkPassword = $("#isChkPassword").val();
    const isChkName = $("#isChkName").val();
    const isChkPassword2 = $("#isChkPassword2").val();
    const isChkEmail = $("#isChkEmail").val();
    const isChkverify = $("#isChkverify").val();
    const isChkpolicy = $("#isChkpolicy").val();

    if (isChkId !== "Y") {
        alert('아이디를 확인하세요.');
        $("#userId").focus();
        return false;
    }

    if (isChkPassword !== "Y") {
        alert('비밀번호를 확인하세요.');
        $("#password").focus();
        return false;

    }

    if (isChkName !== "Y") {
        alert('이름을 확인하세요.');
        $("#userName").focus();
        return false;
    }

    if (isChkPassword2 !== "Y") {
        alert('비밀번호를 다시 확인하세요.');
        $("#password").focus();
        return false;
    } 
    if (isChkEmail !== "Y") {
        alert('이메일을 확인하세요');
        $("#email").focus();
        return false;
    } 
    if (isChkverify !== "Y") {
        alert('인증번호를 확인하세요');
        $("#verify").focus();
        return false;
    } 
    if ($("#policyCheckbox").is(":checked") != true) {
        alert('서비스 이용약관 동의는 필수입니다.');
        $("#policyCheckbox").focus();
        return false;
    } 
    

    $("#joinform").submit();
}
