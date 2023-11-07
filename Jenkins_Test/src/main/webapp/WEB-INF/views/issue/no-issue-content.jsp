<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if (${showAlert}==true) {
    alert('이슈가 존재하지 않습니다..');
    window.location.href = '../issue/issue-list';
}
</script>
</body>
</html>