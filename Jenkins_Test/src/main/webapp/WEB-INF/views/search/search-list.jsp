<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>WidUs-Documents</title>
    <meta name="description" content="" />

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>

    <!-- Helpers -->
    <script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>


    <style>
        #searcharea1 {
            width: 1414px;
        }

        #layout-navbar {

            margin-top: 0px;
        }


        .leftbar-close {
            background-color: #9F7AB0;
            border-radius: 50%;
        }

        .welcome-message {
            width: 100%;
        }

        .my-schedule {
            width: 66%;
            margin-right: 6.6px;
        }

        .memo,
        .my-work {
            min-height: 315px;
        }

        .container-p-y {
            margin-top: 0px;
        }

        .content-wrapper {
            margin-top: 0;
        }

        #searcharea2 {
            margin-top: 100px;
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
               	<jsp:include page="../notify/notify.jsp"></jsp:include>

                <!-- / Navbar -->
                <div class="container-xxl flex-grow-1 container-p-y" id="searcharea2">
                    <div class="row">
                        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list" id="searcharea1">
                            <div class="card">

                                <div class="card-body search-list-card-body">


                                    <!-- Content wrapper -->
                                    <div class="content-wrapper">
                                        <!-- Content -->

                                        <div class="container-xxl flex-grow-1 container-p-y">
                                            <div class="container">
                                                <h3 style="margin-bottom: 30px; font-weight: 700;">검색 결과</h3>
                                                <!-- Projects -->
										        <h4>Projects</h4>
										        <table class="table table-striped">
										            <!-- Project rows here -->
										            <!-- Example row:
										            <tr>
										                <th scope="row">1</th>
										                <td>Project Name</td>
										                ...
										            </tr>
										            -->
										        </table>
										
										        <!-- Issues -->
										        <h4>Issues</h4>
										        <table class="table table-striped">
										            <!-- Issue rows here -->
										            <!-- Example row:
										            <tr>
										                <th scope="row">1</th>
										                <td>Issue Title</td>
										                ...
										            </tr>
										             -->
										         </table>
										
										         <!-- Files -->
										         <h4>Files</h4>
										         <table class="table table-striped">
										             <!-- File rows here (as in your original code)-->
										             
										          </table>

										          <!-- Comments -->
										          <h4>Comments</h4>
										          <ul style='list-style-type:none; padding-left: 0px;'>
										             	<!-- Comment items here
										             	Example item:
										             	<li><span>User A:</span><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p></li><br/>
											     	    -->    
											 	  </ul>
										
										     </div><!-- /container-->
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
                                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                                <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>

                                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
                            </div>
                        </div>
                    </footer>
                    <!-- Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../resources/mainboard/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../resources/mainboard/assets/vendor/libs/popper/popper.js"></script>
    <script src="../resources/mainboard/assets/vendor/js/bootstrap.js"></script>
    <script src="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../resources/mainboard/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../resources/mainboard/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../resources/mainboard/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../resources/mainboard/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>