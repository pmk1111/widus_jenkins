<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>

    <title>WidUs - AssignIssue</title>
    <link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/issue/css/issue-list.css">

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>




    <style>
        table {
            table-layout: fixed;
            width: 100%;
            margin: 0 auto;
        }

        .card {
            box-shadow: 0 20px 27px 0 rgba(0, 0, 0, 0.05);
            padding-bottom: 20px;
        }

        .avatar.sm {
            width: 2.25rem;
            height: 2.25rem;
            font-size: .818125rem;
        }

        .table-nowrap .table td,
        .table-nowrap .table th {
            white-space: nowrap;
        }

        .table>:not(caption)>*>* {
            padding: 0.75rem 1.25rem;
            border-bottom-width: 1px;
        }

        table th {
            font-weight: 600;
            background-color: #eeecfd !important;
            width: 25%;

        }

        .fa-arrow-up {
            color: #00CED1;
        }

        .fa-arrow-down {
            color: #FF00FF;
        }

        .hover-lift-light {
            transition: box-shadow .25s ease, transform .25s ease, color .25s ease,
                background-color .15s ease-in;
        }

        .text-decoration-none {
            text-decoration: none !important;
        }

        .py-4 {
            padding-top: 1.5rem !important;
            padding-bottom: 1.5rem !important;
        }

        .align-items-center {
            align-items: center !important;
        }

        .border-0 {
            border: 0 !important;
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(30, 46, 80, .09);
            border-radius: 0.25rem;
        }

        .icon-circle {
            position: relative;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 3.2rem;
            height: 3.2rem;
            border-radius: 50%;
        }

        .bg-pastel-primary {
            background-color: #e9f3ff !important;
        }

        .mt-6 {
            margin-top: 4rem !important;
        }

        .mb-4 {
            margin-bottom: 1.5rem !important;
        }

        .badge {
            padding: 0.4rem 0.65rem 0.25rem;
        }

        .text-uppercase-bold-sm {
            text-transform: uppercase !important;
            font-weight: 500 !important;
            letter-spacing: 2px !important;
            font-size: .85rem !important;
        }

        .icon-circle[class*=text-] [fill]:not([fill=none]),
        .icon-circle[class*=text-] svg:not([fill=none]),
        .svg-icon[class*=text-] [fill]:not([fill=none]),
        .svg-icon[class*=text-] svg:not([fill=none]) {
            fill: currentColor !important;
        }

        .shadow-sm {
            box-shadow: 0 .125rem .25rem rgba(35, 38, 45, .09) !important;
        }

        .input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3),
        .input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .input-group-lg>.btn,
        .input-group-lg>.form-control,
        .input-group-lg>.form-select,
        .input-group-lg>.input-group-text {
            padding: 0.5rem 1rem;
            font-size: 1.25rem;
            border-radius: 0.3rem;
        }

        .input-group-text {
            display: flex;
            align-items: center;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #1f2c73;
            text-align: center;
            white-space: nowrap;
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
        }

        /* 추가된 스타일: 드롭다운 초기 숨김 */
        .sub-row {
            display: none;
        }

        /* 추가된 스타일: 드롭다운 표시 스타일링 */
        .main-row.open .sub-row {
            display: table-row;
            margin-left: 20px;
            /* 들여쓰기를 조절하기 위한 스타일 추가 */
        }

        /* 추가된 스타일: 상위 행 클릭 가능한 커서 스타일 */
        .main-row {
            cursor: pointer;

        }

        h6 {
            margin: auto;
            padding: auto;
        }
        
        .issuewriter-created {
        	margin-right: -10px;
        	font-size:13px;
        }
        
        ul {
        	padding-left:0;
        }
        
        .project-div:hover {
        	background-color:#f6f6f6;
        }
        
        .issue-writer{
        	width:80px
        }
        
        .issue-writer+.issue-created{
        	margin:0
        }
        
        .issuewriter-created{
        	margin-right:20px
        }
        
    </style>
</head>

