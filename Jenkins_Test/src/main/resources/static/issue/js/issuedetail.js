$(document).ready(function () {

    console.log("게시글 번호 = " + $("#issue_id").val());

    const IssueSettingDropdown = $('.issue-setting-dropdown');
    const CopyUrlImg = $('.copy-url img');
    const IssueEdit = $('.issue-edit img');
    const IssueDelete = $('.issue-delete img');
    var csrfToken = $("meta[name='_csrf']").attr("content");

    $('.issue-setting-icon').click(function () {
        if (IssueSettingDropdown.css('display') === 'none') {
            IssueSettingDropdown.fadeIn(200);
        } else {
            IssueSettingDropdown.fadeOut(200);
        }
    }) //setting-icon click





    $(document).click(function (e) {
        if (!$(e.target).hasClass('issue-setting-icon') && !$(e.target).hasClass('issue-setting-dropdown') && !$(e.target).is('li')) {
            IssueSettingDropdown.fadeOut(200);
        }
    });//html click end

    $('.copy-url').hover(function () {
        CopyUrlImg.attr('src', '../resources/issue/img/copyurl-hover.svg');
    }, function () {
        CopyUrlImg.attr('src', '../resources/issue/img/copyurl.svg');
    }); //copy hover

    $('.issue-edit').hover(function () {
        IssueEdit.attr('src', '../resources/issue/img/edit-hover.svg');
    }, function () {
        IssueEdit.attr('src', '../resources/issue/img/edit.svg');
    }) //edit hover

    $('.issue-delete').hover(function () {
        IssueDelete.attr('src', '../resources/issue/img/trash-hover.svg');
    }, function () {
        IssueDelete.attr('src', '../resources/issue/img/trash.svg');
    }) //delete hover

    $('.issue-delete').click(function () {
        $('.issue-delete-modal').fadeIn(200);
    }) // issue-delete click

    $('.delete-cancel-btn').click(function () {
        $('.issue-delete-modal').fadeOut(200);
    }) //delete-cancel-btn	



    const loginUserEmail = $('.auth').val();
    const createUserEmail = $('.create-user-email').val();
    const assignedUserEmail = $('.assigned-user-email').val();

    console.log('로그인한 유저 정보 = ' + loginUserEmail);
    console.log('글 작성자 유저 정보 = ' + createUserEmail);
    console.log('글 담당자 유저 정보 = ' + assignedUserEmail);




    //status 동작
    console.log($('.this-status').val());
    const Status = $('.this-status').val();

    //현재 staatus 표시
    $('.status-btn').each(function () {
        let buttonStatus = $(this).data('value');
        if (buttonStatus === Status) {
            $(this).addClass('current-status')
        }
    }); //현재 status end





    // .status-btn 클릭 이벤트 처리
    $('.status-btn').click(function () {
        if (loginUserEmail === createUserEmail || loginUserEmail === assignedUserEmail) {
            if ($(this).hasClass('current-status')) {
                return;
            } else if ($(this).data('value') === 'Resolved') {
                // 클릭한 버튼의 data-value가 'Resolved'일 때 status-update-modal-resolved 모달을 열기
                $('.status-update-modal-resolved').css('display', 'block');
            } else {
                // 다른 경우에는 status-update-modal 모달을 열기
                $('.status-update-modal').css('display', 'block');
            }
        } else {
            alert("작성자 또는 담당자만 변경 가능합니다.");
            return false;
        }
    });

    $('.update-cancel-btn').click(function () {
        if ($('.status-update-modal').css('display') === 'block') {
            $('.status-update-modal').fadeOut(200);
        } else if ($('.status-update-modal-resolved').css('display') === 'block') {
            $('.status-update-modal-resolved').fadeOut(200);

        }
    });


    // 모달 외부 클릭 시 모달 닫기
    $(document).mouseup(function (e) {
        let modal = $('.status-update-modal');
        let modalResolved = $('.status-update-modal-resolved');

        if (modal.is(e.target) || modalResolved.is(e.target)) {
            modal.fadeOut(200);
            modalResolved.fadeOut(200);
        }
    });

    // 취소 버튼 클릭 시 모달 닫기
    $('.update-cancel-btn').click(function () {
        const modal = $(this).closest('.status-update-modal');
        modal.fadeOut(200);
    });

    // .choose-assigner와 li 클릭 이벤트 중단
    $('.choose-assigner, .select-assign-dropdown li').click(function (e) {
        e.stopPropagation(); // 클릭 이벤트 중단
    });

    $('.status-update-modal-overlay').click(function () {
        let modal = $('.status-update-modal');
        let modalResolved = $('.status-update-modal-resolved');

        if (modal.css('display') === 'block' || modalResolved.css('display') === 'block') {
            modal.fadeOut(200);
            modalResolved.fadeOut(200);
        }
    }); //overlay click end


    $('.choose-assigner').focus(function () {
        $.ajax({
            type: "GET",
            url: "getProjectAndTeamInfo",
            data: {
                projectId: projectId
            },
            success: function (response) {
								let hostIndex = location.href.indexOf( location.host ) + location.host.length;
								let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
                if (response.length > 0) {
                    console.log(response)

                    $('.select-assign-dropdown').empty();
                    response.forEach(function (item) {
                        let str = '<li class="assign-dropdown-item"><div>';
                        if(item.userPic !== null){
                        	str += '<img src="' + contextPath + '/upload' + item.userPic + '" alt class="h-auto user-img" />'
                        } else{
                        	str += '<img src="' + contextPath + '/user/img/profile.png"/>'
                        }
                        str += '<span class="user-name">' + item.userName + '</span></div>'
                        str += '<span class="user-id">#' + item.userId + '</span></li>'
                        $('.select-assign-dropdown').append(str);
                    }); // forEach end
                } else {
                    console.log("가져온 프로젝트, 사용자 정보 없음");
                }
            },
            error: function (error) {
                console.error("Error: " + error);
            }
        }); //ajax end

        $('.select-assign-dropdown').fadeIn(100);
    }); // focus end
    
    $(document).on('click', function(event) {
    if (!$(event.target).closest('.select-assign-dropdown, .choose-assigner').length) {
        // .select-assign-dropdown 또는 .choose-assigner 이외의 항목을 클릭한 경우
        $('.select-assign-dropdown').fadeOut(100);
    	}
		});

		//담당자 검색
    $(document).on('keyup', '.choose-assigner', function(){
    	var searchText = $(this).val().toLowerCase();
    	
    	$('.select-assign-dropdown .assign-dropdown-item').each(function(){
    		var userText = $(this).find('.user-name').text();
    		
    		if (userText.toLowerCase().includes(searchText)) {
            $(this).show();
        } else {
            $(this).hide();
        }
    	})
    }) // choose-assigner keyup end
    
    var selectedUserName;
    // li 클릭 시 input에 해당 username 저장
    $(document).on('click', '.select-assign-dropdown li', function () {
        selectedUserName = $(this).find('.user-name').text(); // 또는 .user-id 등으로 변경해서 필요한 정보 가져오기
        const userId = $(this).find('.user-id').text();
        const splitUserId = userId.replace(/#/g, ''); // '@' 문자를 제거

        $('.choose-assigner').val(selectedUserName);
        $('.choose-assignerrr').val(selectedUserName);
        $('.selected-assigner-id').val(splitUserId);
        $('.select-assign-dropdown').fadeOut(100);

    }); //li click end




    // .status-btn 클릭 이벤트 처리
    $('.status-btn').click(function () {
        const clickedButton = $(this); // 선택된 상태를 나타내는 버튼
        const newStatus = clickedButton.data('value'); // 선택된 버튼의 data-value

        console.log(newStatus);

        if (clickedButton.hasClass('current-status')) {
            return;
        }
        // 이벤트 핸들러 추가
        addStatusUpdateHandler(clickedButton, newStatus);

    });
    
function addStatusUpdateHandler(clickedButton, newStatus) {

    // .status-update-modal-btn 클릭 이벤트 처리
    $('.status-update-modal-btn').off('click'); // 이전에 추가된 클릭 이벤트 핸들러 제거

    $('.status-update-modal-btn').click(function () {
        if ($(this).closest('.status-update-modal-resolved').length > 0) {
            const selectedAssignedUser = $('.selected-assigner-id').val();
            if (selectedAssignedUser === null || selectedAssignedUser === '') {
                alert("결제 받을 담당자를 선택하여 주세요.")
                return false;
            }
            else {
            	updateStatus(clickedButton, newStatus);
            }

        } else{
        	updateStatus(clickedButton, newStatus);
        }
    })
};

function updateStatus(clickedButton, newStatus){
    $.ajax({
        url: "../issue/statusUpdate",
        method: "POST",
        data: {
            issueId: $("#issue_id").val(),
            status: newStatus,
            selectedUserId: $('.selected-assigner-id').val()
        },
        context: clickedButton,
        beforeSend: function (xhr) {
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
        },
        success: function (response) {
            if (response.status === 'success') {
                $('.status-btn').removeClass('current-status'); // 모든 버튼에서 current-status 클래스 제거
                clickedButton.addClass('current-status'); // 선택된 버튼에 current-status 클래스 추가

                $('.assigned-user').text(selectedUserName);
                console.log($('.assigned-user').text());

                $('.status-update-modal').fadeOut(200);
                $('.status-update-modal-resolved').fadeOut(200);
                if ($('.choose-assignerrr').val() !== '' && $('.choose-assignerrr').val() === null) {
                    $('.issue-assigned').text($('.choose-assignerrr').val());
                }
                console.log("성공");
                location.reload();

            } else {
                console.error("상태 변경 실패");
                console.log(response.message); // 오류 메시지 출력

                $('.status-update-modal').fadeOut(200);
                $('.status-update-modal-resolved').fadeOut(200);

            }
        },
        error: function (error) {
            console.error("서버 요청 중 오류가 발생했습니다.");
            console.log(error);
        }
    });
};









    //이슈 삭제 관련 로직
    $('.issue-delete-btn').click(function () {
        $.ajax({
            url: '../issue/issue-delete',
            method: 'POST',
            data: {
                issueId: $("#issue_id").val()
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (response) {
                if (response === 1) {
                    console.log(response);
                    let hostIndex = location.href.indexOf( location.host ) + location.host.length;
					let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

                    $('.issue-delete-modal-content h4').text('삭제되었습니다');
                    $('.issue-delete-modal-content .issue-delete-btn-wrap').empty();

                    var returnToListBtn = $('<button>')
                        .text('확인')
                        .addClass('redirect-list');

                    $('.issue-delete-modal-content .issue-delete-btn-wrap').append(returnToListBtn);

                    returnToListBtn.click(function () {
                        window.location.href = '../issue/issue-list';
                    });

                    $('.issue-delete-modal-content').fadeIn(200);
                } else {
                    console.log(response);
                    console.error('삭제에 실패했습니다.');
                }
            },
            error: function (error) {
                console.error('서버 요청 중 오류가 발생했습니다.');
            }
        });
    });

    //북마크 애니메이션 
    var img = $("#bookmark");
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var issueId = $("#issue_id").val()

    img.click(function () { //마우스 클릭시 

        $this = $(this);

        $.ajax({
            url: '../bookmark/bookmark',
            data: {
                issueId: issueId
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            async: false,
            type: "POST",
            success: function (result) {
                if (result === 1) {
                    console.log("성공인가요?")
                    $this.attr('src', '../resources/bookmark/img/bookmark_purple.png');
                } else {
                    console.log("지워졌나요?")
                    $this.attr('src', '../resources/bookmark/img/bookmark.png');
                }

            }//success end
        }); //ajax end
    });
});//document end


function clip() {
    var url = '';
    var textarea = document.createElement("textarea");
    document.body.appendChild(textarea);
    url = window.document.location.href;
    textarea.value = url;
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    alert("URL이 복사되었습니다.")
};
