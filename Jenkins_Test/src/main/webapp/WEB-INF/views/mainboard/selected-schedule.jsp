<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="selected-schedule-modal">
	<div class="modal-overlay"></div>
	<div class="selected-schedule-content">
		<div class="schedule-title-date">

			<div class="schedule-created-at">
					<strong class="schedule-month"></strong>
					<strong class="schedule-day"></strong>
			</div> <!-- schedule-created-at -->
			
				<div class="title-duration">
					<h4 class="title"></h4>
					<div class="duration">
						<span class="start-at"></span>&nbsp;~&nbsp;
						<span class="end-at"></span>
					</div> <!-- duration -->
				</div> <!-- title-duration -->
				
			</div><!-- schedule-title-date -->
			<hr>
			
			<div class="schedule-place-type">
				<div class="schedule-place-wrap">
					<span class="place-txt">장소</span>
					<img src="../resources/calendar/img/location.svg">
					<span class="schedule-place"></span>
				</div>
				<div class="schedule-type-wrap">
					<span class="type-txt">유형</span>
					<img src="../resources/calendar/img/schedule-type.svg">
					<span class="schedule-type"></span>
				</div>
			</div>
			<hr>
			
			<div class="schedule-content">
				<pre>
				</pre>
			</div> <!-- content -->
			
	</div> <!-- selected-schedule-content -->
</div> <!-- selected-schedule-modal -->