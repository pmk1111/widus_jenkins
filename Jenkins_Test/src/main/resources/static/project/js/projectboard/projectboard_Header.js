
    $('.star').each(function() {
        var $this = $(this);
        var projectId = $this.data('projectId');

        $.ajax({
            url: '../project/participate',
            method: 'GET',
            data: {
                projectId: projectId,
            },
            success: function(response) {
                if (response == -1) {
                    $this.attr('src', '../resources/project/img/projectboard/icon_star.png');
                } else {
                    $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });

    $('.favorite-star').click(function() {
        var $this = $(this);
        var projectId = $this.data('projectId');
        
        let token = $("meta[name='_csrf']").attr("content");
        let header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            url: '../project/favorite',
            method: 'POST',
            data: {
                projectId: projectId,
            },
            beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
                xhr.setRequestHeader(header, token);
            },
            success: function(response) {

                if (response == -1) {

                    $this.attr('src', '../resources/project/img/projectboard/icon_star.png');

                    var listItem = $this.closest('.list');
                    listItem.hide();
                    $('.partProject .all-project-list').prepend(listItem);
                    listItem.fadeIn(500);

                } else {
                    $this.attr('src', '../resources/project/img/projectboard/icon_star_on.png');

                    var listItem = $this.closest('.list');

                    listItem.hide();
                    $('.favoritProject .all-project-list').prepend(listItem); // prepend()
                    listItem.fadeIn(500);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });


    $(".star").hover(function() {
        var src = $(this).attr("src");

        if (src === "../resources/project/img/projectboard/icon_star.png") {
            $(this).attr("src", "../resources/project/img/projectboard/icon_star_hover.png");
        }
    }, function() {
        var src = $(this).attr("src");

        if (src === "../resources/project/img/projectboard/icon_star_hover.png") {
            $(this).attr("src", "../resources/project/img/projectboard/icon_star.png");
        }
    });

	var selected_class = '.mainboard-color';

    // 메인보드 앵커 클릭 시 모달 보여주기
    $('.select-color.mainboard-color').click(function(event) {
        event.preventDefault();
        $('#modal-background').fadeIn(300);
        $('#modal-background').css('display', 'block');
		selected_class = '.mainboard-color';
    });
    
    $('.select-color.color-in-modify-modal').click(function(event) {
        event.preventDefault();
        $('#modal-background').fadeIn(300);
        $('#modal-background').css('display', 'block');
		selected_class = '.color-in-modify-modal';
    });

    // 닫기 버튼 또는 취소 버튼 클릭 시 모달 숨기기 및 아이콘 복구 
    $('.modal-close, .modal-cancle').click(function(event) {
        event.preventDefault();
        $('#modal-background').css('display', 'none');

    });

    // radio
    $(".color-item").click(function() {
        // 현재 project-color-check-active-1 클래스가 적용된 요소에서 클래스 제거
        $(".project-color-check-active-1").removeClass("project-color-check-active-1");

        // 클릭된 요소에 project-color-check-active-1 클래스 추가
        $(this).addClass("project-color-check-active-1");
    });

    // 색상 변경
    $(".modal-submit").click(function() {
        // .project-color-check-active-1 클래스가 적용된 요소의 부모 li 태그의 배경색을 가져옴
        var activeColor = $(".project-color-check-active-1").closest('li').css("background-color");
        var id = parseInt($("#detailSettingProjectSrno").text());

        $("#modal-background").css('display', 'none');

        $.ajax({
            url: '../project/update-color',
            type: 'GET',
            data: {
                color: activeColor,
                id: id
            },
            success: function(response) {
                $(".select-color" + selected_class).css("background", activeColor);
                $(".select-color" + ".color-in-modify-modal").css("background", activeColor);
                getRecentStatus();
            } 
        });
    });
    
    $('.setting-edit').click(function(event) {
    	$('.modify-background').fadeIn(300);
        $('.modify-background').css('display', 'block');
        $('#modal-background').css('background-color','rgb(0 0 0 / 0%)');
    });
    
    $('.modify-cancle').click(function(event) {
        event.preventDefault();
        $('.modify-background').fadeOut(300);
        $('#modal-background').css('backgorund-color', 'rgba(0, 0, 0, .8)');
        $('.modify-background').css('display', 'none');
    });
    
    $('.modify-submit').click(function(event){
    	var modify_color = $('.color-in-modify-modal').css('background-color');
    	var modify_title = $('.input-title').val();
    	var modify_subtitle = $('.input-subtitle').val();
    	var id = parseInt($("#detailSettingProjectSrno").text());
    	
    	$.ajax({
            url: '../project/modify',
            type: 'GET',
            data: {
                color: modify_color,
                title: modify_title,
                subtitle: modify_subtitle,
                projectId: id
            },
            success: function(response) {
            	selected_class = '.mainboard-color';
                $(".select-color" + selected_class).css("background", modify_color);
                $(".project-name-span").text(modify_title);
                $(".discription span").text(modify_subtitle);
                $('.modify-background').css('display', 'none');
                $('#modal-background').css('backgorund-color', 'rgba(0, 0, 0, .8)');
                getRecentStatus();
            } 
    	})
    })    

    /* 드롭다운 이미지 변경 */
    $('.setting-anchor').hover(
        function() { // mouseover event handler
            const img = $(this).find('.setting-img');
            let hoverImageSrc;
            if (img.hasClass('share')) {
                hoverImageSrc = '../project/img/projectboard/share-hover.svg';
            } else if (img.hasClass('edit')) {
                hoverImageSrc = '../project/img/projectboard/edit-hover.svg';
            } else if (img.hasClass('bin')) {
                hoverImageSrc = '../project/img/projectboard/bin-hover.svg';
            }
            img.attr('src', hoverImageSrc);
        },
        function() { // mouseout event handler
            const img = $(this).find('.setting-img');
            let originalImageSrc;
            if (img.hasClass('share')) {
                originalImageSrc = '../project/img/projectboard/share.svg';
            } else if (img.hasClass('edit')) {
                originalImageSrc = '../project/img/projectboard/edit.svg';
            } else if (img.hasClass('bin')) {
                originalImageSrc = '../project/img/projectboard/bin.svg';
            }
            img.attr('src', originalImageSrc);
        }
    );

    // setting-info hover
    $('.dropdown-menu').on('shown.bs.dropdown', function() {
        $('.setting-info').hover(
            function() { // mouseover event handler
                $('<p class="tooltip"></p>')
                    .text('프로젝트 나가기 시, 프로젝트 목록에서 삭제되며 게시물 작성 및 수정이 불가합니다.')
                    .appendTo('body')
                    .fadeIn('slow');
            },
            function() { // mouseout event handler
                $('.tooltip').remove();
            }
        ).mousemove(function(e) {
            $('.tooltip')
                .css({
                    top: e.pageY + 10,
                    left: e.pageX + 20
                })
        });
    });

	// 나가기
	$(document).on('click', '.setting-exit', function(event) {
	    event.preventDefault();
		
		var projectId = $('#detailSettingProjectSrno').text();
		
		    let token = $("meta[name='_csrf']").attr("content");
		    let header = $("meta[name='_csrf_header']").attr("content");	
		
	    swal({
	        title: "정말 프로젝트를 나가시겠습니까?",
	        text: "더 이상 게시물 작성 및 수정이 불가합니다.",
	        icon: "info",
	        buttons: true,
	        dangerMode: true,
	    })
	    .then((willExit) => {
	        if (willExit) {
	            $.ajax({
	                url: `../team/exit?projectId=${projectId}`,
	                type: 'DELETE',
					beforeSend : function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
						xhr.setRequestHeader(header, token);
					},                
	                success: function(data) {
	                    swal("완료", "프로젝트 나가기가 완료되었습니다.", "success")
	                    .then(() => {
	                        location.href = "../project/project-list";  // 페이지 이동
	                    });
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    swal("실패", jqXHR.responseJSON.message || textStatus, "error");
	                }
	            });
	        }
	    });
	});

	// 내보내기
	$(document).on('click', '.setting-fire', function(event) {
	
		var $this = $(this);
		
	    event.preventDefault();
	
	    var empId = $('.setting-fire').data('emp-id');
	    var projectId = $('#detailSettingProjectSrno').text();

	    let token = $("meta[name='_csrf']").attr("content");
	    let header = $("meta[name='_csrf_header']").attr("content");
	
	    swal({
	        title: "팀에서 유저를 내보내시겠습니까?",
	        text: "해당 유저는 더 이상 프로젝트 활동이 불가합니다.",
	        icon: "info",
	        buttons: true,
	        dangerMode: true,
	    })
	    .then((willExit) => {
	        if (willExit) {
	            $.ajax({
	                url: '../team/fire-team',
	                type: 'DELETE',
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader(header, token);
	                },
	                async: false,
	                data: { projectId: projectId, empId: empId }, // 'empId'로 수정
	                success: function(data) {
	                    swal("완료", "프로젝트 내보내기가 완료되었습니다.", "success");
	                    
	                    $this.closest($('li')).remove();
	                    
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    swal("실패", jqXHR.responseJSON.message || textStatus, "error");
	                }
	            });
	        }
	    });
	});

	// 관리자 권한 부여
	$(document).on('click', '.setting-manager-hire', function(event) {
	
	    var $this = $(this);
	    
	    event.preventDefault();
	    
	    var empId = $this.data('emp-id');
	    var projectId = $('#detailSettingProjectSrno').text();
	    
	    let token = $("meta[name='_csrf']").attr("content");
	    let header = $("meta[name='_csrf_header']").attr("content");
	
	    swal({
	        title: "관리자 권한을 부여하시겠습니까?",
	        text: "관리자 기능 및 접근 권한이 추가됩니다.",
	        icon: "info",
	        buttons: true,
	        dangerMode: true,
	    })
	    .then((willExit) => {
	        if (willExit) {
	            $.ajax({
	                url: '../team/grant-admin',
	                type: 'POST',
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader(header, token);
	                },
	                async: false,
	                data: { projectId: projectId, empId: empId },
	                success: function(data) {
	                    swal("완료", "관리자 등록이 완료되었습니다.", "success");
	                    
	                    var $admin = $this.closest("li");
	                    $admin.find(".modal-member-name").css("width", "205px");
	                    $admin.find('.admin-invite-button-1').remove();
	                    $admin.find(".modal-member-role").css("display","block");
	                    $admin.find(".modal-member-role").append('<span class="modal-member-role-span" style="color: #fff">관리자</span>');
	                    $admin.find(".setting-manager-hire").replaceWith('<a class="setting-anchor setting-manager-fire" data-emp-id="' + empId + '"><span class="setting-span setting-span-02">관리자 해제</span></a>');
	                    
	                    getRecentStatus();
	                    
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    swal("실패", jqXHR.responseJSON.message || textStatus, "error");
	                }
	            });
	        }
	    });
	});

	// 관리자 해제
	$(document).on('click', '.setting-manager-fire', function(event) {
	
	    var $this = $(this);
	    
	    event.preventDefault();
	    
	    var empId = $this.data('emp-id');
	    var projectId = $('#detailSettingProjectSrno').text();
	    
	    let token = $("meta[name='_csrf']").attr("content");
	    let header = $("meta[name='_csrf_header']").attr("content");
	
	    swal({
	        title: "관리자 권한을 해지하시겠습니까?",
	        icon: "info",
	        buttons: true,
	        dangerMode: true,
	    })
	    .then((willExit) => {
	        if (willExit) {
	            $.ajax({
	                url: '../team/revoke-admin', 
	                type: 'POST',
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader(header, token); 
	                },
	                data: { projectId: projectId, empId: empId},
	                success: function(data) {
	                    swal("완료", "관리자 해지가 완료되었습니다.", "success");
	                    
	                    var $admin = $this.closest("li");
	                    $admin.find(".modal-member-name").css("width", "269px");
	                    $admin.find('.modal-member-role-span').remove();
	                    $admin.find(".modal-member-role").css("display","none");
	                    
	                    $admin.find(".setting-manager-fire").replaceWith('<a class="setting-anchor setting-manager-hire" data-emp-id="' + empId + '"><span class="setting-span setting-span-02">관리자 지정하기</span></a>');
	                    
	                    getRecentStatus();
	                    
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    swal("실패", jqXHR.responseJSON.message || textStatus, "error");
	                }
	            });
	        }
	    });
	});

    // 프로젝트 삭제
        $('.setting-delete').click(function(event) {
        event.preventDefault();
        
        var projectId = $('#detailSettingProjectSrno').text();  // 프로젝트 ID 가져오기
	    let token = $("meta[name='_csrf']").attr("content");
	    let header = $("meta[name='_csrf_header']").attr("content");	

        swal({
                title: "정말 프로젝트를 삭제하시겠습니까?",
                text: "삭제된 프로젝트는 복구가 불가능합니다.",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willExit) => {
    	        if (willExit) {
    	            $.ajax({
    	                url: `../project/delete?projectId=${projectId}`,  // DELETE 요청 URL 구성
    	                type: 'DELETE',
				        beforeSend : function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
					           xhr.setRequestHeader(header, token);
					    },
    	                success: function(data) {  // 성공적으로 삭제되었을 경우
    	                        swal("완료", '프로젝트 삭제가 완료되었습니다.', "success")
    	                        .then(() => {
    	                            location.href="../project/project-list";  // 페이지 이동
    	                        });
    	                },
    	                error: function(jqXHR, textStatus, errorThrown) {  // 실패했을 경우
    	                    swal("실패", jqXHR.responseJSON.message || textStatus, "error");
    	                }
    	            });
    	        }
            });
    });
	
    $('.memberlist').click(function() {
        event.preventDefault();
        $('#modal-background-invite').fadeIn(300);
        $('#modal-background-invite').css('display', 'block');
        $('.team-tab').addClass('active');
        $('.invite-tab').removeClass('active');
        $('.modal-body-invite').hide(); // 초대 div 숨기기
        $('.modal-search-list').show(); // 목록 div 숨기기
        $('.modal-content-invite').css('width', '434px');

    });

    $('.modal-close-invite, .modal-cancle-exit').click(function(event) {
        event.preventDefault();
        $('#modal-background-invite').fadeOut(300);
        $('#modal-background-invite').css('display', 'none');

        $('.bi-circle-fill').removeClass("darker-icon");
        $('.activity-badge').removeClass("light-border");
        $('#layout-navbar').css('box-shadow', '3px 3px 10px 5px #f0f0f0');
    });

    $('.modal-member-role').each(function() {
        if ($(this).find('span').text().trim() === '') {
            $(this).hide();
            $(this).siblings('.modal-member-name').css('width', '269px');
        }
    });

    $('#image-input').on('keyup', function() {
        var searchTerm = $(this).val().toLowerCase();

        // Reset all list item borders before filtering
        $('#member-list-ul li').css('border-bottom', '');

        $('#member-list-ul li').each(function() {
            var memberName = $(this).find('.modal-member-name-span').text().toLowerCase();

            if (memberName.includes(searchTerm)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });

        // Set the last visible list item's border to none
        $('#member-list-ul li:visible:last').css('border-bottom', 'none');
    });
    
	$('#find-emp').on('keyup', function() {
	    var searchTerm = $(this).val().toLowerCase();
	
	    $('#member-invite-ul li').css('border-bottom', '');
	
	    $('#member-invite-ul li').each(function() {
	        var memberName = $(this).find('.modal-member-name-span').text().toLowerCase();
	
	        if (memberName.includes(searchTerm)) {
	            $(this).show();
	        } else {
	            $(this).hide();
	        }
	    });
	
	    // Set the last visible list item's border to none
	    $('#member-invite-ul li:visible:last').css('border-bottom', 'none');
	});

    $('.modal-submit-exit').click(function(event) {
        event.preventDefault();
        $('#modal-background-invite').css('display', 'none');
    });

    $('.invite-you').each(function() {
        var text = $(this).text();
        var maxLength = /[가-힣]/.test(text) ? 4 : 10;

        if (text.length > maxLength) {
            var truncatedText = text.substring(0, maxLength) + '...';
            $(this).text(truncatedText);
        }
    });
    
