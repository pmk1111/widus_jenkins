$(document).ready(function () {
    var csrfToken = $("meta[name='_csrf']").attr("content");

    const date = new Date();
    const yyyy = date.getFullYear();
    const mm = date.getMonth() + 1;
    const dd = date.getDate();

    const dayOfWeek = new Date(yyyy, mm - 1, dd).getDay();
    console.log("오늘 요일 = " + dayOfWeek);

    const dayArr = ['일', '월', '화', '수', '목', '금', '토'];
    const fullDateInfo = yyyy + '-' + mm + '-' + dd + '(' + dayArr[dayOfWeek] + ')';

    console.log(fullDateInfo);
    $('.schedule-date').text(fullDateInfo);

    //mydashboard calendar
    function prevMonth(date) {
        var target = new Date(date);
        target.setDate(1);
        target.setMonth(target.getMonth() - 1);

        return getYmd(target);
    }

    function nextMonth(date) {
        var target = new Date(date);
        target.setDate(1);
        target.setMonth(target.getMonth() + 1);

        return getYmd(target);
    }

    function getYmd(target) {
        // IE에서 날짜 문자열에 0이 없으면 인식 못함
        var month = ('0' + (target.getMonth() + 1)).slice(-2);
        return [target.getFullYear(), month, '01'].join('-');
    }

    function fullDays(date) {
        var target = new Date(date);
        var year = target.getFullYear();
        var month = target.getMonth();

        var firstWeekDay = new Date(year, month, 1).getDay();
        var thisDays = new Date(year, month + 1, 0).getDate();

        // 월 표시 달력이 가지는 셀 갯수는 3가지 가운데 하나이다.
        // var cell = [28, 35, 42].filter(n => n >= (firstWeekDay + thisDays)).shift();
        var cell = [28, 35, 42].filter(function (n) {
            return n >= (firstWeekDay + thisDays);
        }).shift();

        // 셀 초기화, IE에서 Array.fill()을 지원하지 않아서 변경
        // var days = new Array(cell).fill({date: '', dayNum: '', today: false});
        var days = []
        for (var i = 0; i < cell; i++) {
            days[i] = {
                date: '',
                dayNum: '',
                today: false
            };
        }

        var now = new Date();
        var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        var inDate;
        for (var index = firstWeekDay, i = 1; i <= thisDays; index++, i++) {
            inDate = new Date(year, month, i);
            days[index] = {
                date: i,
                dayNum: inDate.getDay(),
                today: (inDate.getTime() === today.getTime())
            };
        }

        return days;
    }

    function drawMonth(date) {
        $('#month-this').text(date.substring(0, 7).replace('-', '.'));
        $('#month-prev').data('ym', prevMonth(date));
        $('#month-next').data('ym', nextMonth(date));

        $('#tbl-month').empty();

        var td = '<td class="__REST__ __TODAY__"><a __HREF__><span>__DATE__<span></a></td>';
        var href = '/depart/schedule?date=' + date.substring(0, 8);
        var hasEvent;
        var tdClass;
        var week = null;
        var days = fullDays(date);
        for (var i = 0, length = days.length; i < length; i += 7) {
            // 전체 셀을 주단위로 잘라서 사용
            week = days.slice(i, i + 7);

            var $tr = $('<tr></tr>');
            week.forEach(function (obj, index) {

                tdClass = (index === 0) ? 'sun' : '';
                tdClass = (index === 6) ? 'sat' : tdClass;

                $tr.append(td.replace('__REST__', tdClass)
                    .replace('__TODAY__', (obj['today']) ? 'today' : '')
                    .replace('__HREF__', (hasEvent) ? 'href="' + href + ('0' + obj['date']).slice(-2) + '"' : '')
                    .replace('__DATE__', obj['date']));

                
            });
            $('#tbl-month').append($tr);
            //오늘 날짜에 date-select 클래스 추가	
						$('.today a').addClass('date-select');
        }
    }

    $(function () {
        var date = (new Date()).toISOString().substring(0, 10);
        drawMonth(date);

        $('.month-move').on('click', function (e) {
            e.preventDefault();

            drawMonth($(this).data('ym'));
        });
    });

    $(function () {
        // 클릭 이벤트 핸들러 추가
        $('#tbl-month').on('click', 'td a', function (e) {
            e.preventDefault();

            // 모든 td 요소에서 on 클래스 제거
            $('#tbl-month td a').removeClass('date-select');

            // 클릭한 <a> 태그의 부모 <td> 요소에 on 클래스 추가
            $(this).addClass('date-select');

            var SelectedDate = $(this).text();

            // 해당 날짜의 년, 월, 일을 추출
            var yearMonth = $('#month-this').text(); // 현재 표시된 년월
            var year = yearMonth.split('.')[0]; // 년도
            var month = yearMonth.split('.')[1]; // 월
            var day = SelectedDate; // 클릭한 날짜

            const pickedDate = year + "-" + month + "-" + day
            console.log("선택한 날짜 = " + pickedDate);

            // 요일 표시
            var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
            var selectedDateObj = new Date(year, month - 1, day); // Date 객체로 변환
            var today = daysOfWeek[selectedDateObj.getDay()]; // getDay() 메서드로 요일값 가져옴

            // 콘솔에 년, 월, 일을 표시
            console.log('오늘 날짜와 요일:', year + '/' + month + '/' + day + ' (' + today + ')');

            $.ajax({
                type: 'GET',
                url: '../mainboard/get-selected-schedule-list', // 서버 엔드포인트 URL 설정
                data: { pickedDate: pickedDate },
                //contentType: 'application/json', // 데이터 타입 설정
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
                },
                success: function (response) {
                    console.log('서버 응답:', response);
                    $('.schedules').empty()
                    if (response.length > 0) {
                        ;
                        response.forEach(function (item) {
                            let str = '<li class="schedule-item">'
                            str += '<input type="hidden" class="schedule-id" value="' + item.id + '">'
                            str += '<img src="../resources/mydashboard/img/calendar.svg" class="schedule-calendar-img">'
                            str += '<div class="schedule-title-date">'
                            str += '<span class="schedule-title">' + item.subject + '</span>'
                            str += '<span class="schedule-date">' + pickedDate + '(' + today + ')' + '</span>'
                            str += '</div></li>'

                            $('.schedules').append(str);
                        }); //forEach end
                    } else {
                        let noScheduleMsg = '<p class="no-schdule-today">등록된 일정이 없습니다.</p>'
                        $('.schedules').append(noScheduleMsg);
                        console.log('내 일정이 없습니다.');
                    }
                },
                error: function (error) {
                    console.error('오류:', error);
                }
            });
        });
    });







    const memoContent = document.getElementById('memo-content');

    let memoTxt = memoContent.textContent.trim();
    let textExist = "";

    if (memoTxt === "") {
        memoContent.innerHTML = "내용을 입력하세요.";
        memoContent.style.color = 'lightgrey';
    }

    // 메모 저장 버튼 클릭 시
    memoContent.addEventListener('click', function () {
        if (memoContent.textContent.trim() === "내용을 입력하세요.") {
            memoContent.innerHTML = ""; // 초기화
            memoContent.style.color = '#697a8d';
        }
    });

    function saveMemo() {
        const newText = memoContent.innerHTML.trim(); // 클릭 이후의 내용 가져오기 (앞뒤 공백 제거)
        if (newText !== "") {
            textExist = newText; // 클릭 이후의 내용을 textExist에 저장
        }

        // 이스케이핑: HTML 엔터티로 변환
        $.ajax({
            url: '../mainboard/saveMemoContent',
            type: 'GET',
            data: {
                memoTxt: newText
            },
            //beforeSend: function (xhr) {
            //        xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            //},
            success: function (data) {
                memoContent.innerHTML = ""; // 초기화
                memoContent.innerHTML = textExist; // 클릭 이후의 내용으로 복원
                memoContent.style.color = '#697a8d';
                console.log('메모 저장 성공');
            },
            error: function (error) {
                console.error('메모 저장 실패:', error);
            }
        });
    }

    // 메모 영역을 떠날 때 메모 저장
    memoContent.addEventListener('blur', saveMemo);

    // 페이지 로드 시 메모 내용 초기화
    window.addEventListener('load', function () {
        saveMemo();
    });


    // 상태 갯수를 가져와 표시
    $.ajax({
        url: '../mainboard/CountPerStatus',
        type: 'GET',
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (issuecount) {
            if (issuecount.length > 0) {
                // 데이터가 비어있지 않으면 작업 수행
                console.log(issuecount[0].totalcount);
                console.log(issuecount[0].todocount);
                console.log(issuecount[0].progresscount);
                console.log(issuecount[0].resolvedcount);
                console.log(issuecount[0].donecount);

                // issuecount 데이터를 사용하여 숫자 업데이트
                $(".total-work span").text(issuecount[0].totalcount);
                $(".ToDo-work>h4>span").text(issuecount[0].todocount);
                $(".Progress-work>h4>span").text(issuecount[0].progresscount);
                $(".Resolved-work>h4>span").text(issuecount[0].resolvedcount);
                $(".Done-work>h4>span").text(issuecount[0].donecount);

                // animatePercentage() 함수 호출
                animatePercentage();
                console.log('============================')
                console.log($('.ToDo-work span').text());
            } else {
                // 데이터가 비어 있는 경우의 처리
                console.log("데이터가 비어 있습니다.");
            }
        },
        error: function (error) {
            // 데이터 가져오기에 실패했을 때 이 코드를 실행
            console.error('데이터를 가져오는 중에 오류가 발생했습니다:', error);
        }
    });


    function animatePercentage() {
    // totalWorkCount를 한 번만 계산하도록 수정
    const totalWorkCount = parseInt($(".total-work span").text());

    $(".situation-list").not(".total-work").each(function () {
        const workCount = parseInt($(this).find("span").text());
        // Calculate the percent
        const percent = Math.floor((workCount / totalWorkCount) * 100);

        console.log(workCount);
        if (isNaN(percent)) {
            // If percent is NaN, display "0%".
            $(this).find(".js-chart-percent").text("0%");
        } else {
            $(this).find(".js-chart-percent").prop('Counter', 0).animate({
                Counter: percent
            }, {
                duration: 1000,
                easing: 'swing',
                step: function (now) {
                    // Display the percentage with Math.round
                    $(this).text(Math.round(now) + "%");
                }
            });
        }
    });
}



    // counter 코드는 그대로 유지
    const counterElement = $("#counter");
    const targetNumber = 1199;
    let duration;

    if (targetNumber < 100) {
        duration = 1000;
    } else if (targetNumber >= 100) {
        duration = 1500;
    }

    let currentNumber = 0;
    let startTime = null;

    function updateCounter(timestamp) {
        if (!startTime) {
            startTime = timestamp;
        }

        const progress = timestamp - startTime;
        const speedFactor = 1 - Math.exp(-progress / duration * 5); // 속도를 조절

        currentNumber = Math.round(targetNumber * speedFactor);
        counterElement.text(currentNumber);

        if (currentNumber < targetNumber) {
            requestAnimationFrame(updateCounter);
        }
    }

    requestAnimationFrame(updateCounter);


    //my-work-list
    $(".work-type li:first-child").addClass("active");

    // 내 작업 항목별 구분
    $(".work-type li").click(function () {
        $(".work-type li").removeClass("active");

        $(this).addClass("active");

        var selectedWorkType = $(this).data('value');

        $.ajax({
            url: "../mainboard/mywork",
            type: "GET",
            data: {
                status: selectedWorkType
            },
            //beforeSend: function (xhr) {
            //          xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            //},
            success: function (mywork) {
                4
                $('.board').empty();
                if (mywork.length > 0) {
                    mywork.forEach(function (item) {
                    		let formattedCreateAt = item.created_at.substring(0, 10);
                        let str = '<li><div class="type-title">'
                        if (item.type === '버그') {
                            str += '<img src="../resources/issue/img/bug.svg"> <span>버그</span>'
                        } else if (item.type === '작업') {
                            str += '<img src="../resources/issue/img/task.svg"> <span>작업</span>'
                        } else {
                            str += '<img src="../resources/issue/img/epic.svg"> <span>에픽</span>'
                        }
                        str += '<a href="../issue/issue-detail?num=' + item.id + '">'
                        str += '<span class="post-title">' + item.subject + '</span></div></a>'
                        str += '<div class="priority-date">'
                        if(item.priority === 'low'){
                        	str += '<span class="mywork-priority low">' + item.priority + '</span>'
                        } else if(item.priority === 'middle'){
                        	str += '<span class="mywork-priority middle">' + item.priority + '</span>'
                        } else if(item.priority === 'high'){
                        	str += '<span class="mywork-priority high">' + item.priority + '</span>'
                        } else if(item.priority === 'critical'){
                        	str += '<span class="mywork-priority critical">' + item.priority + '</span>'
                        } 
                        
                        str += '<span class="post-date">' + formattedCreateAt + '</span></li>'

                        $('.board').append(str);
                    });
                } else {
                    console.log('작업이 없습니다.');
                    $('.board').append('<h4 class="no-work">작업이 없습니다.</h4>')
                }
            },
            error: function (error) {
                console.error("Error: " + error);
            }
        });

    });



    // 일정 상세정보 표시
    $(document).on('click','.schedule-item', function () {
        const scheduleId = $(this).find('.schedule-id').val();
        $.ajax({
            url: "get-schedule-info",
            type: "GET",
            data: { scheduleId: scheduleId },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (response) {
            	console.log(response);
            	
            	var scheduleStartYear = response.start_date.substring(0, 4);
            	var scheduleStartMonth = response.start_date.substring(5, 7);
            	var scheduleStartDate = response.start_date.substring(8, 10);
            	
            	var scheduleEndYear = response.end_date.substring(0, 4);
            	var scheduleEndMonth = response.end_date.substring(5, 7);
            	var scheduleEndDate = response.end_date.substring(8, 10);
            	
            	console.log("일정 시작일" + scheduleStartYear + "년" + scheduleStartMonth + "월" + scheduleStartDate);
							console.log("일정 마감일" + scheduleEndYear + "년" + scheduleEndMonth + "월" + scheduleEndDate);
            	
            	var scheduleStartDOF = new Date(scheduleStartYear, scheduleStartMonth - 1, scheduleStartDate).getDay();
							var scheduleEndDOF = new Date(scheduleEndYear, scheduleEndMonth - 1, scheduleEndDate).getDay();
            	
            	var scheduleDayArr = ['일', '월', '화', '수', '목', '금', '토'];
            	
            	var scheduleStartDay = scheduleDayArr[scheduleStartDOF];
            	var scheduleEndDay = scheduleDayArr[scheduleEndDOF];
            	
            	console.log("일정 시작 요일 = " + scheduleStartDay);
            	console.log("일정 마감 요일 = " + scheduleEndDay);
            	
							$('.title').text(response.subject);
              $('.selected-schedule-modal .name').text(response.name);
              $('.schedule-month').text(response.start_date.substring(0, 7));
              $('.schedule-day').text(response.start_date.substring(8, 10));
              $('.start-at').text(response.start_date + "(" + scheduleStartDay + ")");
              $('.end-at').text(response.end_date + "(" + scheduleEndDay + ")");
              $('.schedule-place').text(response.place);
              if(response.category === '1'){
              	$('.schedule-type').text('업무');
              } else if(response.category === '2'){
              	$('.schedule-type').text('일정');
              } else{
              	$('.schedule-type').text('선택 안함');
              }
              $('.selected-schedule-modal .schedule-content pre').text(response.content);
              
              $('.selected-schedule-modal').fadeIn(300);
            },
            error: function (error) {
                console.error("Error: " + error);
            }

        }) // ajax end
    }); // schedule-item click end 
    
   $('.modal-overlay').click(function(){
		$('.selected-schedule-modal').fadeOut(200);
	})
}); //ready end