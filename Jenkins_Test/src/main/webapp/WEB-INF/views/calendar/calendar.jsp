<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    
</head>

<body style="padding:30px;">
    <div id='calendar-container'>
        <div id='calendar'></div>
    </div>
    <script>
    
	function a(){
		const jsonData = ${calendarList}
		console.log(jsonData);
	}
	a();

    $(function() {
        var calendarEl = $('#calendar')[0];

        calendar = new FullCalendar.Calendar(calendarEl, {
            height: '700px',
            expandRows: true,
            slotMinTime: '00:00',
            slotMaxTime: '23:59',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth listWeek myCustomButton'
            },
            
            initialView: 'dayGridMonth',
            navLinks: true,
            editable: true,
            selectable: true,
            nowIndicator: true,
            dayMaxEvents: true,
            locale: 'ko',
            eventAdd: function(info) {
                console.log(info.event);

            },
            eventChange: function(info) {
                console.log(info.event);

            },
            eventRemove: function(info) {
                console.log(info.event);

            },
            select: function(info) {
                openModal(info);
                calendar.unselect();
                
            },
            customButtons: {
                myCustomButton: {
                    text: '일정추가',
                    click: function() {
                        openModal();
                    }
                },
            },
            eventBackgroundColor: '#9F7AB0',
            eventBorderColor: '#9F7AB0',
            events: ${calendarList},
            eventTimeFormat: {
                // 일정의 시작 및 종료 시간 형식 설정
                hour: '2-digit',
                minute: '2-digit',
                meridiem: false
            },
            
            // ... (기타 설정)
        });

        calendar.render();
        
			
        
        //해당 일정의 식별자 출력
        calendar.on('eventClick', function(info) {
        	//삭제 및 업뎃에도 쓰기 위해 전역으로 뺴준다.
            eventId = info.event.id; 
            console.log("선택한 일정 = " + eventId);
            
            $.ajax({
            	type: 'GET',
            	url:"get-schedule-info",
            	data: {"scheduleId": eventId},
//              beforeSend: function (xhr) {
//              xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
//          		},
							success: function(response){
								$('.manage-schedule-modal .update-target').val(eventId);
								$('.manage-schedule-modal .schedule-title').val(response.subject);
								$('.manage-schedule-modal .select-color').val(response.background_color);
								$('.manage-schedule-modal .md-schedule-start').val(response.start_date);
								$('.manage-schedule-modal .md-schedule-end').val(response.end_date);
								$('.manage-schedule-modal .schedule-place').val(response.place);
								$('.manage-schedule-modal .schedule-category').val(response.category);
								$('.manage-schedule-modal .schedule-describe').val(response.content);

				      }, //success
				      error: function (error) {
				      	console.error("Error: " + error);
				      }
            })
        }); // event click end
        
        
        
        $('.remove').click(function() {
            let userConfirmed = confirm("일정을 삭제하시겠습니까?");
           
            if (userConfirmed == true) {
            	console.log("삭제할 일정 = " + eventId);
							
            	$.ajax({
            		type: "POST",
            		url: "delete-schedule",
            		data: {"scheduleId": eventId},
              	beforeSend: function (xhr) {
                	xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
             		},
								success: function(result){
									if(result === true){
										alert("일정이 삭제되었습니다.");
										window.location.href = "${pageContext.request.contextPath}/calendar/calendar-list";
									} else {
											alert("일정 삭제 중 오류가 발생하였습니다.");
									} //if else end
								},
								error: function (error) {
									console.error("Error: " + error);
								}
            	}) // ajax end
            } // userconfirmed end
        });        
        
    });
    
    
    </script>
</body>

</html>