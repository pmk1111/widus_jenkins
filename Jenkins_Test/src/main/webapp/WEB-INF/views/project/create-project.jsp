<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
<title>프로젝트 생성</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
    <link href="../resources/project/css/createProject.css" rel="stylesheet">
        <style>
    	body {
    		font-family: 'Nanum Gothic', sans-serif;
    	}
    	
    	.on {
    		font-weight:700
    	}
    	</style>
</head>
<body>
	<form action="create" method="Post" name="projectform">
	<div class="create-header">
		<a class="create-close"></a>
	</div>

	<div class="card">
		<div class="CreateProject">
			<div style="display:flex; justify-content: space-between; border-bottom: 1px solid #ccc; padding-bottom: 20px;">
				<span id="header-span">프로젝트 생성</span>
			</div>

			<div class="create-input-info">
				<input name="TITLE" class="create-inputbox" type="text" placeholder="제목을 입력하세요">
				<div style="margin-top: 15px;">
					<textarea name="SUBTITLE" class="create-textarea" placeholder="프로젝트를 간단히 소개해보세요"></textarea>
				</div>
			</div>
			
			<input type="hidden" name="employeeId" value="${employeeId}">
			
			<div style="display:flex">
<!-- 				<button class="invite-button">팀원 초대하기</button> -->
				<button class="create-button on">프로젝트 생성하기</button>
			</div>
		</div>
	</div>

	<div class="background-img">
		<img id="background-img"
			src="../resources/project/img/template-bg.png">
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {
	    	$('.card').addClass('card-animate');
	    	
	    	$(".create-close").click(function(event) {
	    	    event.preventDefault();
	    	    history.back();
	    	});	    	
	});
</script>
</body>
</html>