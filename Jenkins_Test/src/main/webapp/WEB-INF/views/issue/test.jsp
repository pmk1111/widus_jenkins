<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<jsp:include page="../template/cssTemplate.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="../resources/issue/css/issue-create.css">
 -->
</head>
<body>
<!-- 	<button type="button" class="create-issue">글쓰기</button>
 -->

<div class="issue-modal">
	<div class="modal-overlay"></div>
	<form action="../issue/upload" name="createIssue" method="post" enctype="multipart/form-data">
	
		<div class="issue-modal-content">

			
			<!-- HTML -->
			<div class="file-upload-wrap">
    		<div class="text">
        	<span>파일 첨부</span>
    		</div>
    		
    		<label class="custom-file-upload">파일첨부
    			<input type="file" class="add-file" name="uploadfiles" multiple>
    		</label>
			</div>
			<div class="uploaded-files"></div>

			
			<div class="submit-reset-btn-wrap">
				<button type="button" class="close-btn">취소</button>
				<button type="submit" class="submit-btn">제출</button>
			</div>

			</div>
		</form>	
</div>






	<script src="../resources/issue/js/issuelist.js"></script>
	<script src="../resources/issue/js/issuecreate.js"></script>


</body>
</html>