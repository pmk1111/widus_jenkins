<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	.chatting-layer {
		top:70px;
	}
	.chat-user-img{height:40px;}
</style>
<article class="chatting-layer">
	<input type="hidden" class="selected-room-num" name="selectedRoomNum" value="">
	<div class="chat-menu-top">
		<strong class="chat-menu-txt">채팅</strong>
		<button class="chat-menu-close-btn">
			<img src="../resources/chat/img/close.svg" alt="닫기">
		</button>
	</div>

	<div class="chat-side-content">
		<div class="chat-menu-area">
			<ul>
				<li id="chatbtn"><span class="popup-tab chat-on chat-room-list on">채팅</span></li>
				<li id="contactbtn"><span class="contact">연락처</span></li>
			<!-- 	<button type="button" class="popup-btn new-chat">
					<img>새 채팅
				</button> -->
			</ul>
		</div>

		<div class="chat-search-area">
			<input type="text" class="search-chat">
		</div>

		
		<div class="chat-list-area">
			<ul class="chat-list">
				<!-- 
				
				<li class="chat-room" data-room-id="3">
					<div class="chat-img-user-latest">
						<img class="chat-user-img"
							src="../resources/mainboard/assets/img/avatars/1.png" alt="">
					</div>

					<div class="user-latest">
						<p class="chat-user-id">JJok</p>
						<p class="latest-chat">오늘만 지나면 추석입니다.</p>
					</div>

					<div class="update-time-area">
						<span class="update-time">13:52</span>
					</div>
				</li>
				 -->
				
			</ul>

		</div>
		
		
		
		<div class="chat-contact-area">
			<ul class="contact-list">

			</ul>
			
		</div>
	</div>
	
</article>

<article class="chatting-room">
	<div class="chat-menu-top">
	<input type="hidden" class="msg-to" name="msgTo" value="">
	<!-- 내가 어떤 직원에게 메시지를 보낼 지 저장하는 항목이다 -->
	<button class="back-btn">
		<img class="back-to-chatting-layer" src="../resources/chat/img/leftArrow.svg">
	</button>
	<img class="chat-user-img" src="../resources/mainboard/assets/img/avatars/1.png" >
		<strong class="chat-user-txt"></strong>
		<button class="chat-menu-close-btn">
			<img src="../resources/chat/img/close.svg" alt="닫기">
		</button>
	</div>
	
	<div class="chatting-list">
		<div class="wrap">
    </div>
			
	</div>
	
	<div class="chat-write-area">
		<div id="chat-write-input" contenteditable="true"></div>
		<button class="send-messagebtn" type="button">전송</button>
	</div>
</article>

<script>
var ws;
var csrfToken = $("meta[name='_csrf']").attr("content");

const chattingLayer = $('.chatting-layer');
const chattingRoom = $('.chatting-room');
const CreateChat = $('.create-chat-icon').attr('src');
const backBtn = $('.back-btn');

//채팅방 업데이트 날짜를 파싱하는 함수임
function chatRoomUpdateDate(updated_at) {
    const currentDate = new Date();
    const messageDate = new Date(updated_at);

    if (currentDate.toDateString() === messageDate.toDateString()) {
        // 오늘인 경우
        return '오늘';
    } else {
        currentDate.setDate(currentDate.getDate() - 1); // 어제의 날짜
        if (currentDate.toDateString() === messageDate.toDateString()) {
            // 어제인 경우
            return '어제';
        } else {
            // 그 외의 경우 yyyy-MM-dd 형식으로 표시
            const year = messageDate.getFullYear();
            const month = (messageDate.getMonth() + 1).toString().padStart(2, '0');
            const day = messageDate.getDate().toString().padStart(2, '0');
            return year + '-' + month + '-' + day;
        }
    }
}//chatRoomUpdateDate end

