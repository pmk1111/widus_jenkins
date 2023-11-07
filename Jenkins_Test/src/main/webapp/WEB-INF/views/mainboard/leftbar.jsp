<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
<style>
  	body {
  		font-family: 'Nanum Gothic', sans-serif;
  	}
  	
 	#layout-menu {
    	box-shadow: 10px 0px 10px rgba(0, 0, 0, 0.1); /* 오른쪽 그림자 */
	} 	
</style>

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">

    <div class="app-brand demo">
        <a href="../mainboard/my-dashboard" class="app-brand-link">
            <span class="app-brand-logo demo">
                <svg width="25" viewBox="0 0 25 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <defs>
                        <path d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z" id="path-1" style="fill:#8D52A9;"></path>
                        <path d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z" id="path-3" style="fill:#9F7AB0;"></path>
                        <path d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z" id="path-4" style="fill:#9F7AB0;"></path>
                        <path d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z" id="path-5" style="fill:#9F7AB0;"></path>
                    </defs>
                    <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                            <g id="Icon" transform="translate(27.000000, 15.000000)">
                                <g id="Mask" transform="translate(0.000000, 8.000000)">
                                    <mask id="mask-2" fill="white">
                                        <use xlink:href="#path-1"></use>
                                    </mask>
                                    <use fill="#696cff" xlink:href="#path-1"></use>
                                    <g id="Path-3" mask="url(#mask-2)">
                                        <use fill="#696cff" xlink:href="#path-3"></use>
                                        <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                                    </g>
                                    <g id="Path-4" mask="url(#mask-2)">
                                        <use fill="#696cff" xlink:href="#path-4"></use>
                                        <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                                    </g>
                                </g>
                                <g id="Triangle" transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) ">
                                    <use fill="#696cff" xlink:href="#path-5"></use>
                                    <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                                </g>
                            </g>
                        </g>
                    </g>
                </svg>
            </span>
            <span class="demo menu-text fw-bolder ms-2" style="font-size: 35px; font-family: 'Jost', sans-serif; height:30px">WidUs</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle leftbar-close"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">

        <li class="menu-item" style="margin:15px 0px 25px 0px;">
            <a href="${pageContext.request.contextPath}/project/create-project" class="menu-link create-item" style="background-color: #9F7AB0; color: white; width: 228px; top: 10px;">
                <i class="menu-icon tf-icons bx bx-home-circle create-project" style="margin-left: 22px;"></i>
                <div class="create-project" style="font-weight: bold;">새 프로젝트 만들기</div>
            </a>
        </li>

        <!-- Dashboard -->
        
        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">프로젝트</span>
        </li>   
                
		<li class="menu-item project-header" >
			<div class="menu-link" style="width: 100%; margin-left: -14px; height: 42.5px;">
			    <a class="menu-link project-link" href="${pageContext.request.contextPath}/project/project-list" >
			            <i class="menu-icon tf-icons bx bx-list-ul"></i>
			            <div data-i18n="Analytics">내 프로젝트</div>
			    </a>
		    	<img class="project-dropdown" src="../resources/project/img/arrow/chevron-up.svg" style="margin-left:30px">
		    </div>
		</li>
        
        <li class="menu-item project-item">
            <a href="${pageContext.request.contextPath}/project/project-select" class="menu-link my-link">
                <i class="menu-icon tf-icons bx bxs-dashboard"></i>
                <div data-i18n="Layouts">프로젝트 대시보드</div>
            </a>
        </li>

        <li class="menu-item project-item">
            <a href="${pageContext.request.contextPath}/issue/issue-list" class="menu-link issue-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Layouts">이슈 보드</div>
            </a>
        </li>

        <li class="menu-item project-item">
            <a href="${pageContext.request.contextPath}/documents/documents-list" class="menu-link dm-link">
                <i class="menu-icon tf-icons bx bx-copy"></i>
                <div data-i18n="Layouts">자료 공유실</div>
            </a>
        </li>        
        
		
        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">내 업무</span>
        </li>
        
        <li class="menu-item my-header">
        	<div class="menu-link" style="width: 100%; margin-left: -14px; height: 42.5px;">
	            <a href="${pageContext.request.contextPath}/mainboard/my-dashboard" class="menu-link my-link">
	                <i class="menu-icon tf-icons bx bxs-dashboard"></i>
	                <div data-i18n="Tables">내 대시보드</div>
	            </a>
	            <img src="../resources/project/img/arrow/chevron-down.svg" style="margin-left:30px">
            </div>
        </li>

        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/total/mywork" class="menu-link work-link">
                <i class="menu-icon tf-icons bx bx-task"></i>
                <div data-i18n="Layouts">내 담당 업무</div>
            </a>
        </li>
        
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/bookmark/bookmark-list" class="menu-link bm-link">
                <i class="menu-icon tf-icons bx bx-bookmark"></i>
                <div data-i18n="Layouts">북마크</div>
            </a>
        </li>        
        
        <li class="menu-item">
            <a href="${pageContext.request.contextPath}/calendar/calendar-list" class="menu-link cal-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Layouts">캘린더</div>
            </a>
        </li>
        
        <br>
        <!-- Misc -->
        <se:authorize access="hasRole('ROLE_ADMIN')">
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Admin</span></li>
            <!--             <li class="menu-item">
              <a
                href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                target="_blank"
                class="menu-link"
              >
                <i class="menu-icon tf-icons bx bx-support"></i>
                <div data-i18n="Support">회사 직원 초대</div>
              </a>
            </li> -->

            <li class="menu-item">
                <a href="../admin/companyinfo" class="menu-link ad-link">
                    <i class="menu-icon tf-icons bx bx-file"></i>
                    <div data-i18n="Documentation" id="adminLink">관리자</div>
                </a>
            </li>
        </se:authorize>
    </ul>
