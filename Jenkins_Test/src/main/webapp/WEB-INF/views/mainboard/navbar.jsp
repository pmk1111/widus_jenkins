<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="pinfo" />
<style>
		.container-xxl {
			animation: fadein .5s;
		}

		@keyframes fadein {
			from { 
				opacity:0;
				transform: translate3d(0, -2%, 0);
			}
			to {
				opacity: 1;
				transform: translateZ(0);
			}
		}

    .notification-icon-container {
        position: relative;
        display: inline-block;
    }


    .notification-count-badge {
        position: absolute;
        top: 0;
        right: 0;
        background-color: red;
        color: white;
        border-radius: 50%;
        width: 14px;
        /* 원하는 크기로 조정 */
        height: 14px;
        /* 원하는 크기로 조정 */
        text-align: center;
        font-size: 8px;
        /* 작은 폰트 크기로 조정 */
        line-height: 14px;
        /* 아이콘과 텍스트 중앙 정렬을 위한 높이 설정 */
        display: none;
    }

    .alarm-icon+.chat-icon {
        margin-left: 10px
    }

    .chat-icon {
        margin-right: 10px
    }

    .alarm-icon:hover,
    .chat-icon:hover {
        cursor: pointer;
    }
</style>
<script src="${pageContext.request.contextPath}/notify/js/notify.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/notify/js/notify.js"></script>
<nav class="layout-navbar container-xxl navbar navbar-expand-xl align-items-center bg-navbar-theme" id="layout-navbar">

    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="bx bx-menu bx-sm"></i>
        </a>
    </div>

    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <!-- Search -->
        <div class="navbar-nav align-items-center">
            <div class="nav-item d-flex align-items-center">
            </div>
        </div>
        <!-- /Search -->

        <ul class="navbar-nav flex-row align-items-center ms-auto">
            <!-- Place this tag where you want the button to render. -->
            <li class="nav-item bell-chat-icon">
                <div class="notification-icon-container">
                    <img alt="알림" src="../resources/mainboard/assets/img/bell.svg" class="alarm-icon">
                    <span class="notification-count-badge">0</span>
                </div>
                <div class="chat-icon-wrapper" style="display: inline-block; position:relative; margin-left: 10px;">
                    <img alt="채팅" src="../resources/mainboard/assets/img/chat.svg" class="chat-icon">
                    <div class="chat-not-read">
                        <span class="not-read-cnt"></span>
                    </div>
                </div>
            </li>


            <!-- User -->
            <li class="nav-item navbar-dropdown dropdown-user dropdown"><a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <c:choose>
                            <c:when test="${empty pinfo.pic}">
                                <img src="${pageContext.request.contextPath}/user/img/profile.png" alt="Default Profile Image" class="w-px-40 h-px-40 rounded-circle" />
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/upload${pinfo.pic}" alt="User Profile Image" class="w-px-40 h-px-40 rounded-circle" />
                            </c:otherwise>
                        </c:choose>
                    </div>

                </a>

                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="#">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <c:choose>
                                            <c:when test="${empty pinfo.pic}">
                                                <img src="${pageContext.request.contextPath}/user/img/profile.png" alt="Default Profile Image" class="w-px-40 h-px-40 rounded-circle" />
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/upload${pinfo.pic}" alt="User Profile Image" class="w-px-40 h-px-40 rounded-circle" />
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="flex-grow-1" style="display: flex; justify-content: center; align-items: center;">
                                    <span class="fw-semibold d-block">${pinfo.name}</span>
                                    <%--  <small class="text-muted">${userinfo.po }</small> --%>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>

                    <li>
                        <a class="dropdown-item" href="../user/profile">
                            <i class="bx bx-user me-2"></i>
                            <span class="align-middle">My Profile</span>
                        </a>
                    </li>

                    <li>
                        <a class="dropdown-item setting-item" >
                            <i class="bx bx-cog me-2"></i>
                            <span class="align-middle">Settings</span>
                        </a>
                    </li>

                    <li>
                        <div class="dropdown-divider"></div>
                    </li>

                    <li>
                    	<div class="dropdown-item">
	                        <form action="${pageContext.request.contextPath}/user/logout" method="post" style="margin-bottom:0px" name="logout">
	                            <i class="bx bx-power-off me-2"></i> 
	                            <span id="logout" class="align-middle"> Log Out</span>
	                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	                        </form>
                        </div>
                    </li>

                </ul>
            </li>
            <!--/ User -->
        </ul>
    </div>
    <jsp:include page="../notify/notify.jsp"></jsp:include>
</nav>
<script>
    $(document).ready(function() {
        const alarm = $('.alarm-icon').attr('src');
        const chat = $('.chat-icon').attr('src');

        $('.alarm-icon').hover(
            function() {
                if (alarm === '../resources/mainboard/assets/img/bell.svg') {
                    $('.alarm-icon').attr('src', '../resources/mainboard/assets/img/bell-hover.svg');
                }
            },
            function() {
                $('.alarm-icon').attr('src', '../resources/mainboard/assets/img/bell.svg');
            }
        );

        $('.chat-icon').hover(
            function() {
                if (chat === '../resources/mainboard/assets/img/chat.svg') {
                    $('.chat-icon').attr('src', '../resources/mainboard/assets/img/chat-hover.svg');
                }
            },
            function() {
                $('.chat-icon').attr('src', '../resources/mainboard/assets/img/chat.svg');
            }
        );

        $("#logout").click(function(event) {
            event.preventDefault();
            $("form[name=logout]").submit();
        })
        // 아직 읽지 않은 알림 수를 가져오는 함수
        function getUnreadNotificationCount() {
            $.ajax({
                url: '../getUnreadNotificationCount', // 서버의 컨트롤러 엔드포인트 URL
                type: 'GET',
                success: function(unreadCount) {
                    // unreadCount에 아직 읽지 않은 알림의 개수가 반환됨
                    updateNotificationCount(unreadCount);
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }

        // 알림 카운트를 업데이트하는 함수
        function updateNotificationCount(count) {
            var countBadge = $('.notification-count-badge');
            if (count === 0) {
                countBadge.hide(); // 0일 때 뱃지를 숨김
            } else {
                countBadge.text(count).show(); // 0이 아닐 때 뱃지를 보이고 텍스트 업데이트
            }
        }


        getUnreadNotificationCount();
    }); // ready end
    
    $('.setting-item').click(function(){
    	alert("서비스 준비중입니다.");
    })
</script>