function getNotReadCnt(){
	$.ajax({
		type: "GET",
		url: "${pageContext.request.contextPath}/get-not-read-cnt",
		beforeSend: function (xhr) {
			xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
		},
		success: function(result){
			if(result !== 0){
				$('.chat-not-read').css('display', 'block');
				$('.chat-not-read .not-read-cnt').text(result);
				console.log("읽지 않은 채팅방 수" + result);
			} else if(result === 0 & $('.chat-not-read').css('display')==='block'){
				$('.chat-not-read').css('display', 'none');
			}
		}
	});
}

function pollNotReadCnt() {
    setInterval(function() {
    	getNotReadCnt(); // 위에서 정의한 함수 호출
      /* console.log('안 읽은 메시지 이력 polling'); */
    }, 2000);
}

pollNotReadCnt();

function getChatRoomList() {
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-room-list",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.chat-list').empty();
            if (response.length > 0) {
                response.forEach(function (item) {
										
                		if(item.not_read === 1 && item.resent_sender == item.other_participant_id){
                    	str = '<li class="chat-room" value="' + item.id + '" style="background-color:#e6e7ff;">'
                		} else{
                			str = '<li class="chat-room" value=" ' + item.id + '">'
                		}
                    str += '<input type="hidden" class="other-participant" value="' + item.other_participant_id + '">'
                    str += '<div class="chat-img-user-latest">'
                    if(item.participant_pic !== null){
                    	str += '<img class="chat-user-img" src="${pageContext.request.contextPath}/upload' + item.participant_pic + '" alt=""></div>'
                    } else{
                    	str += '<img class="chat-user-img" src="${pageContext.request.contextPath}/user/img/profile.png" alt=""></div>'
                    }
                    str += '<div class="user-latest">'
                    str += '<p class="chat-user-id">' + item.participant_name + '</p>'
                    if(item.resent_content.length > 20){
                    	str += '<p class="latest-chat">' + item.resent_content.substring(0, 20) + '...</p></div>'
                    } else{
                    	str += '<p class="latest-chat">' + item.resent_content + '</p></div>'
                    }
                    str += '<div class="chat-update-time-area">'
                    str += '<span class="chat-update-time">' + chatRoomUpdateDate(item.updated_at) + '</span></div></li>'

                    $('.chat-list').append(str);
                });//forEach end
                //수정 필요
            } else {
                str = '<h4 class="no-chat-room">채팅방이 없습니다.</h4>'
                $('.chat-list').append(str);
            }
        }, // success end
        error: function (error) {
            console.error("Error: " + error);
        }
    }) // ajax end
};//getChatRoomList end

// 내가 속한 채팅 리스트를 호출해오는 polling 함수
function pollChatRoomList() {
    setInterval(function() {
        if ($('.chat-list-area').css('display') !== 'none') {
            getChatRoomList(); // 위에서 정의한 함수 호출
           /*  console.log('채팅방 목록 polling'); */
        }
    }, 5000); 
}

// 폴링 시작
pollChatRoomList();


$('.chat-room-list').click(function () {
    
}) //.chat-room click end

