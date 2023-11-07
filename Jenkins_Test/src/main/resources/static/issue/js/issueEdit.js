  $(document).ready(function () {
  
      
$(".notionchoice").focus(function(){
		$.ajax({
            type: "GET",
            url: "getProjectAndTeamInfo",
            success: function (response) {
            		let hostIndex = location.href.indexOf( location.host ) + location.host.length;
								let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
            		$('.notionchoice').siblings('.issue-create-custom-options').empty();
                if (response.length > 0) {
                	let str = '';
                	console.log(response)
                	response.forEach(function(item){
                		if(item.userPic !== null){
											str += '<div class="issue-create-custom-option mentioned-user" value=@' + item.userName + ' data-id="' + item.userId+ '">'
											str += '<img class="notify-user-img" src="' + contextPath + '/upload' + item.userPic + '"><span class="notify-user-name">' + item.userName + '</span>'
										} else{
											str += '<div class="issue-create-custom-option mentioned-user" value=@' + item.userName + ' data-id="' + item.userId+ '">'
											str += '<img class="notify-user-img" src="' + contextPath + '/user/img/profile.png"><span class="notify-user-name">' + item.userName + '</span>'
										}
										str += '<span class="mentioned-user-id">#' + item.userId + '</span></div>'
                  }); // forEach end
                $('.notionchoice').siblings('.issue-create-custom-options').append(str);
                $('.notionchoice').siblings('.issue-create-custom-options').fadeIn(300);
                } else {
                    console.log("가져온 사용자 정보 없음");
                }
            },
            error: function (error) {
                console.error("Error: " + error);
            }
        }); //ajax end

        $('.select-assign-dropdown').fadeIn(100);
    }); // focus end


//언급할 유저 검색
$(document).on('keyup', '.notionchoice', function() {
    var searchText = $(this).val().toLowerCase(); // 입력된 검색어를 소문자로 변환

    // .mention-list 내의 .mentioned-user 엘리먼트를 순회하면서 필터링
    $('.mention-list .mentioned-user').each(function() {
        var userText = $(this).attr('value'); // .mentioned-user 엘리먼트의 value 값을 가져옴

        if (userText.toLowerCase().includes(searchText)) {
            // 검색어가 포함된 경우 해당 항목을 표시
            $(this).show();
        } else {
            // 검색어가 포함되지 않은 경우 해당 항목을 숨김
            $(this).hide();
        }
    });
});    
    
    
$(document).on('click', '.mentioned-user', function(){
	mentionedUserName = $(this).find('.notify-user-name').text();
	mentionedUserId = $(this).data('id');
	
	$('.notionchoice').val(mentionedUserName);
	$('#inputnotionchoice').val(mentionedUserId);
	
	$(this).parent('.issue-create-custom-options').fadeOut(300);
}); //mentioned-user click end 


	$('.issue-edit').click(function(){
	
		if($('.issue-setting-dropdown').css('display') === 'block'){
			$('.issue-setting-dropdown').fadeOut(200);
		}
		
		if($('.issue-edit-modal').css('display') === 'none'){
			$('.issue-edit-modal').fadeIn(200);
		}
	
	}) //issue-edit


$('modal-overlay').click(function () {
    if ($('.issue-edit-modal').css('display') === 'block') {
      $('.issue-edit-modal').fadeOut(200);
    }
  });

  var issueModalContent = $(".issue-modal-content");
  var createIssueText = $(".create-issue-text");
  var submitResetBtnWrap = $(".submit-reset-btn-wrap");

  issueModalContent.on("scroll", function () {
    var scrollTop = issueModalContent.scrollTop();
    var scrollHeight = issueModalContent[0].scrollHeight;
    var containerHeight = issueModalContent.innerHeight();

    // 스크롤이 발생한 경우
    if (scrollTop > 0) {
      createIssueText.css("border-bottom", "1px solid #ddd");
    } else {
      // 스크롤이 맨 위로 돌아갈 경우
      createIssueText.css("border-bottom", "none");
    }

    // 스크롤 위치가 맨 밑으로 도달한 경우
    if (scrollTop + containerHeight >= scrollHeight - 1) {
      submitResetBtnWrap.css("border-top", "none");
    } else {
      // 스크롤 위치가 맨 밑으로 도달하지 않은 경우
      submitResetBtnWrap.css("border-top", "1px solid #ddd");
    }
  });
  

  $(".issue-create-custom-option").click(function () {
    var text = $(this).text();
    $(this).closest(".issue-create-custom-select").find(".issue-create-custom-selected").text(text);
    $(this).closest(".issue-create-custom-options").hide();
  });

  $(".issue-create-custom-option").click(function () {
    var text = $(this).text();
    var customSelect = $(this).closest(".issue-create-custom-select");
    var selectedInput = customSelect.find("input");

    selectedInput.prop("value", text); // 선택한 값을 input의 value로 설정
    customSelect.find(".issue-create-custom-selected").text(text); // 선택한 값을 선택된 항목에 표시
    customSelect.find(".issue-create-custom-options").hide();
  });
  
    $(document).on('click', '.assigned', function(){
  	const assignedUserName = $(this).find('.assigned-user').text();
  	console.log('담당자명 = ' + assignedUserName);
  	$('.issue-create-custom-selected.issue-assigned').val(assignedUserName);
  	console.log('담당자===' + $('.issue-create-custom-selected.issue-assigned').text());
  })
 

  $('.submit-btn').click(function () {
    const project_name = $('.project-name-seleted').val();
    const issue_type = $('.issue-type-selected').val();
    const issue_status = $('.issue-status-selected').val();
    const issue_title_area = $('.issue-title-area').val();
    const issue_content = $('.issue-content-txtarea').val();
    const issue_reporter = $('.issue-reporter-selected').val();
    const issue_assigned = $(".issue-assigned-selected").val();
    const issue_priority = $('.issue-priority-selected').val();
    
      //혜원
     
     
      var issue_tag = ''; 
     const selectedOptionValue = $('#inputnotionchoice').val().trim();

    //혜원

   	if (issue_type === "") {
      alert("이슈 유형을 선택해주세요.");
      return false;
    } else if (issue_status === "") {
      alert("이슈 상태를 선택해주세요.");
      return false;
    } else if (issue_title_area === "") {
      alert("제목을 입력해주세요.");
      return false;
    } else if (issue_content === "") {
      alert("내용을 입력해주세요.");
      return false;
    } else if (issue_reporter === "") {
      alert("보고자를 선택해주세요.");
      return false;
      // 보고자는 나중에 세션에서 사용자 id를 통해 사용자 명을 가져와 표시한다.
    } else if (issue_assigned === "") {
      alert("담당자를 선택해주세요.");
      return false;
    } else if (issue_priority === "") {
      alert("중요도를 선택해주세요.");
      return false;
    }

    // 줄바꿈 문자를 HTML 줄바꿈 태그 <br>로 변환
    const issue_content_html = issue_content.replace(/\n/g, '<br>');

    // issue_content_html를 폼의 hidden 필드에 저장
    $('.hidden-issue-content').val(issue_content_html);
    //혜원
     user_id = $("#notionchoice option").data("id");
          if(user_id == undefined)
          user_id = 0;
           
       

          
          
         
        $('form[name="issueUpdate"]').append('<input type="hidden" name="user_id" value="' + user_id + '">');
    //혜원끝

  });
  
  // 이벤트 위임을 사용하여 document에 클릭 이벤트 핸들러를 추가
$(document).on('click', '.issue-create-custom-option', function () {
    var text = $(this).text();
    var userId = $(this).data('value');
    var customSelect = $(this).closest('.issue-create-custom-select');
    var selectedInput = customSelect.find('input[type="hidden"]');

    selectedInput.val(userId);
    customSelect.find('.issue-create-custom-selected').val(text);
    customSelect.find('.issue-create-custom-options').hide();
    
    console.log($('.issue-create-custom-selected').val());
});

const fileInput = document.querySelector('.add-file');
  const uploadedFilesContainer = $('.uploaded-files');
  const maxSizePerFileInBytes = 10 * 1024 * 1024; // 10MB in bytes
  const maxTotalSizeInBytes = 50 * 1024 * 1024; // 50MB in bytes
  let selectedFiles = []; // 선택한 파일 목록
  let totalSizeUploaded = 0; // 추적된 업로드된 파일 크기의 합

  fileInput.addEventListener('change', handleFileSelection);

  function handleFileSelection(event) {
    const files = event.target.files;

    // 기존 업로드 파일 엘리먼트 모두 제거
    uploadedFilesContainer.empty();

    let validFiles = [];

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      const fileName = file.name;

      if (file.size > maxSizePerFileInBytes) {
        alert('파일 크기는 10MB를 초과할 수 없습니다.');
        continue; // 파일 크기가 초과하면 다음 파일로 넘어감
      }

      if (totalSizeUploaded + file.size > maxTotalSizeInBytes) {
        alert('파일 크기 합이 50MB를 초과할 수 없습니다.');
        continue; // 파일 크기 합이 초과하면 다음 파일로 넘어감
      }

      if (isFileExtensionValid(fileName)) {
        validFiles.push(file);
        totalSizeUploaded += file.size;
      }
    }

    // 파일 선택(input)에서 유효하지 않은 확장자를 가진 파일을 제외하고, 유효한 파일만을 업로드
    const dt = new DataTransfer();
    validFiles.forEach(file => dt.items.add(file));
    fileInput.files = dt.files;

    // 나머지 코드는 유효한 파일에 대한 처리입니다.
    for (let i = 0; i < validFiles.length; i++) {
      createFileElement(validFiles[i]);
    }
    updateUploadedFilesContainerHeight();
  }

  function isFileExtensionValid(fileName) {
    const fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'svg', 'bmp', 'txt', 'zip', 'tar', 'xlsx', 'xls', 'xlsm', 'xlsb', 'xltx', 'log', 'hwp', 'pptx', 'pptm', 'ppt', 'pdf'];
    const extension = fileName.split('.').pop().toLowerCase();
    if (!fileExtension.includes(extension)) {
      alert('지원하지 않는 확장자입니다.');
      return false; // 확장자가 허용되지 않을 때 false 반환
    }
    return true; // 확장자가 허용될 때 true 반환
  }

  function createFileElement(file) {
    const originalFileName = file.name;
    const upfile = $('<div class="upfile" data-value="' + originalFileName + '"></div>');

    const fileName = $('<span class="file-name">' + truncateFileName(originalFileName, 25) + '</span>');

    upfile.append(fileName);
    uploadedFilesContainer.append(upfile);

    if (selectedFiles.length > 0) {
      updateUploadedFilesContainerHeight();
    }
  }

  function updateUploadedFilesContainerHeight() {
    const fileCount = selectedFiles.length;

    if (fileCount > 1) {
      uploadedFilesContainer.css('height', fileCount * 40 + 'px');
    } else if (fileCount === 1) {
      uploadedFilesContainer.css('height', '40px');
    } else {
      uploadedFilesContainer.css('height', 'auto');
    }
  }

  function truncateFileName(fileName, maxLength) {
    if (fileName.length > maxLength) {
      const extension = fileName.split('.').pop();
      const truncatedName = fileName.substring(0, maxLength - 3);
      return truncatedName + '...' + extension;
    }
    return fileName;
  }
  
  var isToggled = false;
	var lastClicked = null;

	$('.issue-create-custom-selected').click(function () {
    var customOptions = $(this).siblings('.issue-create-custom-options');

    if (lastClicked !== this) {
        // 다른 요소가 클릭되었을 때, 이전 요소를 숨김
        $('.issue-create-custom-options').fadeOut(300);
        isToggled = false;
        lastClicked = this;
    }

    customOptions.fadeToggle(300);
    isToggled = !isToggled;
	});

  // issueModal close
  $('.close-btn').on("click", function () {
    if ($(".issue-edit-modal").css('display') === 'block') {
      $(".issue-edit-modal").fadeOut(200);
    }
    
 



//혜원끝
  });
  });
