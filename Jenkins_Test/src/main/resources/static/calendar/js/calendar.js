var csrfToken = $("meta[name='_csrf']").attr("content");

function openModal() {
    if($('.create-schedule-modal').css('display') === 'none'){
    	$('.create-schedule-modal').fadeIn(200);
    } 
}

$('.fc-daygrid-day').click(function(){
	if($('.create-schedule-modal').css('display') === 'none'){
  	$('.create-schedule-modal').fadeIn(200);
  } 
})

$('.close').click(function(){
	if($('.manage-schedule-modal').css('display') === 'block'){
		$('.manage-schedule-modal').fadeOut(200);
	} 	
	if($('.create-schedule-modal').css('display') === 'block'){
  	$('.create-schedule-modal').fadeOut(200);
  } 
})

//overlay 클릭 시 모달 닫기
$('.modal-overlay').click(function(){
	if($('.create-schedule-modal').css('display') === 'block' || $('.manage-schedule-modal').css('display') === 'block'){
		$('.create-schedule-modal').fadeOut(200);
		$('.manage-schedule-modal').fadeOut(200);
	}
});

//유효성 검사
$('.save').click(function(){
	if($('#eventTitle').val().trim() === ''){
		alert('제목을 입력하여 주세요.');
		return false;
	} else if($('.schedule-start').val().trim() === ''){
		alert('시작일을 선택하여 주세요.');
		return false;
	} else if($('.schedule-end').val().trim() === ''){
		alert('마감일을 선택하여 주세요.');
		return false;
	} else if($('#eventLocation').val().trim() === ''){
		alert('장소를 입력하여 주세요.');
		return false;
	} else if($('#eventDescription').val().trim() === ''){
		alert('일정에 대한 설명을 작성해 주세요.');
		return false;
	}
});

$('.modify').click(function(){
	if($('.schedule-title').val().trim() === ''){
		alert('제목을 입력하여 주세요.');
		return false;
	} else if($('.md-schedule-start').val().trim() === ''){
		alert('시작일을 선택하여 주세요.');
		return false;
	} else if($('.md-schedule-end').val().trim() === ''){
		alert('마감일을 선택하여 주세요.');
		return false;
	} else if($('#mdEventLocation').val().trim() === ''){
		alert('장소를 입력하여 주세요.');
		return false;
	} else if($('#mdEventDescription').val().trim() === ''){
		alert('일정에 대한 설명을 작성해 주세요.');
		return false;
	}
});


var startDateInput = document.getElementById("eventStartDate");
var endDateInput = document.getElementById("eventEndDate");
var mdStartDateInput = document.getElementById("mdEventStartDate");
var mdEndDateInput = document.getElementById("mdEventEndDate");

var currentDate = new Date();
var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = String(currentDate.getMonth() + 1).padStart(2, '0');
var currentDay = String(currentDate.getDate()).padStart(2, '0');
var currentHours = String(currentDate.getHours()).padStart(2, '0');
var currentMinutes = String(currentDate.getMinutes()).padStart(2, '0');

//현재 시간 추출 후 schedule-start에 할당
var currentDateISOString = `${currentYear}-${currentMonth}-${currentDay}T${currentHours}:${currentMinutes}`;

console.log(currentDate);
console.log(currentDateISOString);

//초기 시작, 마감일 값을 현재 년월일, 시분으로 제한
startDateInput.min = currentDateISOString;
startDateInput.value = currentDateISOString;
endDateInput.min = currentDateISOString;
mdEndDateInput.min = currentDateISOString;

mdStartDateInput.min = currentDateISOString;
mdStartDateInput.value = currentDateISOString;


//시작일 설정 제한 함수
startDateInput.addEventListener("input", function() {
    var selectedStartDate = new Date(startDateInput.value);

    if (selectedStartDate < currentDate) {
        startDateInput.value = currentDateISOString;
        alert("시작일은 현재 날짜 이전으로 설정할 수 없습니다.");
    }

    var formattedDate = new Date(selectedStartDate.getTime() + 60000).toISOString().slice(0, 16);
    endDateInput.min = formattedDate;


});

//마감일 설정 제한 함수
endDateInput.addEventListener("input", function() {
    var selectedStartDate = new Date(startDateInput.value);
    var selectedEndDate = new Date(endDateInput.value);

    if (selectedEndDate < selectedStartDate) {
        alert("마감일은 시작일 이전으로 설정할 수 없습니다.");
        $('.schedule-end').val('');
    }
});

if($('.md-schedule-start').val() < currentDateISOString){
	$('.md-schedule-start').attr('readonly', true);
}

// 마감일 설정 제한 함수
mdEndDateInput.addEventListener("input", function() {
    var selectedStartDate = new Date(mdStartDateInput.value);
    var selectedEndDate = new Date(mdEndDateInput.value);

    if (selectedEndDate < selectedStartDate) {
        alert("마감일은 시작일 이전으로 설정할 수 없습니다.");
        mdEndDateInput.value = '';
    }
});
