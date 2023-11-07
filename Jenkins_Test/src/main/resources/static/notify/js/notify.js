$(document).ready(function() {
    const notifyLayer = $('.notify-layer');
    const notifyListArea = $('.notify-list-area');
    const notreadNotifyArea = $('.notify-contact-area');
    const backBtn = $('.back-btn');

    let isActive = true; // 페이지 활성화 여부를 추적

    // 페이지가 활성화된 경우 또는 알림 레이어를 열 때
    window.addEventListener("focus", function() {
        if (notifyLayer.is(':visible')) {
            // 알림 레이어가 열린 상태에서 활성화되면 업데이트
            getNotifications();
        }
    });

    // 알림 아이콘 클릭 시, 알림 레이어 열기
    $('.alarm-icon').click(function() {
    	if($('.notify-layer').css('display') === 'none'){
        notifyLayer.fadeIn(100);
        $('.on').removeClass('on');
        $('.notify-on').addClass('on');
        notifyListArea.show();
        notreadNotifyArea.hide();
        // 알림 레이어가 열릴 때 업데이트
        getNotifications();
        }
    });
    
$('.alarm-icon').click(function (e) {
    if ($('.notify-layer').css('display') === 'block') {
        $('.notify-layer').css('display', 'none');
        // notifyListArea를 정의하고 hide() 메서드를 사용하여 숨깁니다.
        var notifyListArea = $('.notify-list-area');
        notifyListArea.hide();
        e.preventDefault(); // 클릭 이벤트의 기본 동작을 막습니다.
    }
});


    // 알림 레이어 닫기
    $('.notify-menu-close-btn').click(function() {
        notifyLayer.fadeOut(100);
    });

    $('#notreadbtn').click(function() {
       $('.on').removeClass('on');
        $('.notread').addClass('on');
       notreadNotifyArea.show();
        notifyListArea.hide();
    });

    $('#notifybtn').click(function() {
        $('.on').removeClass('on');
        $('.notify-on').addClass('on');
        notreadNotifyArea.hide();
        notifyListArea.show();
    });
    

  //  $('.notify-layer').on('click','.notify-room',function() {
 //   var postId = $(this).data('post-id'); 
 //   window.location.href = '/widus/issue/issue-detail?num=' + postId; 
//});
$('.notify-layer').on('click', '.notify-room', function (event) {
    // 이벤트 기본 동작을 중단하여 페이지 이동을 막습니다.
    event.preventDefault();

    var postId = $(this).data('post-id');
     var notificationId = $(this).data('id');

    // DB를 업데이트하기 위한 Ajax 요청을 보냅니다.
    $.ajax({
        url: "/widus/updateNotifications", // DB 업데이트를 처리하는 서버 엔드포인트
        type: 'GET', // 또는 'GET'을 사용할 수 있습니다.
        data: {
        
            postId: postId,
            notificationId: notificationId
        },
        success: function (response) {
            // DB 업데이트가 성공하면 페이지 이동을 수행합니다.
            window.location.href = '/widus/issue/issue-detail?num=' + postId;
        },
        error: function (xhr, status, error) {
            console.log("Error: " + error);
            // DB 업데이트 중 오류가 발생하면 적절한 조치를 취합니다.
        }
    });
});

function addDeleteButton(notificationId) {
    var deleteButton = `<button class="delete-notification"  data-id="${notificationId}">
    <img src="../resources/chat/img/close.svg" alt="닫기"></button>`;
    var notificationItem = $(`li[data-id="${notificationId}"]`);
    notificationItem.find('.update-time-area').append(deleteButton);
}


$('.notify-layer').on('click', '.delete-notification', function (event) {
    event.preventDefault();
    event.stopPropagation();

  
   var notificationId = $(this).data('id');


    // DB를 업데이트하고 알림 삭제하기 위한 Ajax 요청을 보냅니다.
    $.ajax({
        url: "/widus/deleteNotifications", // DB 업데이트 및 알림 삭제를 처리하는 서버 엔드포인트
        type: 'GET',
        data: {
            notificationId: notificationId
        },
        success: function (response) {
         $(`li[data-id="${notificationId}"]`).remove();
   
            loadNotifications();
        },
        error: function (xhr, status, error) {
            console.log("Error: " + error);
            
        }
    });
});


function getNotifications() {
    if (isActive) {
        // 페이지가 활성화된 경우에만 업데이트 요청
        $.ajax({
            url: "/widus/getNotifications", // 알림을 가져올 JSP 페이지의 경로
            type: 'GET',
            success: function(data) {
                console.log(data);
                // 서버에서 받은 알림 데이터를 동적으로 업데이트
                var notificationList = notifyListArea.find('ul.notify-list');
                notificationList.empty(); // 기존 목록을 비우고 다시 추가
                if (data.length === 0) {
                    notificationList.append('<div class="no-notification"><h6>알림이 없습니다.</h6></div>');
                } else {
                    for (var i = 0; i < data.length; i++) {
                        var notification = data[i];
                        var isReadClass = notification.notify_STATUS === 1 ? "read" : "unread";
                        var notificationItem = `
                            <li class="notify-room ${isReadClass}" data-id="${notification.id}" data-post-id="${notification.post_ID}">
                                <div class="user-latest">
                                    <p class="notify-user-id">${notification.mentioned_BY}님이 ${notification.name}님을</p>
                                    <p class="latest-notify">${notification.content}</p>
                                </div>
                                <div class="update-time-area">
                                    <span class="updattime"> ${getTimeDiffString(notification.currenttime)}<span>
                                </div>
                            </li>
                        `;
                        notificationList.append(notificationItem);
                        addDeleteButton(notification.id); // 삭제 버튼 추가
                    }
                }
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    }
}

// 시간 차이에 따른 문자열 반환 함수
function getTimeDiffString(timeDiff) {
    if (timeDiff < 1) {
        return "<span>방금 전</span>";
    } else if (timeDiff < 60) {
        return "<span>" + timeDiff + " 분 전</span>";
    } else if (timeDiff < 1440) {
        return "<span>" + Math.floor(timeDiff / 60) + " 시간 전</span>";
    } else if (timeDiff < 7 * 24 * 60) {
        return "<span>" + Math.floor(timeDiff / (24 * 60)) + " 일 전</span>";
    } else if (timeDiff < 30 * 24 * 60) {
        return "<span>" + Math.floor(timeDiff / (7 * 24 * 60)) + " 주</span>";
    }
}

// 페이지 로드 후 초기 알림 목록 업데이트
getNotifications();

});
