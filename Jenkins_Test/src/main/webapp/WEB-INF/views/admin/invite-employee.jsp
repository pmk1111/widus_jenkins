<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
    <title>구성원 초대</title>
    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../resources/mainboard/assets/img/favicon/favicon.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />
    
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="../resources/mainboard/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="../resources/mainboard/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
  
  	#url_box {
    border: 1px solid transparent;
    border-bottom: 1px solid #d9dee3;
    background-color: white;}
 	
 	.inviteMail {
 	padding-left:0px;
 	}
 	
 	#inviteSubmit{
 	color:white;
 	border:1px solid #696cff; 
 	background-color:#696cff; 
 	width: 60px;
    height: 33px;
    border-radius: 5px;
    }
    
     ul li input[type="text"] {
    padding-left: 15px;
  }
  
   /* card영역 너비 화면에 맞추기 */
   .col-lg-8 {  
    flex: 0 0 auto;
    width: 100%;
    }
    .card {
    width: 100%;
    height: 800px;
    min-height: 800px;
    }
    .card-body {
    padding-left: 50px;}
    
       	.row {
      		margin-top:30px;
        }
    </style>
    
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

  		<jsp:include page="../admin/admin-leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

<%--         <jsp:include page="navbar.jsp"></jsp:include>
 --%>
          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0 welcome-message">
                  <div class="container-fluid" >
                    <div class="card">
                        <div class="card-body">
                          <h2 class="card-title text-primary" style="margin-top: 28px;">구성원 초대</h2>
                          <hr>
                          <p class="mb-4">
                          
                          <!-- content -->
                          <form id="formInvite" method="GET"    >
                          <input type="hidden" name="companyUrl" value="${companyinfo.domain}">
                        <div class="row">
                        <div class="mb-3 col-md-12">
                            <label for="companyName" class="form-label">전용 URL</label>
                             <p>전용 URL 주소를 전달하여 회사 직원들을 참여시킬 수 있습니다.
                             <div class="input_box">
                              <span>
                                <input id="url_box" type="text" value= "${companyinfo.domain}"
                                disabled style="width:320px; font-weight:bold; color:#307cff;">
                             
                              <button class="btn_copy" onclick="copy()" title="Copy" type="button" value="copy" id="copyBtn" 
      							style="border: none; background-color: white;">
                              	<img src="../resources/admin/image/copy.png" style="width:20px; height:20px;"/>
							  </button>
							 </span>
                             </div>
                             </div>
                             
                          
                        </div>
                       
                        
                         <div class="mb-3 col-md-6">
                            <label for="inviteEmail" class="form-label">이메일 초대</label>
                             <p> 직원들의 이메일 주소를 입력하여 바로 초대할 수 있습니다. </p>
                             
                             <ul class="inviteMail" style="list-style-type: none;">
                             
                             <li>
                             <input
                              class="invite_box1"
                              name ="invite_box1" 
                              type="text"
                              placeholder="example@widus.com"
                              maxlength="100"
                              style="color: black; border:1px solid #c5c6cb; width:300px; height:35px; margin-bottom:15px">
                              </li>
                              
                              <li>
                              <input
                              class="invite_box2"
                              name ="invite_box1" 
                              type="text"
                              placeholder="example@widus.com"
                              maxlength="100"
                              style="color: black; border:1px solid #c5c6cb; width:300px; height:35px; margin-bottom:15px">
                              </li>
                              
                              <li>
                              <input
                              class="invite_box3"
                              name ="invite_box1" 
                              type="text"
                              placeholder="example@widus.com"
                              maxlength="100"
                              style="color: black; border:1px solid #c5c6cb; width:300px; height:35px; margin-bottom:15px">
                              </li>
                              
                              <li>
                              <input
                              class="invite_box4"
                              name ="invite_box1" 
                              type="text"
                              placeholder="example@widus.com"
                              maxlength="100"
                              style="color: black; border:1px solid #c5c6cb; width:300px; height:35px; margin-bottom:15px">
                           	  </li>
                          	 </ul>
                          
                        </div>
                        
                        <div class="mb-3 col-md-6">
      					     <button type="submit" class="submitBtn" id="inviteSubmit">전송</button>
  					   </div>
  					   
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
                    </form>
                   </div>
                  </div>
                 </div>
                </div>
                      
                      
            

          <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme" 
            style="padding-top: 20px;">
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

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
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
   
    <script>
    
    function copy(){
    	var copyText = document.getElementById("url_box");
    	copyText.select();
    	navigator.clipboard.writeText(copyText.value);
    	swal("복사되었습니다");	
    }
    
    
        
        
        $("#inviteSubmit").click(function() {
        	let token = $("meta[name='_csrf']").attr("content");
            let header = $("meta[name='_csrf_header']").attr("content");
            
            var invite_box1 = $('input[name="invite_box1"]').map(function() {
                return $(this).val();
            }).get();
            console.log(invite_box1);
          

            // Ajax 요청 보내기
            $.ajax({
                type: "POST",
                url: "../admin/sendMail", // 컨트롤러 URL
                data: {
                    invite_box1: invite_box1
                    
                },
                async: false,
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(response) {
                    // Ajax 요청이 성공했을 때 실행되는 코드
                    alert("메일이 발송되었습니다.");
                },
                error: function(xhr, status, error) {
                    // Ajax 요청이 실패했을 때 실행되는 코드
                    alert("메일 발송에 실패했습니다.");
                }
            });
        });
   
    </script>
  </body>
</html>