$(document).on('click', '.chat-room', function () {
    let chatRoomId = $(this).val();
    let otherParticipant = $(this).find('.other-participant').val();
    console.log('선택한 채팅방 = ' + chatRoomId);
    $('.msg-to').val(otherParticipant);
    
    let participantImg = $(this).find('.chat-user-img').attr("src");
		chatUserImg = $('.chatting-room').find('.chat-user-img')
		
    getChatListById(chatRoomId, otherParticipant, participantImg);

    const chatUserName = $(this).find('.chat-user-id');
    console.log(chatUserName.text());
    $('.chat-user-txt').text(chatUserName.text());
		chatUserImg.attr('src', participantImg);
    
    $('.chatting-layer').css('display', 'none');
    $('.chatting-room').css('display', 'block');

    try {

        if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
            console.log("WebSocket is already opened.");
            return;
        }

        var url = "ws://" + location.host + "${pageContext.request.contextPath}/echo.do?roomNum=" + chatRoomId;
        // 여기 url에 roomnumber 붙여서 보낸 다음, handler에서 쿼리스트링으로 추출한다.
        ws = new WebSocket(url);
        console.log(url);


    } catch (error) {
        console.error("방 번호 가져오기 실패: " + error);
    }

    ws.onopen = function (event) {
        console.log('연결되었습니다.')
        console.log('연결정보' + event);
    };
    ws.onmessage = function (event) {
        console.log('전송 이벤트 발생.')
        console.log("onmessage로 찍힌 값 = " + event.data);
        writeResponse(event.data);
    }

    $('.chat-menu-close-btn, .back-btn').click(function () {
        if (ws !== undefined && ws.readyState === WebSocket.OPEN) {
            ws.close();
        }

        ws.onclose = function (event) {
            console.log("Connection closed!!");
        };
    });

    $('.chat-icon').click(function () { //채팅창 열린 상태에서 이거 누르면 닫히게 되니 display가 none인데 웹소켓 열려있으면 닫아버림
        if ($('.chatting-layer').css('display') === 'none' && ws !== undefined && ws.readyState === WebSocket.OPEN) {
            ws.close();
        }
        ws.onclose = function (event) {
            console.log("Connection closed!!");

        };
    });

    $('.alarm-icon').click(function () {
		ws.close();
        ws.onclose = function (event) {
        console.log("Connection closed!!");
        };
    }) //alarm-icon click end

});//chatroom click end

$('.alarm-icon').click(function () {
    if ($('.chatting-layer').css('display') === 'block' || $('.chatting-room').css('display') === 'block') {
    	$('.chatting-layer').css('display', 'none');
    	$('.chatting-room').css('display', 'none');
    }
}) //alarm-icon click end

//getChatList
function getChatListById(chatRoomId, otherParticipant, participantImg) {
    let previousMessageDate = null; // 이전 메시지의 날짜를 저장할 변수
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-list-by-id",
        data: { selectedRoomNum: chatRoomId },
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.wrap').empty();
            let nowDate = new Date();
            let nowDateParse = getYyyyMmDd(nowDate);
            /* console.log("파싱된 오늘 날짜는 = " + nowDateParse); */

            response.forEach(function (item) {
                let msgCreateDate = new Date(item.created_at);
                let msgCreateDateParse = getYyyyMmDd(msgCreateDate);
                /* console.log("파싱된 메시지 작성일 = " + msgCreateDateParse); */

                // 날짜 구분 표시를 위한 비교
                if (previousMessageDate !== msgCreateDateParse) {
                    let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
                    let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
                    $('.wrap').append(dateDisplay);
                    previousMessageDate = msgCreateDateParse; // 이전 메시지의 날짜 업데이트
                }

                let sendTime = new Date(item.created_at);
                let hours = sendTime.getHours();
                let minutes = sendTime.getMinutes();
                let period = "오전";
                let myProfileImg = $('.avatar-online').find('img').attr("src");
                console.log("내 이미지 = " + myProfileImg);

                if (hours === 0) {
                    hours = 12; // 오전 12시를 00으로 표시
                } else if (hours === 12) {
                    period = "오후";
                } else if (hours > 12) {
                    period = "오후";
                    hours -= 12;
                }

                // 시간과 분을 두 자리로 표시하기
                let formattedHours = hours < 10 ? '0' + hours : hours;
                let formattedMinutes = minutes < 10 ? '0' + minutes : minutes;
                let MsgsendTime = period + " " + formattedHours + ":" + formattedMinutes;

                if (item.msg_from == otherParticipant) {
                    let str = '<div class="chat not-me">';
                    str += '<div class="icon">';
                    str += '<img class="chat-user-img" src="' + participantImg + '" alt=""></div>';
                    str += '<input type="hidden" class="receiver" value="' + otherParticipant + '">'
                    str += '<div class="textbox">' + item.content + '</div>';
                    str += '<div class="chat-read-send">';
                    str += '<span class="read-count"></span>';
                    str += '<span class="send-time">' + MsgsendTime + '</span></div></div>'
                    $('.wrap').append(str);
                } else {
                    let str = '<div class="chat me">';
                    str += '<div class="icon">';
                    str += '<img class="chat-user-img" src="' + myProfileImg + '" alt=""></div>';
                    str += '<input type="hidden" class="receiver" value="' + item.msg_from + '">'
                    str += '<div class="textbox">' + item.content + '</div>';
                    str += '<div class="chat-read-send">';
                    str += '<span class="read-count"></span>';
                    str += '<span class="send-time">' + MsgsendTime + '</span></div></div>'
                    $('.wrap').append(str);
                }
            }); // forEach end
        },
        error: function (error) {
            console.error("Error: " + error);
        }
    }); //ajax end
}; // getChatList end

