<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
    data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<meta name="_csrf" content="${_csrf.token}">
		<meta name="_csrf_header" content="${_csrf.headerName}">

    <title>Widus-Calendar</title>
    <meta name="description" content="" />
		
		<!-- JQuery cdn -->
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		
		<!-- css template -->
    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>
    <link rel="stylesheet" href="../resources/calendar/css/calendar.css">

		<style>
        html,
        body {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;

        }

        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
        
        .fc-daygrid-day-frame:hover{
        	cursor: pointer;
        	background-color: rgba(105, 108, 255, 0.16);
        	transition:.3s;
        }
        
        .fc-button{
        	background-color: #352f54 !important;
        	border-color: #352f54 !important;
        }
        .fc-button:hover{
        	opacity: .9;
        	transition:.3s;
        	}
    </style>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <jsp:include page="../mainboard/navbar.jsp"></jsp:include>
          <jsp:include page="../chat/chat.jsp"></jsp:include>

          <!-- / Navbar -->
          <div class="container-xxl flex-grow-1 container-p-y" id="calendararea2">
            <div class="row">
              <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list" id="calendararea1">
                <div class="card">

                  <div class="card-body issue-list-card-body">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                      <!-- Content -->

                      <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="calendararea">
                          <jsp:include page="calendar.jsp"></jsp:include>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>



          <!-- Footer -->
          <footer class="content-footer footer bg-footer-theme">
            <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
              <div class="mb-2 mb-md-0">
                ©
                <script>
                  document.write(new Date().getFullYear());
                </script>
                (주)WidUs
              </div>
              <div>
                <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More
                  Themes</a>

                <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                  target="_blank" class="footer-link me-4">Documentation</a>

                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank"
                  class="footer-link me-4">Support</a>
              </div>
            </div>
          </footer>
          <!-- Footer -->

          <div class="content-backdrop fade"></div>
                                                  <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                (주)WidUs
                            </div>
                            <div>
                                <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>
                                <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>
                                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
                            </div>
                        </div>
                    </footer>
                    <!-- Footer -->
        </div>
        <!-- Content wrapper -->
        
      </div>
      <!-- / Layout page -->
    </div>

		<%-- <input type="hidden" class="calenderList" value="${calendarList}"> --%>
		<jsp:include page="create-schedule-modal.jsp"></jsp:include>
		<jsp:include page="manage-schedule-modal.jsp"></jsp:include>
		
    <!-- Overlay -->
   <!--  <div class="layout-overlay layout-menu-toggle"></div> -->
    <!-- / Layout wrapper -->

    <jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script src="../resources/calendar/js/calendar.js"></script>
    <script type="text/javascript">
			$(document).on('click', '.fc-daygrid-event-harness', function(){
				$('.manage-schedule-modal').fadeIn(200);
			})
    </script>
  </body>

  </html>