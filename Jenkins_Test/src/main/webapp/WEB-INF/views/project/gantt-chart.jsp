<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>WidUs - 간트차트</title>
    <meta name="description" content="" />

    <!-- JQuery cdn -->
    <script src="https://unpkg.com/dayjs"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/frappe-gantt@0.6.1/dist/frappe-gantt.js"></script>

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <link href="../resources/project/css/projectboard/projectboard_Header.css" rel="stylesheet">
    <link href="../resources/project/css/GanttChart/gantt_chart.css" rel="stylesheet">
    
    <style>
    
    	.ganttcard { min-height: 680px;
    	}
    	.issue-list{ width:100%; }
    	
    	.gantt-info-header {
    		display:flex; 
    		width:600px; 
    		height:60px; 
    		background-color:#ffffff; 
    		border: 0.8px solid #e0e0e0; 
    		position:relative; 
    		align-items: center;
    		justify-content: space-between;
    		font-size:14px;
    		font-weight:600;
    		color:black;
    		font-family: sans-serif;
    	}
    	
    	.gantt-info-el {
    		border-right: 1.5px solid #e0e0e0;
    		height: 60px;
    		display: flex;
    		align-items: center;
    		justify-content: center;
		}
		
		.gantt-info-el:last-child {
   			border-right: none;
		}
		
		.issue {
			width:40%;
		}
		
		.assign {
			width:15%;
		}
		
		.status {
			width:15%;
		}
		
		.start {
			width:15%;
		}
		
		.end {
			width:15%;
		}
		
		
		.all-task-project {
		    display: flex;
		    font-weight: 500;
		    font-size: 14px;
		    color: #555;
		    cursor: pointer;
		    height: 40px;
		    border-bottom: 1px solid #ddd;
		    align-items: center;
		    padding-left: 20px;
		    background: #ececec;
		    font-family: sans-serif; 
		    border-top:1px solid #e1e1e1;
			border-bottom:1px solid #e1e1e1;
		}
		
		.project-title-wrap {
		    position: sticky;
		    display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    height: 100%;
		    width: 100%;
		    left: 30px;
		}
		
		.all-task-project i {
		    vertical-align: baseline;
		    margin-right: 10px;
		}
		
		.project-title {
		    display: inline-block;
		    font-size: 15px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    font-weight: 700;
		    color: #333;
		    vertical-align: unset;
		    padding-left: 10px;
		}
		
		.project-task-count {
		    margin: 0 0 0 3px;
		    font-family: Roboto;
		    margin-left: 5px;
		    font-size: 15px;
		    letter-spacing: -1px;
		    color: #999;
		}
		
		.toggle-image{
			width:24px;
			height:24px;
		}
		
		.hidden {
		  display: none;
		}
		
		.sub-li {
			height:40px;
			display: flex;
		    -webkit-box-align: center;
		    align-items: center;
		    width: 100%;
		    font-family: sans-serif;
		   	border-bottom:1px solid #e0e0e0;
		}
		
		.gantt-info-li {
			border-right: 1.5px solid #e0e0e0;
    		height: 40px;
    		display: flex;
    		align-items: center;
    		justify-content: center;
    		font-size: 12px;
		}
		.gantt-info-li:last-child {
   			border-right: none;
		}
		
		.sub-issue {
			justify-content: normal;
			margin-left:24px;
		}
    </style>
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->

            <jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <jsp:include page="../mainboard/navbar.jsp"></jsp:include>

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">

                            <div class="col-lg-8 mb-4 order-0 welcome-message">
                                <div class="card project-info">

                                    <!-- Project Information -->
                                    <div class="project-left">

                                        <a class="select-color"></a>

                                        <!-- 색 선택 모달 -->
                                        <div id="modal-background" style="display: none">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    프로젝트 색상
                                                    <a class="modal-close"></a>
                                                </div>

                                                <div class="modal-body">
                                                    <div class="color-option">
                                                        <ul id="selectColorTypes" class="select-color-group">
                                                            <li class="color-item project-color-type-5"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-11"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-1"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-10"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-2 project-color-check-active-1"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-7"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-9"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-6"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-3"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-4"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-8"><a class="cursor-pointer"><em></em></a></li>
                                                            <li class="color-item project-color-type-0"><a class="cursor-pointer"><em></em></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="modal-bottom">
                                                        <button type="button" class="modal-cancle">취소</button>
                                                        <button type="button" class="modal-submit">확인</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="project-information">
                                            <div class="project-up">

                                                <!-- 프로젝트 색 선택 -->
                                                <div class="favorite-project">
                                                    <img class="star" src="../resources/project/img/projectboard/icon_star.png">
                                                </div>

                                                <!-- 프로젝트 설정 -->
                                                <div class="setting">
                                                    <div class="dropdown">
                                                        <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="bx bx-dots-vertical-rounded"></i>
                                                        </button>

                                                        <!-- 드롭다운 메뉴 -->
                                                        <div class="dropdown-menu" aria-labelledby="cardOpt3">
                                                            <div class="project-setup-header">
                                                                <span>프로젝트 번호</span>
                                                                <em id="detailSettingProjectSrno">1997</em>
                                                            </div>

                                                            <div class="setting-menu">
                                                                <div class="setting-line">
                                                                    <a class="setting-anchor setting-exit">
                                                                        <img class="setting-img share" src="../resources/project/img/projectboard/share.svg">
                                                                        <span class="setting-span">프로젝트 나가기</span>
                                                                    </a>

                                                                    <div class="tooltip-container">
                                                                        <img class="setting-info" src="../resources/project/img/projectboard/info.svg">
                                                                        <div class="tooltip-text">프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.</div>
                                                                    </div>
                                                                </div>

                                                                <div class="setting-line">
                                                                    <a class="setting-anchor setting-edit">
                                                                        <img class="setting-img edit" src="../resources/project/img/projectboard/edit.svg">
                                                                        <span class="setting-span">프로젝트 수정</span>
                                                                    </a>
                                                                </div>

                                                                <div class="setting-line">
                                                                    <a class="setting-anchor setting-delete">
                                                                        <img class="setting-img bin" src="../resources/project/img/projectboard/bin.svg">
                                                                        <span class="setting-span">프로젝트 삭제</span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- 프로젝트 정보 -->
                                                <div class="project-name">
                                                    <span class="project-name-span">[전사관리] 프로젝트 이름</span>
                                                </div>
                                            </div>
                                            <div class="discription">
                                                <span>프로젝트 관리 어쩌구저쩌구</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- left end -->

                                    <!-- invite -->
                                    <div class="invite">
                                        <button class="memberlist">
                                            <img class="memberlist-img" src="../resources/project/img/projectboard/project_member.svg">
                                            <span class="invite-span">Team</span>
                                        </button>

                                        <!-- invite 모달 -->
                                        <div id="modal-background-invite" style="display: none">
                                            <div class="modal-content-invite">
                                                <div style="text-align: right;">
                                                    <a class="modal-close-invite"></a>
                                                </div>
                                                <div class="modal-header-invite">
                                                    <span class="invite-header-span">Team 관리</span>
                                                </div>
                                                <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">목록</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">초대</button>
                                                    </li>
                                                </ul>
                                                <div class="modal-search-list">
                                                    <div class="modal-search">
                                                        <input class="modal-search-input" type="text" id="image-input" placeholder="이름으로 검색">
                                                    </div>
                                                    <div class="modal-member-list">
                                                        <div class="member-list">
                                                            <ul id="member-list-ul">
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user3.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">옥진석</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
                                                                            <span class="modal-member-role-span" style="color: #fff">관리자</span>
                                                                        </div>
                                                                        <!-- 관리자일때만 보이게 작업 -->
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-exit">
                                                                                                <span class="setting-span setting-span-02">프로젝트 나가기</span>
                                                                                                <!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-manager-fire">
                                                                                                <span class="setting-span setting-span-02">관리자 해제</span>
                                                                                                <!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user4.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">박민기</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
                                                                            <a href="#" class="admin-invite-button-1 manager-badge">
                                                                                <span>
                                                                                </span>
                                                                            </a>
                                                                        </div>
                                                                        <!-- 관리자일때만 보이게 작업 -->
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-fire">
                                                                                                <span class="setting-span setting-span-02">프로젝트 내보내기</span>
                                                                                                <!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-manager-hire">
                                                                                                <span class="setting-span setting-span-02">관리자 지정하기</span>
                                                                                                <!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user5.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">김주영</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
                                                                            <a href="#" class="admin-invite-button-1 manager-badge">
                                                                                <span>
                                                                                </span>
                                                                            </a>
                                                                        </div>
                                                                        <!-- 관리자일때만 보이게 작업 -->
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-fire">
                                                                                                <span class="setting-span setting-span-02">프로젝트 내보내기</span>
                                                                                                <!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-manager-hire">
                                                                                                <span class="setting-span setting-span-02">관리자 지정하기</span>
                                                                                                <!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user1.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">김혜원</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
                                                                            <a href="#" class="admin-invite-button-1 manager-badge">
                                                                                <span></span>
                                                                            </a>
                                                                        </div>
                                                                        <!-- 관리자일때만 보이게 작업 -->
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-fire">
                                                                                                <span class="setting-span setting-span-02">프로젝트 내보내기</span>
                                                                                                <!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-manager-hire">
                                                                                                <span class="setting-span setting-span-02">관리자 지정하기</span>
                                                                                                <!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user2.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">한혜진</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
                                                                            <a href="#" class="admin-invite-button-1 manager-badge">
                                                                                <span></span>
                                                                            </a>
                                                                        </div>
                                                                        <!-- 관리자일때만 보이게 작업 -->
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-fire">
                                                                                                <span class="setting-span setting-span-02">프로젝트 내보내기</span>
                                                                                                <!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-manager-hire">
                                                                                                <span class="setting-span setting-span-02">관리자 지정하기</span>
                                                                                                <!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li id="member-list-li">
                                                                    <div class="modal-member-info">
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user6.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name">
                                                                            <a>
                                                                                <span class="modal-member-name-span">아이유</span>
                                                                            </a>
                                                                        </div>
                                                                        <div class="modal-member-role">
                                                                            <a href="#" class="admin-invite-button-1 manager-badge">
                                                                                <span></span>
                                                                            </a>
                                                                        </div>
                                                                        <!-- 관리자일때만 보이게 작업 -->
                                                                        <div class="setting member-setting">
                                                                            <div class="dropdown">
                                                                                <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                                </button>
                                                                                <div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">
                                                                                    <div class="setting-menu setting-menu-padding">
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-fire">
                                                                                                <span class="setting-span setting-span-02">프로젝트 내보내기</span>
                                                                                                <!-- 본인이 아닌 경우 : 프로젝트 내보내기  -->
                                                                                            </a>
                                                                                        </div>
                                                                                        <div class="setting-line">
                                                                                            <a class="setting-anchor setting-manager-hire">
                                                                                                <span class="setting-span setting-span-02">관리자 지정하기</span>
                                                                                                <!-- 관리자가 아닐 경우 : 관리자 지정하기 -->
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-body-invite" style="display:none">
                                                    <div class="modal-content-wrapper">
                                                        <div class="modal-search-invite">
                                                            <div class="modal-search modal-search-invite-02">
                                                                <input class="modal-search-input" type="text" id="image-input" placeholder="이름으로 검색">
                                                            </div>
                                                            <div class="modal-search-memberlist">
                                                                <ul id="member-invite-ul">
                                                                    <li class="member-invite-li">
                                                                        <div class="modal-member-invite-img">
                                                                            <img class="modal-invite-check" src="../resources/project/img/projectboard/icon_check.png">
                                                                        </div>
                                                                        <div class="modal-member-profile">
                                                                            <img class="modal-memeber-img" src="../resources/project/img/projectboard/user3.jpg">
                                                                        </div>
                                                                        <div class="modal-member-name name-flex">
                                                                            <a>
                                                                                <span class="modal-member-name-span" style="font-weight:520">옥진석</span>
                                                                            </a>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <div class="modal-invite-list">
                                                            <span class="invite-empty-span">대상을 선택해주세요.</span>
                                                        </div>
                                                    </div>

                                                    <div class="modal-bottom-invite">
                                                        <button type="button" class="modal-cancle-exit">취소</button>
                                                        <button type="button" class="modal-submit-exit">확인</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /invite -->

                                </div>
                            </div>
                            <!-- Total Revenue -->
                            <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list">
                                <div class="card ganttcard">

                                    <div class="card-body issue-list-card-body">
										<div>
										 	<div class="all-buttons">
                                         		<button id="day" type="button" class="button active">Day</button>
                                         		<button id="week" type="button" class="button">Week</button>
                                         		<button id="month" type="button" class="button">Month</button>
                                          	</div>
                                          	
                                        	<div class="body-wrapper" style="display:flex">
                                        		<div style="box-shadow: 4px 0px 4px rgba(0, 0, 0, 0.1); border-right: 1px solid #777777; z-index:10; height: 500px;overflow: hidden; min-width: 600px;">
                                        			<div class="gantt-info-header" style="position: sticky; top: 0; z-index: 20;">
                                        				<div class="gantt-info-el issue">
                                        					<span>업무명</span>
                                        				</div>
                                        				<div class="gantt-info-el assign">
                                        					<span>담당자</span>
                                        				</div >
                                        				<div class="gantt-info-el status">
                                        					<span>상태</span>
                                        				</div>
                                        				<div class="gantt-info-el start">
                                        					<span>시작일</span>
                                        				</div>
                                        				<div class="gantt-info-el end">
                                        					<span>마감일</span>
                                        				</div>
                                        			</div>
                                        			<div>
                                        				<ul style="list-style-type: none; padding: 0; margin: 0;">
                                        					<li>
		                                        				<div class="js-gubun-button all-task-project epic">
													                <div class="project-title-wrap">
													                    <img class="toggle-image" src="../resources/project/img/ganttchart/Triangle.svg">
													                    <span class="project-title">[	Epic	]</span>
													                    <span class="project-task-count">(3)</span>
													                </div>
													            </div>
													            <ul class="sub-list hidden" style="list-style-type: none; padding: 0; margin: 0;">
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/epic.svg">
					                                        					<span style="margin-left:10px;">빵빵이 이모티콘 사주세요</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>빵빵이</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Critical</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-08</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-15</span>
					                                        				</div>
													            		</div>
													            	</li>
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/epic.svg">
					                                        					<span style="margin-left:10px;">이게되네</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>JJOK97</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Low</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-10</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-22</span>
					                                        				</div>
													            		</div>
													            	</li>
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/epic.svg">
					                                        					<span style="margin-left:10px;">옥진석 예비군 훈련 10월 27일</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>JJOK97</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Critical</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-27</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-27</span>
					                                        				</div>
													            		</div>
													            	</li>
													            </ul>
													        </li>
													        <li> 
		                                        				<div class="js-gubun-button all-task-project task">
													                <div class="project-title-wrap">
													                    <img class="toggle-image" src="../resources/project/img/ganttchart/Triangle.svg">
													                    <span class="project-title">[	Task	]</span>
													                    <span class="project-task-count">(3)</span>
													                </div>
													            </div>
													            <ul class="sub-list hidden" style="list-style-type: none; padding: 0; margin: 0;">
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/task.svg">
					                                        					<span style="margin-left:10px;">빵빵이 이모티콘 사주세요</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>빵빵이</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Critical</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-08</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-15</span>
					                                        				</div>
													            		</div>
													            	</li>
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/task.svg">
					                                        					<span style="margin-left:10px;">이게되네</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>JJOK97</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Low</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-10</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-22</span>
					                                        				</div>
													            		</div>
													            	</li>
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/task.svg">
					                                        					<span style="margin-left:10px;">옥진석 예비군 훈련 10월 27일</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>JJOK97</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Critical</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-27</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-27</span>
					                                        				</div>
													            		</div>
													            	</li>
													            </ul>
													         </li>
													         <li>
		                                        				<div class="js-gubun-button all-task-project bug">
													                <div class="project-title-wrap">
													                    <img class="toggle-image" src="../resources/project/img/ganttchart/Triangle.svg">
													                    <span class="project-title">[	Bug	]</span>
													                    <span class="project-task-count">(3)</span>
													                </div>
													            </div>
													            <ul class="sub-list hidden" style="list-style-type: none; padding: 0; margin: 0;">
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/bug.svg">
					                                        					<span style="margin-left:10px;">빵빵이 이모티콘 사주세요</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>빵빵이</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Critical</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-08</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-15</span>
					                                        				</div>
													            		</div>
													            	</li>
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/bug.svg">
					                                        					<span style="margin-left:10px;">이게되네</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>JJOK97</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Low</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-10</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-22</span>
					                                        				</div>
													            		</div>
													            	</li>
													            	<li>
													            		<div  class="sub-li"> 
													            			<div class="gantt-info-li issue sub-issue">
													            				<img src="../resources/issue/img/bug.svg">
					                                        					<span style="margin-left:10px;">옥진석 예비군 훈련 10월 27일</span>
					                                        				</div>
					                                        				<div class="gantt-info-li assign">
					                                        					<span>JJOK97</span>
					                                        				</div >
					                                        				<div class="gantt-info-li status">
					                                        					<span>Critical</span>
					                                        				</div>
					                                        				<div class="gantt-info-li start">
					                                        					<span>2023-10-27</span>
					                                        				</div>
					                                        				<div class="gantt-info-li end">
					                                        					<span>2023-10-27</span>
					                                        				</div>
													            		</div>
													            	</li>
													            </ul>
													         </li>
											            </ul>
                                        			</div>
                                        		</div>
                                        		<div style="overflow: auto; max-height:500px">
                                        			<svg id="gantt"></svg>
                                        		</div>
                                        	</div>
										</div>
                                        <!-- GanttChart wrapper -->
                                    </div>
                                </div>
                                <!-- issue-card end -->
                            </div>
                        </div>
                    </div>
                    <!--/ Total Revenue -->
                </div>
            </div>
            <!-- / Layout page -->
        </div>
    </div>

    <script src="../resources/project/js/projectboard/projectboard_Header.js"></script>
    <script src="../resources/project/js/GanttChart/gantt_chart.js"></script>

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    
    <script>
    $(document).ready(function() {
    	$('.toggle-image').click(function() {
    	var currentSrc = $(this).attr('src');
    	var newSrc = (currentSrc === '../resources/project/img/ganttchart/Triangle.svg') ? '../resources/project/img/ganttchart/play.svg' : '../resources/project/img/ganttchart/Triangle.svg';
    	    
    	$(this).attr('src', newSrc);
    	});
    	
    	$('.toggle-image').click(function() {
    		$(this).closest('li').find('.sub-list').toggleClass('hidden');
    	});
    });
    </script>

</body>

</html>