$('.chat-icon').click(function () {
    if (chattingLayer.css('display') === 'none' && chattingRoom.css('display') === 'none') {
        chattingLayer.fadeIn(100);
        $('.on').removeClass('on');
        $('.chat-on').addClass('on');

        $('.chat-contact-area').hide();
        $('.chat-list-area').show();
				
        $('.notify-layer').css('display', 'none');
        getChatRoomList();
    } else {
        chattingLayer.fadeOut(100);
        chattingRoom.fadeOut(100);
    }
}); // chat-icon click end


$('.chat-menu-close-btn').click(function () {
    chattingLayer.fadeOut(100);
    chattingRoom.fadeOut(100);
    $('.chat-list-area').css('display', 'none');
});

$('#contactbtn').click(function () {
    $('.chat-on').removeClass('on');
    $('.contact').addClass('on');
    $('.chat-contact-area').show();
    $('.chat-list-area').hide();
});

$('#chatbtn').click(function () {
	getChatRoomList();
    $('.on').removeClass('on');
    $('.chat-on').addClass('on');
    $('.chat-contact-area').hide();
    $('.chat-list-area').show();
    if( $('.chat-list-area').css('display') === 'none'){
    	$('.chat-list-area').css('display', 'block');
    }
});

$('.create-chat-icon').hover(
    function () {
        if (CreateChat === '../resources/mainboard/assets/img/chat-lightgrey.svg') {
            $(this).attr('src', '../resources/mainboard/assets/img/chat-hover.svg');
        }
    },
    function () {
        $(this).attr('src', '../resources/mainboard/assets/img/chat-lightgrey.svg');
    }
);

$('.create-chat-icon, .chat-room').click(function () {
    chattingLayer.css('display', 'none');
    chattingRoom.css('display', 'block');
}); // chattingRoom open click end


function updateReadCnt(selectedRoomId){
	$.ajax({
    	type: "POST",
    	url: "${pageContext.request.contextPath}/update-read-cnt",
    	data:{selectedRoomNum:selectedRoomId},
      beforeSend: function (xhr) {
				xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
     	},
     	success: function(result){
     		if(result === true){
     			console.log("not-read 업데이트 성공...!");
     		} else if(result === false){
     			console.log("안 읽은 메시지가 없습니다.");
     		}
     	},
        error: function (error) {
            console.error("not-read 업데이트 실패...!: " + error);
        }
    });//ajax end
}

$(document).on('click', '.chat-room', function(){
	   const selectedRoomId = $(this).val();
	    console.log("선택한 채팅방 = " + selectedRoomId);
	    
	    $('.selected-room-num').val(selectedRoomId);
	  	updateReadCnt(selectedRoomId);
});

