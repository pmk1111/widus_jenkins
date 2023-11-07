<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.Enumeration"%>
<html class="light-style layout-menu-fixed" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>회원관리 - 회원수정 페이지</title>

    <meta name="description" content="" />

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>
    <link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">


    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }


        .changepwd {
            background-color: white;
            border: 1px solid #d9dee3;
            color: #697a8d;
            border-radius: 5px;
        }

        .pwdsubmit {
            border: 1px solid #d9dee3;
            background-color: white;
            color: #697a8d;
            box-shadow: none;
            border-radius: 5px;
        }

        #fileName {
            font-size: 13px;
        }

        .pb-JJ {
            padding-bottom: 0px !important;
            padding-top: 25px !important;
        }
        
        .chatting-layer{
        	left:78%
        }
        .notify-layer{
        	left:74%;
        }
    </style>
    <script>
        const result = "${result}";
        if (result == 'success') {
            alert("회원 정보가 수정되었습니다.")
        }
    </script>
</head>

<body>

    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">

            <jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
			

            <div class="layout-page">

                <jsp:include page="../mainboard/navbar.jsp"></jsp:include>
                <div class="content-wrapper">
                    <div class="container-xxl flex-grow-1 container-p-y">
                    <jsp:include page="../chat/chat.jsp"></jsp:include>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-4" style="display: flex; align-items: center;">
                                    <h4 class="fw-bold py-3 mb-4 pb-JJ">내 정보</h4>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">

                                <form id="formAccountSettings" method="POST" action="../user/update-process" enctype="multipart/form-data">
                                   <input type="hidden" name="pic" value="${userinfo.pic}">
                                    <div class="card mb-4">
                                        <h5 class="card-header">프로필</h5>

                                        <div class="card-body profile-img" style="height: 600px;">
                                            <div class="d-flex align-items-start align-items-sm-center gap-4">


                                                <div style="width:45%; height:300px; border-right:1px solid #ccc; display: flex; flex-direction: column; align-content: center; justify-content: space-evenly; margin-top:100px; align-items: center;">

                                                    <div>
                                                        <c:choose>

                                                            <c:when test="${not empty userinfo.pic}">
                                                                <img src="${pageContext.request.contextPath}/upload${userinfo.pic}" alt="프로필 사진" class="d-block rounded" height="150" width="150" id="uploadedAvatar" />
                                                            </c:when>

                                                            <c:otherwise>
                                                                <img src="${pageContext.request.contextPath}/user/assets/img/avatars/profile.png" alt="기본 프로필 사진" class="d-block rounded" height="150" width="150" id="uploadedAvatar" />
                                                            </c:otherwise>

                                                        </c:choose>
                                                    </div>

                                                    <div class="button-wrapper">
                                                        <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                                            <span class="d-none d-sm-block">이미지 변경</span>
                                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                                        </label>

                                                        <button type="button" class="btn btn-outline-secondary account-image-reset mb-4" id="cancelBtn" >
                                                            <i class="bx bx-reset d-block d-sm-none"></i>
                                                            <span class="d-none d-sm-block">취소</span>
                                                        </button>
                                                        

                                                        <div id="filename">
                                                            <input type="file" id="upload" name="uploadfile" value="${userinfo.pic}" class="account-file-input" accept="image/png, image/jpeg" style="display: none;" />
                                                        </div>
                                                    </div>

                                                </div>


                                                <div style="width:65%; margin-top:50px; padding-right: 100px;">

                                                    <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                                                        <li class="nav-item" role="presentation">
                                                            <button class="nav-link team-tab my-tab active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">내 정보</button>
                                                        </li>
                                                        <li class="nav-item" role="presentation">
                                                            <button class="nav-link invite-tab com-tab" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">회사 정보</button>
                                                        </li>
                                                        <li class="nav-item" role="presentation">
                                                            <button class="nav-link invite-tab exit-tab" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">회원 탈퇴</button>
                                                        </li>
                                                    </ul>

                                                    <div class="my-info" style="display:flex; flex-direction: column; justify-content: center; margin-top:30px">

                                                        <div class="mb-3 col-md-6">
                                                            <label for="email" class="form-label">이메일</label>
                                                            <input class="form-control" type="text" id="email" name="email" value="${userinfo.email}" required readOnly />
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <label for="name" class="form-label">이름</label>
                                                            <input class="form-control" type="text" name="name" id="name" value="${userinfo.name}" />
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <label class="form-label" for="tel">휴대폰 번호</label>
                                                            <input type="text" id="phone" name="phone" class="form-control" placeholder="연락처를 등록 해 보세요!" value="${userinfo.phone}" />
                                                        </div>

                                                        <div class="card-footer" style="display:flex; flex-direction: row; align-items: center; justify-content: space-between; padding:0;">

                                                            <div class="changepassword">
                                                                <button type="button" class="changepwd"><a href="${pageContext.request.contextPath}/user/change-pwd"> 비밀번호 변경</a></button>
                                                            </div>

                                                            <div class="mt-2">
                                                                <button type="submit" class="btn btn-primary me-2" id="updateProfile">저장</button>
                                                                
                                                                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                 
                                                                <button type="reset" class="btn btn-outline-secondary" onclick="history.back();">취소</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="company-info" style="display:none; margin-top:30px; margin-bottom: 63px;">

                                                        <div class="mb-3 col-md-6">
                                                            <div>
                                                                <label for="company" class="form-label">회사</label>
                                                                <input type="text" class="form-control" id="company" name="company" value="${userinfo.companyName}" required readOnly />
                                                            </div>
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <div>
                                                                <label for="company" class="form-label">부서</label>
                                                                <input type="text" class="form-control" id="company" name="company" value="${userinfo.department}" required readOnly />
                                                            </div>
                                                        </div>

                                                        <div class="mb-3 col-md-6">
                                                            <div>
                                                                <label for="company" class="form-label">직책</label>
                                                                <input type="text" class="form-control" id="company" name="company" value="${userinfo.position}" required readOnly />
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="exit-user" style="display:none; margin-top:100px; margin-bottom: 78px;">
                                                        <div class="mb-3 col-12 mb-0">
                                                            <div class="alert alert-warning">
                                                                <h6 class="alert-heading fw-bold mb-1">정말로 탈퇴하시겠습니까?</h6>
                                                                <p class="mb-0">탈퇴시 모든 정보를 더 이상 확인할 수 없습니다.</p>
                                                            </div>
                                                        </div>
                                                        <div class="form-check mb-3" style="display:flex; justify-content: space-between; align-items: center; margin-top:30px;">
                                                        	<div>
	                                                            <input class="form-check-input" type="checkbox" name="agreeDelete" id="agreeDelete" />
	                                                            <label class="form-check-label" for="accountActivation">동의합니다.</label>
                                                            </div>
                                                            
                                                            <button type="button" class="btn btn-danger deactivate-account" id="deleteUser" herf="../user/delete">탈퇴</button>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="content-footer footer bg-footer-theme">
        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
            <div class="mb-2 mb-md-0">
                ©
                <script>
                    document.write(new Date().getFullYear());
                </script>
                (주)WidUs
            </div>
            <div>
                <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a> <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a> <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a> <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
            </div>
        </div>
    </footer>
    <!-- Footer -->

    <div class="layout-overlay layout-menu-toggle"></div>

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    <script src="../resources/user/js/profile.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            $(".my-tab").click(function(){
                $(".my-info").show();
                $(".company-info").hide();
                $(".exit-user").hide();
            });

            $(".com-tab").first().click(function(){
                $(".company-info").show();
                $(".my-info").hide();
                $(".exit-user").hide();
            });

            $(".exit-tab").last().click(function(){
                $(".exit-user").show();
                $(".my-info").hide();
                $(".company-info").hide();
            });
        });
        
  
    </script>
</body>

</html>