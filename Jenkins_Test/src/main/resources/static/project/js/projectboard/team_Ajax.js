    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    // tabs active
    $('.team-tab, .memberlist').on('click', function() {
        $('.modal-body-invite').hide(); // 초대 div 숨기기
        $('.modal-search-list').show(); // 목록 div 보이기
        
        $('.team-tab').click(function(){
        $('.modal-content-invite').animate({
            width: '434px'
        }, 250); // 너비 변경 애니메이션
        })
        
        var projectId = parseInt($("#detailSettingProjectSrno").text());
		var contextPath = $("body").data("context-path");
		 
        // AJAX 요청 시작
        $.ajax({
            url: '../team/team-list',
            method: 'POST',
            data: {
                projectId: projectId,
            },	
            beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                var teamList = '';
                
                for (var i = 0; i < data.team.length; i++) {
                    teamList += '<li id="member-list-li">';
                    teamList += '<div class="modal-member-info">';
	                teamList += '<div class="modal-member-profile">';

                    if (data.team[i].pic == null) {
                        teamList += '<img class="modal-memeber-img" src="../resources/user/img/profile.png">';
	                } else {
    	                teamList += '<img class="modal-memeber-img" src="' + contextPath + '/upload' + data.team[i].pic + '">';
        	        }

                    teamList += '</div>';
                    teamList += '<div class="modal-member-name">';
                    teamList += '<a>';
	                teamList += '<span class="modal-member-name-span">' + data.team[i].name + '</span>';
    	            teamList += '</a>';
        	        teamList += '</div>';

                    if (data.team[i].auth === 1) {
                        teamList += '<div class="modal-member-role">';
	                    teamList += '<span class="modal-member-role-span" style="color: #fff">관리자</span>';
    	                teamList += '</div>';
        	        } else {
            	        teamList += '<div class="modal-member-role">';
                	    teamList += '<a href="#" class="admin-invite-button-1 manager-badge">';
                    	teamList += '<span>';
                            teamList += '</span>';
                        teamList += '</a>';
                        teamList += '</div>';
 	               }

                    teamList += '<div class="setting member-setting">';
                    teamList += '<div class="dropdown">';
                    
                    if (data.team[i].my_AUTH === 1 || data.team[i].my_ID === data.team[i].user_ID){
                    teamList += '<button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
	                teamList += '<i class="bx bx-dots-vertical-rounded"></i>';
    	            teamList += '</button>';
    	            }
    	            
        	        teamList += '<div class="dropdown-menu drop-width" aria-labelledby="cardOpt3">';
            	    teamList += '<div class="setting-menu setting-menu-padding">';
                	teamList += '<div class="setting-line">';

                    if (data.team[i].my_ID === data.team[i].user_ID) {
                        teamList += '<a class="setting-anchor setting-exit">';
                        teamList += '<span class="setting-span setting-span-02 exit-span">프로젝트 나가기</span>';
	                    teamList += '</a>';
    	            } else if (data.team[i].my_AUTH === 1 && data.team[i].my_ID !== data.team[i].user_ID) {
        	            teamList += '<a class="setting-anchor setting-fire" data-emp-id="' + data.team[i].employee_ID + '">';
            	        teamList += '<span class="setting-span setting-span-02">프로젝트 내보내기</span>';
                	    teamList += '</a>';
                	}

                    teamList += '</div>';
                    teamList += '<div class="setting-line">';

                    if (data.team[i].my_AUTH === 1 && data.team[i].auth === 1 && data.team[i].my_ID != data.team[i].user_ID) {
                        teamList += '<a class="setting-anchor setting-manager-fire" data-emp-id="' + data.team[i].employee_ID + '">';
	                    teamList += '<span class="setting-span setting-span-02">관리자 해제</span>';
    	                teamList += '</a>';
        	        } else if (data.team[i].my_AUTH === 1 && data.team[i].auth === 0) {
            	        teamList += '<a class="setting-anchor setting-manager-hire" data-emp-id="' + data.team[i].employee_ID + '">';
                	    teamList += '<span class="setting-span setting-span-02">관리자 지정하기</span>';
                    	teamList += '</a>';
                	}

                    teamList += '</div>';
                    teamList += '</div>';
                    teamList += '</div>';
	                teamList += '</div>';
    	            teamList += '</div>';
        	        teamList += '</div>';
            	    teamList += '</li>';
            	}

                $('#member-list-ul').html(teamList);

                $('.modal-member-role').each(function() {
                    if ($(this).find('span').text().trim() === '') {
                        $(this).hide();
                        $(this).siblings('.modal-member-name').css('width', '269px');
                    }
                });
                
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
        
    });
    
    $('#profile-tab').on('click', function() {
        var projectId = parseInt($("#detailSettingProjectSrno").text());
        
        $('.modal-search-list').hide(); // 목록 div 숨기기
        $('.modal-body-invite').show(); // 초대 div 보이기
        $('.modal-content-invite').animate({ width: '600px' }, 250); // 너비 변경 애니메이션
        
        var contextPath = $("body").data("context-path");

        // AJAX 요청 시작
        $.ajax({
            url: '../team/invite-team',
            method: 'POST',
            data: {
                projectId: projectId
            },	
            beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                var userList = '';
                
                if (data.invitedUser.length === 0) {  // 초대 가능한 직원이 없을 때
                    userList = '<li class="empty-emp"><span>초대 가능한 직원이 없습니다.<span></li>';
                } else { 
                for (var i = 0; i < data.invitedUser.length; i++) {
                	userList += '<li class="member-invite-li" data-emp-id="' + data.invitedUser[i].employee_ID + '">';
                	userList += '<div class="modal-member-invite-img">';
                	userList += '<img class="modal-invite-check" src="../resources/project/img/projectboard/icon_check.png">';
                	userList += '</div>';
                    userList += '<div class="modal-member-profile">';
                    if (data.invitedUser[i].pic == null) {
                    	userList += '<img class="modal-memeber-img" src="../resources/user/img/profile.png">';
                    } else {
                    	userList += '<img class="modal-memeber-img" src="' + contextPath + '/upload' + data.invitedUser[i].pic + '">';
                    }	
                    userList += '</div>';
                    userList += '<div class="modal-member-name name-flex">';
                    userList += '<a>';
                    userList += '<span class="modal-member-name-span" style="font-weight:600; font-size:13px;">' + data.invitedUser[i].name + '</span>';
                    userList += '</a>';
                    userList += '</div>';
                    userList += '</li>';
            	}
                }
                
                $('#member-invite-ul').html(userList);
                
                $('.member-invite-li').click(function() {
                    var imgElement = $(this).find('.modal-invite-check');
                    var src = imgElement.attr('src');
                    
                    var employeeId = $(this).data('emp-id')
                    
			        // 이미 추가된 employee_ID 중에 같은 값이 있는지 확인합니다.
			        var isDuplicate = $(".invite-box .invite-you").filter(function() {
			            return $(this).data('emp-id') === employeeId;
			        }).length > 0;
			
			        // 같은 employee_ID가 없는 경우에만 추가합니다.
			        if (!isDuplicate) {
			            imgElement.attr('src', '../resources/project/img/projectboard/icon_check_hover.png');
			
			            var userName = $(this).closest('.member-invite-li').find('.modal-member-name-span').text();
			            var newDiv = $('<div class="invite-you" data-emp-id="' + employeeId + '">' + userName + '</div>').hide();
			
			            $('.invite-box').append(newDiv);
			
			            // 애니메이션으로 이름 표시
			            newDiv.fadeIn(100);
			
			            $('.modal-invite-empty').hide();  // 초대 목록이 비어있지 않으므로 숨깁니다.
                        
                    } else {
                        imgElement.attr('src', '../resources/project/img/projectboard/icon_check.png');

                        // 체크가 해제된 경우, 해당 사용자의 이름을 제거합니다.
                       $(".invite-box .invite-you").filter(function() {
                            return $(this).data('emp-id') === employeeId;
                          }).fadeOut(100, function() { 
                              $(this).remove(); 

                              // 모든 .invite-you 요소가 제거되었는지 확인합니다.
                              if ($(".invite-box .invite-you").length === 0) {
                                  $('.modal-invite-empty').show();  // 초대 목록이 비어있으므로 표시합니다.
                              }
                          });
                    }
                });

                // '.team-tab' 클릭 시 생성된 모든 div 삭제
                $('.team-tab, .modal-close-invite, .modal-cancle-exit, .modal-submit-exit').on('click', function() {
                    $('.invite-box .invite-you').remove();
                    $('.modal-invite-empty').show();
                });

            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
        
    });
    
    // 수락시 insert
    $('.modal-submit-exit').on('click', function() {
    	
    	projectId = parseInt($("#detailSettingProjectSrno").text());
    	
        
        // 이미지가 icon_check_hover.png인 모든 요소를 찾습니다.
        var selectedUsers = $('.modal-invite-check[src="../resources/project/img/projectboard/icon_check_hover.png"]');

        // 선택된 사용자들의 이름을 배열로 만듭니다.
	    var empIds = [];
	    selectedUsers.each(function() {
	    	var empId = $(this).closest('.member-invite-li').data('empId');
	        empIds.push(empId);
	    });
	    
		// 선택된 사용자가 없는 경우 알림창 띄우기
		if (empIds.length === 0) {
			swal("초대 실패", "초대할 직원을 선택해주세요.", "warning");
			return;
		}

        // AJAX 요청 시작
        $.ajax({
            url: '../team/insert-team',  // 실제 데이터를 추가할 URL로 변경해야 합니다.
            method: 'POST',
            data: {
                empIds: empIds,
                projectId: projectId,
            },
            beforeSend: function(xhr) { 
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                
                swal("초대 완료!", "직원초대가 완료되었습니다.", "success");
                
                $('.invite-box .invite-you').remove();  // 선택한 항목들 초기화
                $('.modal-invite-empty').show();
                
                $('.invite-box .invite-you').remove();
                $('.modal-invite-empty').show()
                
                var empIds = []; // 배열을 빈 배열로 초기화합니다.
                
                getRecentStatus();
            },
    		error:function(request,status,error){
    		}
         });
    });
    