// 상대방이 메시지를 보냈는데 내가 해당 채팅방에 잇는 경우에 실행
setInterval(function() {
if($('.chatting-room').css('display') === 'block'){
	const num = $('.selected-room-num').val();
	const otherParticipant = $('.chatting-room').find('.msg-to').val();
/* 	console.log("현재 접속 중인 채팅방 : " + num);
	console.log("나와 대화 중인 상대 : " + otherParticipant); */
	$.ajax({
		type: "GET",
		url: "${pageContext.request.contextPath}/get-room-info",
		data: {selectedRoomNum:num},
		beforeSend: function (xhr) {
			xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
		},
		success: function(response){
			if(response.resent_sender == otherParticipant){
				updateReadCnt(num);
			}
		}
	});//ajax end
}
}, 1000);

const chatWriteInput = $('#chat-write-input');

chatWriteInput.text('shift+enter는 줄바꿈, enter는 입력입니다.');

chatWriteInput.on('blur', function () {
    if ($(this).text() === '') {
        $(this).text('shift+enter는 줄바꿈, enter는 입력입니다.');
    }
});

chatWriteInput.on('focus', function () {
    if ($(this).text() === 'shift+enter는 줄바꿈, enter는 입력입니다.') {
        $(this).text('');
    }
});



chatWriteInput.on('keydown', function (e) {
    if (e.keyCode === 13 && !e.shiftKey) {
        e.preventDefault();
        var inputText = $(this).text();
        console.log(inputText);
        $(this).text('');
    }
});

backBtn.click(function () {
    chattingRoom.css('display', 'none');
    chattingLayer.css('display', 'block');
}); //backbtn click end



//contact click
$('.contact').click(function () {
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-employee-list",
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.contact-list').empty();
            if (response.length > 0) {
                response.forEach(function (item) {
                    let str = '<li class="contact-user">';
                    str += '<div class="chat-img-user-latest">';
                    if(item.user_pic !== null){
                    	str += '<img class="chat-user-img" src="${pageContext.request.contextPath}/upload' + item.user_pic + '" alt="">';
                    } else{
                    	str += '<img class="chat-user-img" src="${pageContext.request.contextPath}/user/img/profile.png" alt="">';
                    }
                    str += '</div>';
                    str += '<input type="hidden" class="employee-id" name="employeeId" value="' + item.id + '">'
                    str += '<div class="contact-user-info">';
                    str += '<p class="chat-user-id">' + item.user_name + '</p>';
                    str += '<p class="chat-user-company">' + item.user_email + '</p></div>';
                    str += '<button class="create-chat">';
                    str += '<img class="create-chat-icon" src="../resources/mainboard/assets/img/chat-lightgrey.svg">';
                    str += '</button></li>'

                    $('.contact-list').append(str);

                }) // forEach
            }
        }, //success
        error: function (error) {
            console.error("Error: " + error);
        }
    })
}); // contact click end

function convertNewlinesToBr(inputText) {
    return inputText.replace(/\n/g, '<br>');
}

//비동기 호출 값을 가져오기 위한 promise
function getRoomNum(participantId) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/get-room-num",
            data: { participant: participantId },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (result) {
                resolve(result);
                console.log('방 번호 결과 = ' + result);
            },
            error: function (error) {
                reject(error);
            }
        });
    });
}