</aside>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$(document).ready(function() {
	
	var $menuItems = $('.menu-item');

	$menuItems.each(function() {
	    var $item = $(this);

	    // '새 프로젝트 만들기' 항목에는 액션을 적용하지 않음
	    if ($item.find('.create-project').length === 0) {
	        $item.hover(
	            function() {
	                $item.addClass('active');
	            },
	            function() {
	                $item.removeClass('active');
	            }
	        );
	    }
	});
    
    
    // 드롭다운
	$('.my-header img').click(function() {
	    if ($('.my-header').nextUntil('br').is(':visible')) {
	        $('.my-header').nextUntil('br').slideUp(400);
	    } else {
	        $('.my-header').nextUntil('br').slideDown(400);
	    }
	
	    var src = $(this).attr('src');
	    if (src.indexOf('chevron-down.svg') !== -1) {
	        $(this).attr('src', '../resources/project/img/arrow/chevron-up.svg');
	    } else {
	        $(this).attr('src', '../resources/project/img/arrow/chevron-down.svg');
	    }
	});
    
    // 세션에 프로젝트 아이디 체크
    var projectId = <c:out value="${sessionScope.projectId != null}"/>;
    
    if (projectId) {
        $(".project-dropdown").attr('src', '../resources/project/img/arrow/chevron-down.svg');
        $(".project-item").slideDown(400);
        
        $(".project-dropdown").click(function(){
        var src = $(".project-dropdown").attr('src');
	    if (src.indexOf('chevron-down.svg') !== -1) {
	        $(this).attr('src', '../resources/project/img/arrow/chevron-up.svg');
	        $(".project-item").slideUp(400);
	    } else {
	        $(this).attr('src', '../resources/project/img/arrow/chevron-down.svg');
	        $(".project-item").slideDown(400);
	    }
        });
    } else {
        $(".project-item").slideUp(400);
    }
    
    $(".project-dropdown").click(function(event) {
        event.stopPropagation(); // 이벤트 버블링 방지
        if (!projectId) {
            alert("프로젝트 선택 후 사용가능합니다.");
        }
    });
    
    $(".project-header").click(function() {
        var currentUrl = window.location.pathname; // 현재 페이지의 URL을 가져옵니다.

        if (currentUrl === "${pageContext.request.contextPath}/project/project-list") {
            if (!projectId) {
                alert("프로젝트를 선택해주세요.");
            }
        }
    });
    
    // 호버 이벤트
    $(".bm-link").hover(
	    function() { 
	        $(this).find('i').addClass('bx-tada');
	    },
	    function() { 
	        $(this).find('i').removeClass('bx-tada');
	    }
    );
    
    $(".my-link").hover(
	    function() { 
	        $(this).find('i').addClass('bx-tada');
	    },
	    function() { 
	        $(this).find('i').removeClass('bx-tada');
	    }		
    );
    
    $(".project-link").hover(
	    function() { 
	        $(this).find('i').addClass('bx-tada');
	    },
	    function() { 
	        $(this).find('i').removeClass('bx-tada');
	    }		
    );
    
	$(".issue-link").hover(
	    function() { 
	        $(this).find('i').addClass('bx-tada');
	    },
	    function() { 
	        $(this).find('i').removeClass('bx-tada');
	    }		
	);   
	
	$(".dm-link").hover(
	    function() { 
	        $(this).find('i').addClass('bx-tada');
	    },
	    function() { 
	        $(this).find('i').removeClass('bx-tada');
	    }		
	);   
	
	$(".cal-link").hover(
		function() { 
		    $(this).find('i').addClass('bx-tada');
		},
		function() { 
		    $(this).find('i').removeClass('bx-tada');
		}		
	);   
	
	$(".ad-link").hover(
		function() { 
		    $(this).find('i').addClass('bx-tada');
		},
		function() { 
		    $(this).find('i').removeClass('bx-tada');
		}		
	);  
	
	$(".work-link").hover(
		function() { 
		    $(this).find('i').addClass('bx-tada');
		},
		function() { 
		    $(this).find('i').removeClass('bx-tada');
		}		
	);  
	
 	// 크리에이트 색상 변경
    $(".create-item").hover(
        function() { // 마우스를 올렸을 때
            $(this).css({
                "background-color": "#75508F",
                "box-shadow": "0px 2px 10px rgba(0, 0, 0, 0.2)" // 그림자 추가
            });
        },
        function() { // 마우스를 떠났을 때
            $(this).css({
                "background-color": "#9F7AB0",
                "box-shadow": "none" // 그림자 제거
            });
        }
    );

});

</script>