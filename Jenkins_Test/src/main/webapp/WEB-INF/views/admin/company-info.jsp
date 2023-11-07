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
    <title>회사 정보</title>
    <meta name="description" content="" />

	<link rel="icon" type="image/x-icon" href="../resources/mainboard/assets/img/favicon/favicon.png" />
	<!-- CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

	<!-- jQuery library (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS (necessary for some of Bootstrap's JavaScript plugins) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

	<!-- Latest compiled and minified Bootstrap JavaScript -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script src="../resources/admin/js/companyinfo.js"></script>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../resources/mainboard/assets/img/favicon/favicon.ico" />

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

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <style>
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
      .welcome-message{width:100%;}
 
 	  #urlupdate, #nameupdate {margin-top: 50px;
 	  						   border: 1px solid #d9dee3;
 	  						   background-color: white;
 	  						   color: #697a8d;
 	  						   }
 	  #addresspdate {margin-top: 80px;
 	  				 border: 1px solid #d9dee3;
 	  				 background-color: white;
 	  				 color: #697a8d;
 	  				}
 	  				
 	  #zip_code, #addr, #addr_dtl, #openZip {margin-bottom: 10px;
 	  							   color: #697a8d;
 	  							   border: 1px solid #d9dee3;}
 	  
 	  .form-control {border:1px solid transparent;
 	    			 border-bottom: 1px solid #d9dee3;
 	    			 background-color:white;
 	  				
 	  				}
 	  #formCompanySetting input:disabled {
   					 background-color: transparent;
					}
	 .card {
            width: 100%;
            height: 800px;
            min-height: 800px;
	}
	
	.card-body { padding:50px;}
	
	.form-label, .col-md-12  {padding-top: 20px}
	
	
	.changepassword { margin: 20px 0px 40px 0px}
	.changepwd { background-color: white;
				 border: 1px solid #d9dee3;
				 color: #697a8d;
				 border-radius: 5px;
			
	}
	.pwdsubmit {border: 1px solid #d9dee3;
 	  						    background-color: white;
 	  						    color: #697a8d;
 	  						    box-shadow:none;
 	  						    border-radius:5px;}
	
	#saveButton, #cancelButton,
	#saveNameButton, #cancelNameButton {margin-top:50px;
								border: 1px solid #d9dee3;
 	  						    background-color: white;
 	  						    color: #697a8d;
 	  						    box-shadow:none;
	 }
	 
	 #saveAddressButton, #cancelAdressButton{margin-top: 80px;
	 							border: 1px solid #d9dee3;
 	  						    background-color: white;
 	  						    color: #697a8d;
 	  						    box-shadow:none
	 }
	 
	 #saveButton, #saveNameButton, #saveAddressButton {color:white;
	 							   background-color:#696cff;}
 
 	.modal .modal-header .btn-close {transform: translate(23px,-25px)};
 	
 	/* swal */
 	
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
              <div class="row" style="margin-top:30px;">
                <div class="col-lg-8 mb-4 order-0 welcome-message">
                  <div class="container-fluid" >
                    <div class="card">
                        <div class="card-body">
                          <h2 class="card-title text-primary">회사 정보</h2>
                          <hr>
                          <p class="mb-4">
                          
                          <!-- content -->
                          
                          <form id="formCompanySetting" method="GET" action = "../admin/companyinfo">
                             <%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                               <input type="hidden" id="companyId" name="companyId" value="${companyinfo.id}">                  
                        <div class="row">
                        <div class="mb-3 col-md-6" id="name">
                            <label for="companyName" class="form-label">회사명</label>
                             <input
                              class="form-control"
                              type="text"
                              id="companyName"
                              name="companyName"
                              value="${companyinfo.name}"
                              disabled="disabled"
                              
                            />
                          
                        </div>
                       
                       <div class="mb-3 col-md-6">
      					     <button type="button" class="btn" id="nameupdate">수정</button>
      					     <button type="submit" class="btn btn-secondary d-none" id="saveNameButton">저장</button>
       						 <button type="button" class="btn btn-secondary d-none" id="cancelNameButton">취소</button>
  					   </div>
  					   		 <input type="hidden" name="updateType" id="updateType" value="updateName">
  					   
                      
                         <div class="mb-3 col-md-6">
                            <label for="companyDomain" class="form-label">전용 URL</label>
                             <input
                              class="form-control"
                              type="text"
                              id="companyDomain"
                              name="companyDomain"
                              value= "${companyinfo.domain}"
                              disabled="disabled"
                            />

                        </div>

                        <div class="mb-3 col-md-6">
      					     <button type="button" class="btn" id="urlupdate">수정</button>
      					     <button type="submit" class="btn btn-secondary d-none" id="saveButton">저장</button>
       						 <button type="button" class="btn btn-secondary d-none" id="cancelButton">취소</button>
  					   </div>
  					    	 <input type="hidden" name="updateType" id="updateDomain" value="updateDomain">
  					   		
  					     <div class="mb-3 col-md-6 " >
						 	 <label for="address" class="form-label">주소</label>
						  	 
						    <div>
							 <input type="text"  id="zip_code" name="zip_code" value= "${companyinfo.zipcode}"readonly="readonly" placeholder="우편번호" style="width:255px;">
							 <input type="button" id="openZip" onclick="openZipSearch()" value="우편번호 찾기" style="width:140px;">
							 <input type="text"   id="addr" name="addr" value= "${companyinfo.address}" readonly="readonly" placeholder="기본주소"  style="width:400px;">
							 <input type="text"   id="addr_dtl" name="addr_dtl" value= "${companyinfo.detail_address}" disabled="disabled" placeholder="상세주소"  style="width:400px;">
							</div>
							 
						</div>				
                	
                		<div class="mb-3 col-md-6">
      					     <button type="button" class="btn" id="addresspdate">수정</button>
      					     <button type="submit" class="btn btn-secondary d-none" id="saveAddressButton">저장</button>
       						 <button type="button" class="btn btn-secondary d-none" id="cancelAdressButton">취소</button>
  					   </div>
  					   		 <input type="hidden" name="updateType" id="updateAddress" value="updateAddress">
  					   		 
                      </div>
                       
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function openZipSearch() {
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr_dtl").value = extraAddr;
                
                } else {
                    document.getElementById("addr_dtl").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip_code').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr_dtl").focus();
            }
        }).open();
    }
    </script>
  </body>
</html>