// 채팅 생성 버튼을 클릭한 경우
$(document).on('click', '.create-chat', async function () {
    const chatUserName = $(this).parents('.contact-user').find('.chat-user-id');
    console.log(chatUserName.text());
    $('.chat-user-txt').text(chatUserName.text());

    $('.chatting-layer').css('display', 'none');
    $('.chatting-room').css('display', 'block');

    const participantId = $(this).parent('.contact-user').find('.employee-id').val();
    let participantImg = $(this).parent('.contact-user').find('.chat-user-img').attr('src');
    console.log("선택한 동료 정보 = " + participantId);
    console.log("선택한 동료의 프로필 이미지 = " + participantImg);
    
    $('.chatting-room').find('.chat-user-img').attr('src', participantImg);

    // 채팅방 먼저 생성
    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/create-room",
        data: { participant: participantId },
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: async function (result) {
            if (result == true) {
                console.log("채팅방이 생성되었습니다.");

                // 방이 생성된 후에 방 번호를 가져옴
                try {
                    const roomNum = await getRoomNum(participantId);
                    $('.selected-room-num').val(roomNum);
                    console.log("roomNum값은...? = " + roomNum);

                    const url = "ws://" + location.host + "${pageContext.request.contextPath}/echo.do?roomNum=" + roomNum;
                    ws = new WebSocket(url);
                    console.log(url);

                    ws.onopen = function (event) {
                        console.log('연결되었습니다.')
                        console.log('연결정보' + event);
                    };
                    ws.onmessage = function (event) {
                        console.log('전송 이벤트 발생.')
                        console.log("onmessage로 찍힌 값 = " + event.data);
                        writeResponse(event.data);
                    }

                    getChatList(participantId, participantImg); // 채팅 리스트 호출

                } catch (error) {
                    console.error("방 번호 가져오기 실패: " + error);
                }
            } else if (result == false) {
                console.log("이미 개설된 채팅방입니다.");
                const roomNum = await getRoomNum(participantId);
                $('.selected-room-num').val(roomNum);
                console.log("roomNum값은...? = " + roomNum);
								
                updateReadCnt(roomNum);
                
                const url = "ws://" + location.host + "${pageContext.request.contextPath}/echo.do?roomNum=" + roomNum;
                ws = new WebSocket(url);
                console.log(url);

                ws.onopen = function (event) {
                    console.log('연결되었습니다.')
                    console.log('연결정보' + event);
                };
                ws.onmessage = function (event) {
                    console.log('전송 이벤트 발생.')
                    console.log("onmessage로 찍힌 값 = " + event.data);
                    writeResponse(event.data);
                }

                getChatList(participantId, participantImg); // 채팅 리스트 호출
            }

            $('.msg-to').val(participantId);
        },
        error: function (error) {
            console.error("Error: " + error);
        }
    });
    
    if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
        console.log("WebSocket is already opened.");
        return;
    }

    $('.chat-menu-close-btn, .back-btn').click(function () {
        if (ws !== undefined && ws.readyState === WebSocket.OPEN) {
            ws.close();
        }

        ws.onclose = function (event) {
            console.log("Connection closed!!");
        };
    });

    $('.chat-icon').click(function () {
        if ($('.chatting-layer').css('display') === 'none' && ws !== undefined && ws.readyState === WebSocket.OPEN) {
            ws.close();
        }
        ws.onclose = function (event) {
            console.log("Connection closed!!");
        };
    });

    $('.alarm-icon').click(function () {
        if ($('.chatting-room').css('display') === 'block') {
            $('.chatting-room').css('display', 'none');
            ws.close();
        }
        ws.onclose = function (event) {
            console.log("Connection closed!!");
        };
    });
});

//채팅방 목록 불러오기
$('.back-btn').click(function(){
	getChatRoomList();
});

//getYyyyMmDd
function getYyyyMmDd(date) {
    let year = date.getFullYear();
    let month = '' + (date.getMonth() + 1);
    let day = '' + date.getDate();
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    let formattedDateParse = year + '-' + month + '-' + day;
    return formattedDateParse;
}

function formatKoreanDateWithDay(dateString) {
    let date = new Date(dateString);
    let year = date.getFullYear();
    let month = '' + (date.getMonth() + 1);
    let day = '' + date.getDate();

    return year + '년' + month + '월' + day + '일 ';
}

