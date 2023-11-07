<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../resources/mainboard/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>가입대기</title>
<meta name="description" content="" />

<link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="../resources/user/js/wait-approve.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../resources/mainboard/assets/js/config.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.light-style {
			animation: fadein .8s;
		}

		@keyframes fadein {
			from { 
				opacity:0;
				transform: translate3d(0, -5%, 0);
			}
			to {
				opacity: 1;
				transform: translateZ(0);
			}
		}

.container {
    margin-top: 65px;
}

.card {
	width: 100%;
	height: 100%;
}

}

.cancel-link {
	cursor: pointer;
	text-decoration: underline;
}


.card {
	height: 800px;
}

.button {
	float: left;
	min-width: 150px;
	max-width: 250px;
	display: block;
	margin: 1em;
	padding: 1em 2em;
	border: none;
	background: none;
	color: #fff;
	vertical-align: middle;
	position: relative;
	z-index: 1;
	-webkit-backface-visibility: hidden;
	-moz-osx-font-smoothing: grayscale;
}
.button:focus {
	outline: none;
}
.button > span {
	vertical-align: middle;
}

.button--nuka {
	margin: 1em 2em;
	-webkit-transition: color 0.3s;
	transition: color 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--nuka.button--inverted {
	color: #fff;
}
.button--nuka::before,
.button--nuka::after {
	content: '';
	position: absolute;
	border-radius: inherit;
	background: #9F7AB0;
	z-index: -1;
}
.button--nuka::before {
	top: -4px;
	bottom: -4px;
	left: -4px;
	right: -4px;
	opacity: 0.2;
	-webkit-transform: scale3d(0.7, 1, 1);
	transform: scale3d(0.7, 1, 1);
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
	transition: transform 0.3s, opacity 0.3s;
}
.button--nuka::after {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	-webkit-transform: scale3d(1.1, 1, 1);
	transform: scale3d(1.1, 1, 1);
	-webkit-transition: -webkit-transform 0.3s, background-color 0.3s;
	transition: transform 0.3s, background-color 0.3s;
}
.button--nuka::before,
.button--nuka::after {
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.button--nuka.button--inverted::before,
.button--nuka.button--inverted::after {
	background: #fff;
}
.button--nuka:hover {
	color: #fff;
}
.button--nuka:hover::before {
	opacity: 1;
}
.button--nuka:hover::after {
	background-color: #75508F;
}
.button--nuka.button--inverted:hover::after {
	background-color: #75508F;
}
.button--nuka:hover::after,
.button--nuka:hover::before {
	-webkit-transform: scale3d(1, 1, 1);
	transform: scale3d(1, 1, 1);
}

.button--round-s {
	border-radius: 5px;
}

.button--text-thick {
	font-weight: 600;
}
</style>
</head>

<body>

	<div class="container">
		<div class="card">
			<form action="admin/wait-approve" method="GET">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					 
				
				<h2 style="text-align: center; margin-top: 100px;">가입 요청 완료</h2>
				<img src="../resources/admin/image/wait.png"
					style="width: 400px; height: 300px; margin-left: 37%;" /> <br>
				<h4 style="text-align: center;">회사 관리자에게 가입 요청</h4>
				<p style="text-align: center;">관리자 승인 완료 시 접속할 수 있습니다.
				
				<div style="display: flex; justify-content: space-evenly; align-items: center; flex-direction: row; margin-top: 5%">
				
					<div class="moveToLogin" style="margin-left:20%">
						<button type="button" class="button button--nuka button--round-s button--text-thick btn_move" style="width:250px;">로그인페이지로 이동</button>
					</div>
									
					<div class="cancelwait" style="margin-right:20%">
						<button type="button" class="button button--nuka button--round-s button--text-thick btn_cancel" style="width:250px;">가입 요청 취소</button>
					</div>					
				
				</div>
			</form>
		</div>
	</div>

</body>
</html>