<body>
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
            <jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
            <!-- / Menu -->
            <div class="layout-page">
                <!-- Navbar -->
                <jsp:include page="../mainboard/navbar.jsp"></jsp:include>
                <!-- / Navbar -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <div class="col-lg-12 mb-4 order-0 welcome-message">
                                <div class="container-fluid">
                                    <div class="card" style="align-items: center;">
                                        <div class="card-body" style="height:780px; padding: 50px; width:100%">
                                            <div class="card-header-0" style="display:flex; flex-direction: row; justify-content: space-between; align-items: center;">
                                                <h3 style="font-size: 27px; font-weight: 800; color: #555; margin-bottom:0;">내 작업보드</h3>
                                             <form>
                                                <div style="display:flex; align-items: center;">
                                                    <input type="text" name="search_word" id="searchInput" class="form-control bg-white border-0 px-1" placeholder="검색어를 입력하세요" style="height: 45px; width: 300px; border:1px solid #555 !important;">
                                                    <span class="input-group-text border-0 py-1 pe-2">
                                                        <button type="submit" class="btn btn-primary text-uppercase-bold-sm" id="searchButton" style="height: 45px;">검색</button>
                                                    </span>
                                                </div>
                                            </div>
                                            </form>

                                            <div style="margin-top:50px; width:100%; border-bottom:1px solid #888;">
                                                <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link team-tab my-tab active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">참여중인 프로젝트</button>
                                                    </li>
                                                </ul>
                                            </div>

                                            <c:choose>
                                                <c:when test="${empty myTotalWorks && empty search_word }">
                                                    <h6 style="text-align: center; margin-top: 100px;">내 업무가 없습니다.</h6>
                                                </c:when>
                                                <c:when test="${empty myTotalWorks && !empty search_word }">
                                                    <h6 style="text-align: center; margin-top: 100px;">검색 결과가 없습니다.</h6>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="margin-top:30px; overflow-x:hidden; overflow-y:scroll; max-height: 530px">
                                                        <c:forEach items="${myTotalWorks}" var="project" varStatus="projectStatus">
                                                        <div class="project">
                                                            <div class="project-div" style="display:flex; align-items: center; justify-content: space-between; padding: 15px 0;">
                                                                <div class="project-left">
                                                                    <a class="select-color" style="background-color: ${project.COLOR}"></a>
                                                                    <div class="project-information">
                                                                        <div class="project-up">
                                                                            <div class="project-name" style="margin-left:15px;">
                                                                                <a href="../project/project?projectId=${project.ID}"><span class="project-name-span" style=" font-size: 16px;">${project.TITLE}</span></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="margin-right: 35px;">
                                                                    <span>${project.CREATED_AT.substring(2, 10)}</span>
                                                                </div>
                                                            </div>
 															<ul class="issue-list" style="display:none; max-width: 1222px; ">
 															<div class="issue-list-div" style="width:100%; display:flex; justify-content: center;">
                                                                <hr style="width:98%; ">
                                                            </div>
                                                            <c:forEach items="${project.issues}" var="issue" varStatus="issueStatus">
                                                            
                                                                <li class="list">
                                                                <div style="margin-left:30px;">
                                                                <i class="menu-icon tf-icons bx bx-subdirectory-right"></i>
                                                                </div>
                                                                    <div class="issuetype-wrap" style="font-size: 15px;">
			
                                                                        <c:choose>
                                                                            <c:when test="${issue.TYPE eq '버그'}">
                                                                                <img src="../resources/issue/img/bug.svg" class="issuetype-icon">
                                                                            </c:when>
                                                                            <c:when test="${issue.TYPE eq '에픽'}">
                                                                                <img src="../resources/issue/img/epic.svg" class="issuetype-icon">
                                                                            </c:when>
                                                                            <c:when test="${issue.TYPE eq '작업'}">
                                                                                <img src="../resources/issue/img/task.svg" class="issuetype-icon">
                                                                            </c:when>
                                                                        </c:choose>


                                                                        <span class="issuetype">${issue.STATUS}</span> 
                                                                        <a class="issue-title-anchor" href="../issue/issue-detail?num=${issue.id}" style="margin-left:20px"> 
                                                                        	<span class="issue-title" style="width:700px; ">${issue.subject}</span>
                                                                        </a>
                                                                    </div>

                                                                    <div class="issuewriter-created" style="display:flex; align-items: center; justify-content: center;">
                                                                        <c:choose>
                                                                            <c:when test="${issue.priority == 'low'}">
                                                                                <span class="low" style="height:30px; width:70px; font-size:14px; display:flex; justify-content: center; align-items: center; margin-right:30px">${issue.priority}</span>
                                                                            </c:when>
                                                                            <c:when test="${issue.priority == 'middle'}">
                                                                                <span class="middle" style="height:30px; width:70px; font-size:14px; display:flex; justify-content: center; align-items: center; margin-right:30px">${issue.priority}</span>
                                                                            </c:when>
                                                                            <c:when test="${issue.priority == 'high'}">
                                                                                <span class="high" style="height:30px; width:70px; font-size:14px; display:flex; justify-content: center; align-items: center; margin-right:30px">${issue.priority}</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="critical" style="height:30px; width:70px; font-size:14px; display:flex; justify-content: center; align-items: center; margin-right:30px">${issue.priority}</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <span class="issue-writer">${issue.create_user_name}</span>
                                                                        <span class="issue-created">${issue.created_at.substring(2, 10)}</span>
                                                                    </div>
                                                                </li>

                                                            </c:forEach>
															</ul>
															</div>
                                                            <div style="width:100%; display:flex; justify-content: center;">
                                                                <hr style="width:98%; ">
                                                            </div>

                                                        </c:forEach>
                                                    </div>
                                                </c:otherwise>
                                               
                                            </c:choose>

                                        </div>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>


                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme" style="padding-top: 20px;">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                            (주)WidUs
                        </div>
                        <div>
                            <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a> <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a> <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>

                            <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
                        </div>
                    </div>

                </footer>
                <!-- Footer -->

                <div class="content-backdrop fade"></div>
            </div>
        </div>
    </div>

    <!-- / Layout page -->

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    
    <script>
    $(".project").click(function(){ 
    	 $(this).find(".issue-list").slideToggle();
    });

    $(".issuetype-wrap").click(function(event){
        event.stopPropagation();
    });
    
    
    
    document.getElementById("searchButton").addEventListener("click", function() {
        var searchInput = document.getElementById("searchInput");

        // 입력 필드의 값 확인
        if (searchInput.value.trim() === "") {
            alert("검색어를 입력하세요");
        } 
        return false;
        
    });
    
    
    </script>

</body>

</html>