//getChatList
function getChatList(participantId, participantImg) {
    let previousMessageDate = null; // 이전 메시지의 날짜를 저장할 변수
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/get-chat-list",
        data: { msgTo: participantId },
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            $('.wrap').empty();
            let nowDate = new Date();
            let nowDateParse = getYyyyMmDd(nowDate);
            console.log("파싱된 오늘 날짜는 = " + nowDateParse);

            response.forEach(function (item) {
                let msgCreateDate = new Date(item.created_at);
                let msgCreateDateParse = getYyyyMmDd(msgCreateDate);
                console.log("파싱된 메시지 작성일 = " + msgCreateDateParse);

                // 날짜 구분 표시를 위한 비교
                if (previousMessageDate !== msgCreateDateParse) {
                    let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
                    let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
                    $('.wrap').append(dateDisplay);
                    previousMessageDate = msgCreateDateParse; // 이전 메시지의 날짜 업데이트
                }

                let sendTime = new Date(item.created_at);
                let hours = sendTime.getHours();
                let minutes = sendTime.getMinutes();
                let period = "오전";
                let myProfileImg = $('.avatar-online').find('img').attr("src");
                console.log("내 이미지 = " + myProfileImg);

                if (hours === 0) {
                    hours = 12; // 오전 12시를 00으로 표시
                } else if (hours === 12) {
                    period = "오후";
                } else if (hours > 12) {
                    period = "오후";
                    hours -= 12;
                }

                // 시간과 분을 두 자리로 표시하기
                let formattedHours = hours < 10 ? '0' + hours : hours;
                let formattedMinutes = minutes < 10 ? '0' + minutes : minutes;
                let MsgsendTime = period + " " + formattedHours + ":" + formattedMinutes;

                if (item.msg_from == participantId) {
                    let str = '<div class="chat not-me">';
                    str += '<div class="icon">';
                    str += '<img class="chat-user-img" src="' + participantImg + '" alt=""></div>';
                    str += '<input type="hidden" class="receiver" value="' + participantId + '">'
                    str += '<div class="textbox">' + item.content + '</div>';
                    str += '<div class="chat-read-send">';
                    str += '<span class="read-count"></span>';
                    str += '<span class="send-time">' + MsgsendTime + '</span></div></div>'
                    $('.wrap').append(str);
                } else {
                    let str = '<div class="chat me">';
                    str += '<div class="icon">';
                    str += '<img class="chat-user-img" src="' + myProfileImg + '" alt=""></div>';
                    str += '<input type="hidden" class="receiver" value="' + item.msg_from + '">'
                    str += '<div class="textbox">' + item.content + '</div>';
                    str += '<div class="chat-read-send">';
                    str += '<span class="read-count"></span>';
                    str += '<span class="send-time">' + MsgsendTime + '</span></div></div>'
                    $('.wrap').append(str);
                }
            }); // forEach end
        },
        error: function (error) {
            console.error("Error: " + error);
        }
    }); //ajax end
}; // getChatList end



//send를 클릭한 경우
$('.send-messagebtn').click(send);

$("#chat-write-input").on("keydown", function (event) {
    if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault();
        send();
    }
});


function send() {
    if ($("#chat-write-input").text().trim() == '') {
        alert("메시지를 입력하세요");
        $("#chat-write-input").focus();
        return false;
    } else {

        let msgCreateDate = new Date();
        let msgCreateDateParse = getYyyyMmDd(msgCreateDate);

        var chatCnt = $('.wrap').children().length;
        if (chatCnt == 0) {
            let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
            let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
            $('.wrap').append(dateDisplay);
        }



        var text = $("#chat-write-input").text() + "," + '${name}';
        var lastIndexComma = text.lastIndexOf(',');
        var resultText = text.substring(0, lastIndexComma);
        let myProfileImg = $('.avatar-online').find('img').attr("src");

        let selectedRoomNum = $('.selected-room-num').val();
        console.log('현재 접속한 채팅방 = ' + selectedRoomNum);

        let msgTo = $('.msg-to').val();
        console.log("메시지 보낼 사람 = " + msgTo);
        //insert chat into db
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/insert-chat",
            data: {
                resultText: resultText,
                msgTo: msgTo
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (result) {
                if (result == true) {
                    console.log("메시지 db 저장 완료!!");
                } else {
                    console.log("메시지 db 저장 실패!!");
                }
            },
            error: function (error) {
                console.error("Error: " + error);
            }
        }); // ajax end

        console.log('전송한 메시지' + text);
        ws.send(text);//웹 소켓으로 text를 보냅니다.보내는 형식(내용,보낸사람)




        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();

        var meridian = "오전";
        if (hours >= 12) {
            meridian = "오후";
            if (hours > 12) {
                hours = hours - 12;
            }
        }
        hours = (hours < 10) ? "0" + hours : hours;
        minutes = (minutes < 10) ? "0" + minutes : minutes;

        var formattedTime = meridian + " " + hours + ":" + minutes;

        let str = '<div class="chat me">';
        str += '<div class="icon">';
        str += '<img class="chat-user-img" src="' + myProfileImg + '" alt=""></div>';
        str += '<div class="textbox">' + resultText + '</div>';
        str += '<div class="chat-read-send">';
        str += '<span class="read-count"></span>';
        str += '<span class="send-time">' + formattedTime + '</span></div></div>'
        $('.wrap').append(str);

        $("#chat-write-input").text('');

    }
}


