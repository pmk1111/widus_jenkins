<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<article class="notify-layer" style="top: 70px;">
    <div class="notify-menu-top">
        <strong class="notify-menu-txt">알림</strong>
        <button class="notify-menu-close-btn">
            <img src="../resources/chat/img/close.svg" alt="닫기">
        </button>
    </div>

    <div class="notify-list-area" style="background-color:white;">
        <ul class="notify-list">
            <c:forEach items="${notifications}" var="notification">
				<li data-post-id="${notification.id}"></li>
                <li class="notify-room" data-post-id="${notification.post_ID}">
                    <div class="user-latest">
                        <p class="notify-user-id">${notification.name}님이</p>
                        <p class="latest-notify">${notification.CONTENT}</p>
                    </div>
                    <div class="update-time-area">
                        <c:set var="timeDiff" value="${notification.CURRENTTIME}" />

	                    <c:if test="${timeDiff lt 1}">
	                        <span>방금 전</span>
	                    </c:if>
	
	                    <c:if test="${timeDiff ge 1 and timeDiff lt 60}">
	                        <span>${timeDiff} 분 전</span>
	                    </c:if>
	
	                    <c:if test="${timeDiff ge 60 and timeDiff lt 1440}">
	                        <span>${Integer.valueOf(timeDiff div 60)} 시간 전</span>
	                    </c:if>
	
	                    <c:if test="${timeDiff ge (24*60) and timeDiff lt (7*24*60)}">
	                        <span>${Integer.valueOf(timeDiff div (24*60))} 일 전</span>
	                    </c:if>
	
	                    <c:if test="${timeDiff ge (7 *24 *60) and timeDiff lt (30 *24 *60)}">
	                        <span>${Integer.valueOf(timeDiff div (7*24*60))} 주</span>
	                    </c:if>

                    </div>
                </li>
                
            </c:forEach>
        </ul>
    </div>
</article>