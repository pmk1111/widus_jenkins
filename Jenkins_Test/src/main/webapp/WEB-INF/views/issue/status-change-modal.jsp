<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="status-update-modal">
	<div class="status-update-modal-overlay"></div>
	<div class="status-update-modal-content">
	<img class="change-stat-img" src="../resources/issue/img/status-change-img.jpg">
		<h4>상태를 변경하시겠습니까?</h4>
		<p class=status-change-text>상태를 변경하시려면 확인을 눌러주세요</p>
		<div class="status-update-modal-btn-wrap">
			<button type="button" class="status-update-modal-btn">확인</button>
			<button type="button" class="update-cancel-btn">취소</button>
		</div>
	</div>
</div>

<div class="status-update-modal-resolved">
	<div class="status-update-modal-overlay"></div>
	<div class="status-update-modal-content">
	<img class="change-stat-img" src="../resources/issue/img/status-change-img.jpg">
		<h4>상태를 변경하시겠습니까?</h4>
		<p class=status-change-text>결재 담당자 선택 후 확인을 눌러주세요</p>
		<input type="text" class="choose-assigner">
		<input type="hidden" class="choose-assignerrr" name="issue_assigned_name">
		<input type="hidden" class="selected-assigner-id" name="issue_assigned_id">
		<ul class="select-assign-dropdown">
			<!-- 나중에 해당 프로젝트에 참여 중인 사용자를 불러온다. -->
		</ul>
		<div class="status-update-modal-btn-wrap">
			<button type="button" class="status-update-modal-btn">확인</button>
			<button type="button" class="update-cancel-btn">취소</button>
		</div>
	</div>
</div>