function writeResponse(rtext) {

    let msgCreateDate = new Date();
    let msgCreateDateParse = getYyyyMmDd(msgCreateDate);
    let participantImg = $('.chatting-room').find('.chat-user-img').attr("src");

    var chatCnt = $('.wrap').children().length;
    if (chatCnt == 0) {
        let formattedDateWithDay = formatKoreanDateWithDay(msgCreateDateParse);
        let dateDisplay = '<div class="chat-date"><span class="chat-date-txt">' + formattedDateWithDay + '</span></div>';
        $('.wrap').append(dateDisplay);
    }


    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();

    var meridian = "오전";
    if (hours >= 12) {
        meridian = "오후";
        if (hours > 12) {
            hours = hours - 12;
        }
    }

    hours = (hours < 10) ? "0" + hours : hours;
    minutes = (minutes < 10) ? "0" + minutes : minutes;

    var formattedTime = meridian + " " + hours + ":" + minutes;

    var firstGreaterThanIndex = rtext.indexOf('>');

    if (firstGreaterThanIndex >= 0) {
        var resultTxt = rtext.substring(firstGreaterThanIndex + 1);
    }

    let str = '<div class="chat not-me">';
    str += '<div class="icon">';
    str += '<img class="chat-user-img" src="' + participantImg + '" alt=""></div>';
    str += '<div class="textbox">' + resultTxt + '</div>';
    str += '<div class="chat-read-send">';
    str += '<span class="read-count"></span>';
    str += '<span class="send-time">' + formattedTime + '</span></div></div>'
    $('.wrap').append(str);
};


//채팅 검색
$('.search-chat').on('keypress', function(event) {
    if (event.which === 13) { // Enter 키 누름 감지
        var searchTerm = $(this).val().trim().toLowerCase(); // 입력된 검색어 (공백 제거 및 소문자로 변경)

        // 검색어가 비어 있으면 모든 항목을 보여줌
        if (searchTerm === "") {
            $('.contact-list .contact-user, .chat-list .chat-room').show();
            return; // 빈 검색어일 경우 검색 과정 종료
        }

        // 표시되는 항목에서 검색 수행
        if ($('.chat-contact-area').css('display') === 'block') {
            $('.contact-list .contact-user:visible').each(function() {
                var contactUserId = $(this).find('.chat-user-id').text().toLowerCase();

                if (contactUserId.includes(searchTerm)) {
                    $(this).show(); // 검색어와 일치하는 결과 표시
                } else {
                    $(this).hide(); // 일치하지 않는 결과 숨김
                }
            });
        } else {
            $('.chat-list .chat-room:visible .chat-user-id').each(function() {
                var chatUserId = $(this).text().toLowerCase();

                if (chatUserId.includes(searchTerm)) {
                    $(this).closest('.chat-room').show(); // 검색어와 일치하는 결과 표시
                } else {
                    $(this).closest('.chat-room').hide(); // 일치하지 않는 결과 숨김
                }
            });
        }
    }
});






	 

</script>

