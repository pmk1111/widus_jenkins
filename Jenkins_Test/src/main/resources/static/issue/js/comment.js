$(document).ready(function () {
    const maxCharsPerLine = 50;
    const maxLines = 10;
    const CommentMaxLength = 500;
    var csrfToken = $("meta[name='_csrf']").attr("content");
    
    const cmtImg = $('.nav-item').find('.avatar').find('img').attr('src');
    $('.comment-writer-img').attr('src', cmtImg);

    $('#comment-textarea').on('input', function () {
        let lines = $(this).val().split('\n');

        if (lines.length > maxLines) {
            lines = lines.slice(0, maxLines);
        }

        lines = lines.map(function (line) {
            if (line.length > maxCharsPerLine) {
                return line.slice(0, maxCharsPerLine);
            }
            return line;
        });

        const formattedText = lines.join('\n');
        $(this).val(formattedText);

        if (formattedText.length > CommentMaxLength) {
            alert("500자 이내로 입력해주세요.");
        }
    });

    // Enter 키 눌렀을 때 줄바꿈 추가
    $('#comment-textarea').on('keydown', function (e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault(); // Enter 키의 기본 동작(새 줄 추가)을 막음
            var content = $('#comment-textarea').val() + '\n';
            $('#comment-textarea').val(content);
        }
    });

    function getCommentList() {
        $.ajax({
            type: "POST",
            url: "../comment/commentList",
            data: { "issue_id": $("#issue_id").val() },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (rdata) {
							let hostIndex = location.href.indexOf( location.host ) + location.host.length;
							let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
                $('.comment-list').empty();
                if (rdata.length > 0) { // 배열에 데이터가 있는지 확인
                    console.log(rdata); console.log(rdata);
                    $(rdata).each(function () {
                        let str = '';
												
                        str += '<div class="comments" data-comment-id="' + this.id + '">';
                        str += '<input type="hidden" class="commnet-user-email" value="' + this.comment_user_email + '">'
                        if(this.comment_user_pic !== null){
	                        str += '<img src="' + contextPath + '/upload' + this.comment_user_pic + '" alt class="w-px-40 h-auto" />';
                        } else{
                        	str += '<img src="' + contextPath + '/user/img/profile.png" alt class="w-px-40 h-auto" />'
                        }
                        // 나중에 해당 유저의 사진 가져옴
                        str += '<span class="comment-writer">' + this.comment_user_name + '</span> <sup class="comment-created">' + this.created_at + '</sup>';
												if($('.auth').val() !== null && $('.auth').val() === this.comment_user_email){
                        	str += '<sup class="comment-edit">수정</sup><sup class="comment-delete">삭제</sup>'
                        }
                        str += '<br><div class="comment-content">';
                        str += '<span>' + this.content + '</span></div>';
                        str += '</div>';

                        $('.comment-list').append(str);
                    });
                } else if (rdata.length === 0) {
                    console.log('작성된 댓글이 없습니다.');

                }
            },
            error: function (error) {
                console.error("댓글 출력 오류: " + error);
            },
        });
    }

    getCommentList();

		
    $('.comment-submit-btn').click(function () {
        var content = $('#comment-textarea').val().replace(/\n/g, "<br>");

        $.ajax({
            type: "POST",
            url: "../comment/commentAdd",
            data: {
                issue_id: $("#issue_id").val(),
                content: content
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
            },
            success: function (rdata) {
                if (rdata == 1) {
                    $("#comment-textarea").val('');
                    alert("댓글이 등록되었습니다.");
                    getCommentList();
                } else {
                    alert("댓글 등록 실패");
                }
            },
            error: function (error) {
                console.error("댓글 생성 오류: " + error);
            }
        });
    });

    // 수정 버튼 클릭 시
    $(document).on('click', '.comment-edit', function () {
        var commentElement = $(this).closest('.comments');
        var commentId = commentElement.data('comment-id');
        var commentContentElement = commentElement.find('.comment-content span');
        var commentContent = commentContentElement.html();

        console.log(commentContent);

        // <br> 태그를 줄바꿈으로 변환
        commentContent = commentContent.replace(/<br>/g, '\n');
        commentContent = commentContent.replace(/&/g, '&amp;');
        commentContent = commentContent.replace(/</g, '&lt;');
        commentContent = commentContent.replace(/>/g, '&gt;');
        // 댓글 수정 양식을 생성하고 표시
        var editForm = `
         <div class="comments create-comment" style="border-bottom: 1px solid lightgrey">
             <img src="${cmtImg}" class="w-px-40 h-auto comment-writer-img" />
             <div class="comment-input-submit">
                 <textarea id="edit-comment-textarea-${commentId}" class="comment-input" name="comment_content" maxlength="500" rows="10" cols="50" placeholder="댓글 내용을 입력하세요.">${commentContent}</textarea>
                 <button type="button" class="comment-submit-btn" data-comment-id="${commentId}">댓글 수정</button>
             </div>
         </div>
     `;

        commentElement.hide();

        commentElement.after(editForm);

        $('.comment-submit-btn').click(function () {
            var editedContent = $(`#edit-comment-textarea-${commentId}`).val();

            editedContent = editedContent.replace(/\n/g, "<br>");

            if (editedContent.trim() === '') {
                alert("댓글 내용을 작성하세요.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "../comment/commentUpdate",
                data: {
                    id: commentId,
                    content: editedContent
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
                },
                success: function (rdata) {
                    if (rdata == 1) {
                        alert("댓글이 수정되었습니다.");

                        $(`#edit-comment-textarea-${commentId}`).closest('.create-comment').remove();

                        commentElement.show();
                        getCommentList();
                    } else {
                        alert("댓글 수정 실패");
                    }
                },
                error: function (error) {
                    console.error("댓글 수정 오류: " + error);
                }
            });
        });
    });

    // 댓글 삭제
    // 댓글 삭제
    $(document).on('click', '.comment-delete', function () {
        var commentElement = $(this).closest('.comments');
        var commentId = commentElement.data('comment-id');

        if (confirm("댓글을 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "../comment/commentDelete",
                data: {
                    "commentId": commentId,
                },
                cache: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
                },
                success: function (rdata) {
                    if (rdata === 1) {
                        alert("댓글이 삭제되었습니다.");
                        getCommentList();
                    } else {
                        alert("댓글 삭제 실패");
                    }
                },
                error: function (error) {
                    console.error("댓글 삭제 오류: " + error);
                }
            });
        }
    }); // 댓글 삭제 
});
