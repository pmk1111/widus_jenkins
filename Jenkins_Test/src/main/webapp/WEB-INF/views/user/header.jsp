<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

.container-xxl {
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
    #header {
        background-color: #9F7AB0;
    }
</style>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<!-- ======= Header ======= -->
<header id="header" style="position: sticky; top: 0; z-index: 100;">
    <div class="container d-flex align-items-center">

        <h1 class="logo me-auto"><a href="${pageContext.request.contextPath}">WidUs</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto" href="../#hero">홈</a></li>
                <li><a class="nav-link scrollto" href="../#about">소개</a></li>
                <li><a class="nav-link scrollto" href="../#team">팀</a></li>
                <!-- <li><a class="nav-link   scrollto" href="#portfolio">Portfolio</a></li> -->
                <li><a class="nav-link scrollto" href="../#contact">오시는 길</a></li>
                <li class="dropdown"><a href="#"><span>접속 하기</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="../user/login">로그인</a></li>
                        <li class="dropdown"><a href="../user/join"><span>회원가입</span></a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </li>
            </ul>
        </nav><!-- .navbar -->
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </div>
    
</header><!-- End Header -->
