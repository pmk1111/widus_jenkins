<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.textcomplete/1.8.5/jquery.textcomplete.min.js"></script>	


<div class="issue-modal">
	<div class="modal-overlay"></div>
	<form action="createIssue" name="createIssue" method="post" enctype="multipart/form-data">
		<div class="issue-modal-content">

			<div class="selected-project">
				<div class="selected-project-color"></div>
				<h3 class="project-name"></h3>
			</div>
			<div class="modal-content-wrap">

				<div class="select-type-wrap">
					<div class="text">
						<span>유형</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">

						<input type="text" class="issue-create-custom-selected issue-type" name="type" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">에픽</div>
							<div class="issue-create-custom-option" >작업</div>
							<div class="issue-create-custom-option">버그</div>
						</div>
					</div>

				</div>

				<div class="select-status-wrap">
					<div class="text">
						<span>상태</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">

						<input type="text" class="issue-create-custom-selected issue-status" name="status" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">To Do</div>
							<div class="issue-create-custom-option">In Progress</div>
							<div class="issue-create-custom-option">Resolved</div>
							<div class="issue-create-custom-option">Done</div>
						</div>
					</div>

				</div>


				<div class="issue-title-wrap">

					<input type="text" class="issue-title-area" name="subject"
						placeholder="제목을 입력하세요.">
				</div>
				
				<div class="issue-content-wrap">
					<textarea class="issue-content" name="content" placeholder="내용을 입력하세요."></textarea>
					<div id="userList"></div>
				</div>
			<!-- 	<input type="hidden" class="hidden-issue-tag" name="tagname" value="85"> -->
				
<!-- 				<div class="issue-reporter-wrap">
					<div class="text">
						<span>보고자</span><sup>*</sup>
					</div>
					<input class="issue-reporter" type="text" name="reporter">
				</div>
 -->
				<div class="issue-assigned-wrap">
					<div class="text">
						<span>담당자</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-assigned" value="" readonly>
						<input type="hidden" name="assigned">
						<div class="issue-create-custom-options user-info">
						</div>
					</div>

				<div class="issue-priority-wrap">
					<div class="text">
						<span>중요도</span><sup>*</sup>
					</div>
					<div class="issue-create-custom-select">
						<input type="text" class="issue-create-custom-selected issue-priority" name="priority" value="" readonly>
						<div class="issue-create-custom-options">
							<div class="issue-create-custom-option">low</div>
							<div class="issue-create-custom-option">middle</div>
							<div class="issue-create-custom-option">high</div>
							<div class="issue-create-custom-option">critical</div>
						</div>
					</div>
					</div>
					
									<!-- 혜원 -->
					<div class="issue-mention-wrap">
						<label for="inputnotionchoice" class="notify-txt">언급</label>
 						<div class="issue-mention-area">
 							<input type="text" class="notionchoice" name="notionchoice"/>
							<input type="hidden" id="inputnotionchoice" name="mention_user_id" />
							<div class="issue-create-custom-options mention-list">
							</div>
						</div>
				</div>
				<!-- 혜원 -->


			<!-- HTML -->
			<div class="file-upload-wrap">
    		<div class="text">
        	<span>파일 첨부</span>
    		</div>
    		
    		<label class="custom-file-upload">파일첨부
    			<input type="file" class="add-file" name="uploadfiles" multiple>
    		</label>
			</div>
			<div class="uploaded-files"></div>

				

	
		</div>
			</div>
			<div class="submit-reset-btn-wrap">
				<button type="button" class="close-btn">취소</button>
				<button type="submit" class="submit-btn">제출</button>
			</div>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>