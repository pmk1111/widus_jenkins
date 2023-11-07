<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
<link rel="icon" type="image/x-icon" href="../resources/mainboard/assets/img/favicon/favicon.ico" />

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>구성원 관리</title>
    <meta name="description" content="" />
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="icon" type="image/x-icon"
         href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

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
        .tab1_style {
            width: 800px;
            margin: 0 auto;
            margin-top: 50px;
        }

        .nav-tabs .nav-item .nav-link:not(.active) {
            background-color: white;
            border: 1px solid #d9dee3
        }

        .nav-tabs .nav-item .nav-link.active {
            border: 3px solid #307cff;
            padding-bottom: 5px;
            cursor: default;
            font-weight: bold;
        }

        .card {
            height: 800px;
            /* 화면 높이에 80% 맞춤 */
            width: 100%;
        }

        .tab-pane {
            display: none;
        }

        /* 활성 탭 내용만 표시 */
        .tab-pane.active {
            display: block;
        }

        .col-lg-8 {
            flex: 0 0 auto;
            width: 100%;
        }

        .nav-tabs {
            padding-bottom: 1px;
            border-bottom: 1px solid #d9dee3;
        }

        .tab1_style {
            width: 100%;
        }

        #filterSelect {
            padding: 3px 0px 4px 0px;
            color: #697A8D;
        }

        #searchInput {
            color: #697A8D;
            border: 1px solid #d9dee3;
        }

        thead tr,
        tbody tr {
            text-align: center;
        }

        button {
            background-color: white;
            font-size: 13px;
            border: none;
            padding-left: 0px;
            color: #697A8D;
        }

        .update-delete {
            color: red;
            font-size: 12px;
            padding-left: 6px;
        }

        p {
            display: inline;
            font-size: 13px;
        }

        .blue {
            color: blue;
        }

        .red {
            color: red;
        }
        
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
                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <div class="col-lg-8 mb-4 order-0 welcome-message">
                                <div class="container-fluid">
                                    <div class="card">
                                        <div class="card-body" style="padding: 0 50px; margin-top:50px;">
                                            <h2 class="card-title text-primary">구성원 관리</h2>
                                            <hr>
                                            <p class="mb-4">

                                                <!-- 탭 -->
                                                <div id="head-tab" class="tab1_style mgt30" style="margin-left: 0px;">
                                                    <ul class="nav nav-tabs">
                                                        <li class="nav-item employee-tab">
                                                            <a class="nav-link active" data-toggle="tab" href="#useruse">
                                                                <span>정상</span><span> [ <span id="count-emp" style="font-size:13px;">${countEmp}</span> ]</span>
                                                            </a></li>
                                                        <li class="nav-item stop-tab">
                                                            <a class="nav-link" data-toggle="tab" href="#userstop">
                                                                <span>이용중지</span><span> [ <span id="count-stop" style="font-size:13px;">${countStop}</span> ]</span>
                                                            </a></li>
                                                        <li class="nav-item wait-tab">
                                                            <a class="nav-link" data-toggle="tab" href="#userwait">
                                                                <span>가입대기</span><span> [ <span id="count-user" style="font-size:13px;">${countUser}</span> ]</span>
                                                            </a></li>
                                                    </ul>
                                                </div>

                                                <br>
                                                <!-- 검색 -->
                                                <div id="search" style="overflow-y: scroll; overflow-x:hidden; max-height: 550px;">
                                                    <form autocomplete="off">
                                                   
                                                        <select id="filterSelect" name="search_field" style="border: 1px solid #d9dee3;">
                                                            <option>이름</option>
                                                            <option>이메일</option>
                                                            <option>부서</option>
                                                            <option>직책</option>
                                                        </select> <input class="search-bar" type="text" id="searchInput" placeholder="검색어 입력">

                                                    </form>

                                                    <br>
                                                    <div id="content">
                                                        <div class="tab-pane fade show active" id="useruse">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>프로필</th>
                                                                        <th>사원번호</th>
                                                                        <th>이름</th>
                                                                        <th>부서</th>
                                                                        <th>직책</th>
                                                                        <th>이메일</th>
                                                                        <th>휴대폰번호</th>
                                                                        <th>상태</th>
                                                                        <th>관리자</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody class="employee-body">
                                                                    <c:choose>
                                                                        <c:when test="${empty employee}">
                                                                            <tr>
                                                                                <td colspan="9" style="border-bottom: none">조회된 데이터가 없습니다.</td>
                                                                            </tr>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach var="emp" items="${employee}">
                                                                                <tr>
                                                                                    <td>
                                                                                        <c:choose>
                                                                                            <c:when test="${empty emp.pic}">
                                                                                                <!-- user_photo가 비어있을 때, 기본 이미지 표시 -->
                                                                                                <img src="<c:url value='../resources/user/img/profile.png' />" alt="프로필 사진" width="25" height="25">
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <!-- user_photo가 비어있지 않을 때, 사용자의 이미지 표시 -->
                                                                                                <img src="<c:url value='../upload' />${emp.pic}" alt="프로필 사진" width="25" height="25" 프로필 사진" width="25" height="25">
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </td>
                                                                                    <td>
                                                                                        <c:out value="${emp.id}" />
                                                                                    </td>
                                                                                    <td id="empDetail">
                                                                                     <button type="button" class="empDetail" data-emp-id="${emp.id}" data-toggle="modal"   data-target="#myModal"  >
                                                                                       <c:out value="${emp.name}" /></button>
                                                                                    </td>
                                                                                    
                                                                                    <td>
                                                                                        <c:out value="${emp.department}" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <c:out value="${emp.position}" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <c:out value="${emp.email}" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <c:out value="${emp.phone}" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <p>정상</p>
                                                                                        <button class="user-stop" data-employeeId="${emp.id}" data-employeeStatus="${emp.status}">[이용중지]</button>
                                                                                    </td>
                                                                                    <c:set var="color" value="blue" />
                                                                                    <c:set var="adminAuth" value="[등록]" />
                                                                                    <c:if test="${emp.auth =='Y'}">
                                                                                        <c:set var="color" value="red" />
                                                                                        <c:set var="adminAuth" value="[삭제]" />
                                                                                    </c:if>
                                                                                    <td><span class="employee-auth-value">
                                                                                            <c:out value="${emp.auth}" /></span>
                                                                                        <button class="update-auth <c:out value='${color }'/>" data-employeeId="${emp.id}">
                                                                                            <c:out value="${adminAuth}" />
                                                                                        </button></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                          
                                    
                                          
                                                        <div class="tab-pane fade" id="userstop">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>프로필</th>
                                                                        <th>사원번호</th>
                                                                        <th>이름</th>
                                                                        <th>부서</th>
                                                                        <th>직책</th>
                                                                        <th>이메일</th>
                                                                        <th>휴대폰번호</th>
                                                                        <th>상태</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody class="stop-employee">
                                                                </tbody>

                                                            </table>
                                                        </div>

                                                        <div class="tab-pane fade" id="userwait">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>프로필</th>
                                                                        <th>이름</th>
                                                                        <th>이메일</th>
                                                                        <th>가입요청일</th>
                                                                        <th>설정</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody class="wait-user">
                                                                </tbody>

                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Footer -->
                            <footer class="content-footer footer bg-footer-theme" style="padding-top: 20px;">
                                <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                                    <div class="mb-2 mb-md-0">
                                        ©
                                        <script>
                                            document.write(new Date()
                                                .getFullYear());
                                        </script>
                                        (주)WidUs
                                    </div>
                                    <div>
                                        <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a> <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a> <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a> <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
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
        </div>
    </div>
       
    <jsp:include page="employee-info.jsp"/>
   
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
    getEmp();
    
     $('.nav-link').on('click', function() {
       if($(this).attr('href') === '#userwait') {
         $('.search-bar').hide();
         $('#filterSelect').hide();
       } else {
         $('.search-bar').show();
         $('#filterSelect').show();
       }
     });


  //검색
  function searchTable() {
      var filterText = document.getElementById("searchInput").value
          .toUpperCase();
      var filterType = document.getElementById("filterSelect").value;
      var rows = document.querySelectorAll("table tbody tr");

      rows.forEach(function(row) {
          var cells = row.getElementsByTagName("td");
          var shouldHide = true;

          for (var i = 0; i < cells.length; i++) {
              var cellText = cells[i].textContent.toUpperCase();

              if ((filterType === "이름" && i === 2 ) ||
                  (filterType === "이메일" && i === 5) ||
                  (filterType === "부서" && i === 3) ||
                  (filterType === "직책" && i === 4)) {
                  if (cellText.indexOf(filterText) > -1) {
                      shouldHide = false;
                      break;
                  }
              }
          }

          if (shouldHide) {
              row.style.display = "none";
          } else {
              row.style.display = "";
          }
      });
  }

  document.getElementById("searchInput").addEventListener("input",
      searchTable);
  document.getElementById("filterSelect").addEventListener("change",
      searchTable);


  //직원정보 상세조회
  $(function() {
$("body").on("click",".empDetail", function() {
      var empId = $(this).data("emp-id");
console.log(empId);
       $.ajax({
         type: "GET",
         url: "employee-info",
         data: {
            empId: empId,
            
         },
         
         success: function (response) {
            
           console.log("성공");
           $('input[name=id]').val(response.id);
           $('input[name=name]').val(response.name);
           $('input[name=email]').val(response.email);
           $('input[name=company_name]').val(response.company_name);
           $('input[name=department]').val(response.department);
           $('input[name=position]').val(response.position);
           $('input[name=phone]').val(response.phone);
           
           
           },
           error: function (error) {
             console.error("Error: " + error);
           }
       }); //ajax end
     });  // 
  }); 
     
         /*정상탭 */
       $('.employee-tab').click(function(){
          let token = $("meta[name='_csrf']").attr("content");
          let header = $("meta[name='_csrf_header']").attr("content");
          
          var tbody = $('.employee-body');
          
          if(tbody.children().length == 0){ // tbody 내부의 자식 요소 개수 확인
              tbody.append('<tr><td colspan="9" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>'); // 만약 자식 요소가 없다면 메시지 출력
          }
          
        getEmp();
      })
     
      
      /* 가입대기 탭 */
      $('.wait-tab').click(function() {
           
          $.ajax({
              url: "../admin/wait-reg",
              type: "GET",
              data: {
                 
              },
              success: function(user) {
                  var waitList = '';
                  
            
                  
                  for (var i = 0; i < user.length; i++) {
                      console.log(user)
                     waitList += '<tr>';
                      waitList += '<td>';
         
                      var userPic = user[i].pic;
                      if (userPic === null) {
                          waitList += '<img src="${pageContext.request.contextPath}/resources/user/img/profile.png" alt="프로필 사진" width="25" height="25">';
                      } else {
                          waitList += '<img src="../upload' + user[i].pic + '" alt="프로필 사진" width="25" height="25">';
                      }

                      waitList += '</td>';
                      waitList += '<td>' + user[i].name + '</td>';
                      waitList += '<td>' + user[i].email + '</td>';
                      waitList += '<td>' + user[i].created_at + '</td>';
                      waitList += '<td>';
                      waitList += '<button class="approveUser" data-userId="' + user[i].id + '">[승인]</button>';
                      waitList += '<button class="rejectUser" data-userId="' + user[i].id + '">[거절]</button>';
                      waitList += '</tr>'
                      console.log(user[i].createdAt);
                  }

                  $('.wait-user').html(waitList);

                  // 만약 자식 요소가 없다면 메시지 출력
                  if ($('.wait-user').children().length === 0) {
                      $('.wait-user').append('<tr><td colspan="5" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>');
                  }

                  $('.approveUser').click(function() {
                      let token = $("meta[name='_csrf']").attr("content");
                      let header = $("meta[name='_csrf_header']").attr("content");

                      var userId = $(this).attr('data-userId');
                      console.log(userId);

                      var $this = $(this);

                      $.ajax({
                          url: "../admin/approve",
                          type: "POST",
                          data: {
                              userId: userId,
                             
                          },
                          beforeSend: function(xhr) {
                              xhr.setRequestHeader(header, token);
                          },
                          success: function(result) {

                              $this.closest('tr').remove();
                        
                              var countUser = result.countUser;
                              $('#count-user').text(countUser);

                              var countEmp = result.countEmp;
                              $('#count-emp').text(countEmp);
                              
                              if ($('.wait-user').children().length === 0) {
                                  $('.wait-user').append('<tr><td colspan="5" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>');
                              }

                          }
                          /* success */
                      });
                      /* Ajax */
                  });
                  /* click */
                  
                  $('.rejectUser').click(function() {
                      let token = $("meta[name='_csrf']").attr("content");
                      let header = $("meta[name='_csrf_header']").attr("content");

                      var userId = $(this).attr('data-userId');
                      console.log(userId);

                      var $this = $(this);

                      $.ajax({
                          url: "../admin/reject",
                          type: "POST",
                          data: {
                              userId: userId,
                            
                          },
                          beforeSend: function(xhr) {
                              xhr.setRequestHeader(header, token);
                          },
                          success: function(result) {

                              $this.closest('tr').remove();
                        
                              var countUser = result.countUser;
                              $('#count-user').text(countUser);
                              
                              if ($('.wait-user').children().length === 0) {
                                  $('.wait-user').append('<tr><td colspan="5" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>');
                              }
                              
                              alert("업데이트에 성공하였습니다.");

                          }
                          /* success */
                      });
                      /* Ajax */
                  });
                  /* click */                    
              },

              error: function() {
                  alert("업데이트에 실패했습니다.");
              }
          });
      });

      /* 중지 */
      $('.stop-tab').click(function() {
         
          let token = $("meta[name='_csrf']").attr("content");
          let header = $("meta[name='_csrf_header']").attr("content");

          var tbody = $('.stop-employee');

          if (tbody.children().length == 0) { // tbody 내부의 자식 요소 개수 확인
              tbody.append('<tr><td colspan="8" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>'); // 만약 자식 요소가 없다면 메시지 출력
          }

       

          $.ajax({
              url: "../admin/stop-list",
              type: "GET",
              data: {
                
              },
              success: function(stopEmp) {
                  var stopList = '';

                  console.log(stopEmp);

                  for (var i = 0; i < stopEmp.length; i++) {
                      stopList += '<tr>';
                      stopList += '<td>';
                      var empPic = stopEmp[i].pic;
                      if (empPic === null) {
                          stopList += '<img src="${pageContext.request.contextPath}/resources/user/img/profile.png" alt="프로필 사진" width="25" height="25">';
                      } else {
                          stopList += '<img src="../upload' + stopEmp[i].pic + '" alt="프로필 사진" width="25" height="25">';
                      }

                      // 각 필드에 대해 null 체크 후 값 할당
                      var department = (stopEmp[i].department !== null) ? stopEmp[i].department : '';
                      var position = (stopEmp[i].position !== null) ? stopEmp[i].position : '';
                      var phone = (stopEmp[i].phone !== null) ? stopEmp[i].phone : '';

                      stopList += '</td>';
                      stopList += '<td>' + stopEmp[i].id + '</td>';
                      stopList += '<td>' + stopEmp[i].name + '</td>';
                      stopList += '<td>' + department + '</td>';
                      stopList += '<td>' + position + '</td>';
                      stopList += '<td>' + stopEmp[i].email + '</td>';
                      stopList += '<td>' + phone + '</div>';
                      stopList += '<td>';
                      stopList += '<p>이용중지</p>';
                      stopList += '<button class="user-stop" data-employeeId="' + stopEmp[i].id + '">[ 정상 ]</button>';
                      stopList += '</td>';
                      stopList += '</tr>';
                  }

                  $('.stop-employee').html(stopList);
                  
                  $('.user-stop').click(function() {
                      let token = $("meta[name='_csrf']").attr("content");
                      let header = $("meta[name='_csrf_header']").attr("content");

                      var empId = $(this).data('employeeid');
                      
                      console.log(empId);

                      var $this = $(this);

                      $.ajax({
                          url: "../admin/back-emp",
                          type: "POST",
                          data: {
                             empId: empId,
                             
                          },
                          beforeSend: function(xhr) {
                              xhr.setRequestHeader(header, token);
                          },
                          success: function(result) {

                              $this.closest('tr').remove();
                        
                              var countEmp = result.countEmp;
                              $('#count-emp').text(countEmp);
                              
                              var countStop = result.countStop;
                              $('#count-stop').text(countStop);
                              
                              if ($('.employee-body').children().length === 0) {
                                  $('.employee-body').append('<tr><td colspan="9" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>');
                              }
                              
                              alert("업데이트에 성공하였습니다.");

                          }
                          /* success */
                      });
                      /* Ajax */
                  });
                  /* click */                    

              } // success function 종료 괄호 추가 필요

          }); // ajax call 종료 괄호와 세미콜론 추가 필요

      }); // click event handler 종료 괄호와 세미콜론
      
      
      function getEmp(){

          
          $.ajax({
              url: "../admin/employee-list",
              type: "GET",
              data: {
                  
              },
              success: function(emp) {
                  var empList = '';
                  
                  if (emp.length == 0) { // 데이터의 길이를 확인하여 0일 경우 메시지 출력
                     $('.employee-body').empty(); // 기존에 표시되던 내용 제거
                      $('.employee-body').append('<tr><td colspan="9" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>');
                      return; // 추가적인 처리를 중단하고 함수 종료
                  }
                  
                  console.log(emp);
                  for (var i = 0; i < emp.length; i++) {                    
                     empList += '<tr>';
                     empList += '<td>';
                      var empPic = emp[i].pic;
                      if (empPic === null) {
                         empList += '<img src="${pageContext.request.contextPath}/resources/user/img/profile.png" alt="프로필 사진" width="25" height="25">';
                      } else {
                         empList += '<img src="../upload' + emp[i].pic + '" alt="프로필 사진" width="25" height="25">';
                      }
                      
                  
                     empList += '</td>';
                     empList += '<td>' + emp[i].id + '</td>';
      empList += '<td id="empDetail">';
                 empList += '<button type="button" class="empDetail" data-emp-id="' + emp[i].id + '" data-toggle="modal" data-target="#myModal">';
                 empList += emp[i].name;
                 empList += '</button>';
                 empList += '</td>';
                 
                     // 각 필드에 대해 null 체크 후 값 할당
if (emp[i].department === null) {
    emp[i].department = '';
}

if (emp[i].position === null) {
    emp[i].position = '';
}

if (emp[i].phone === null) {
    emp[i].phone = '';
}
                     empList += '<td>' + emp[i].department + '</td>';
                     empList += '<td>' + emp[i].position + '</td>';
                     empList += '<td>' + emp[i].email + '</td>';
                     empList += '<td>' + emp[i].phone + '</td>';
                     empList += '<td>';
                     empList += '<p>정상</p>';
                     empList += '<button class="user-stop" data-employeeId="'+ emp[i].id + '">[이용중지]</button>';
                     empList += '</td>';
                     var color = "blue";
                     var adminAuth = "[등록]";

                     if (emp[i].auth == 'Y') {
                         color = "red";
                         adminAuth = "[삭제]";
                     }
                     empList += '<td><span class="employee-auth-value">' + emp[i].auth + '</span>';
                     empList += '<button class="update-auth '+color+'" data-employeeId="' + emp[i].id +'"> ' + adminAuth + '</button></td>';
                     empList += '</td>';
                     empList += '</tr>';
                  }
                  
                  $('.employee-body').html(empList);
                  
                  $('.user-stop').click(function() {
                      let token = $("meta[name='_csrf']").attr("content");
                      let header = $("meta[name='_csrf_header']").attr("content");

                      var empId = $(this).data('employeeid');
                      
                      console.log(empId);

                      var $this = $(this);

                      $.ajax({
                          url: "../admin/emp-stop",
                          type: "POST",
                          data: {
                             empId: empId,
                             
                          },
                          beforeSend: function(xhr) {
                              xhr.setRequestHeader(header, token);
                          },
                          success: function(result) {
                             
                             alert("선택한 사원이 이용중지 되었습니다.");

                              $this.closest('tr').remove();
                        
                              var countEmp = result.countEmp;
                              $('#count-emp').text(countEmp);
                              
                              var countStop = result.countStop;
                              $('#count-stop').text(countStop);
                              
                              if ($('.employee-body').children().length === 0) {
                                  $('.employee-body').append('<tr><td colspan="9" style="border-bottom: none">조회된 데이터가 없습니다.</td></tr>');
                              }
                              
                             

                          }
                          /* success */
                      });
                      /* Ajax */
                  });
                  /* click */                    
                 
                  $('.update-auth').click(function() {
                      let token = $("meta[name='_csrf']").attr("content");
                      let header = $("meta[name='_csrf_header']").attr("content");

                      var empId = $(this).data('employeeid');
                      
                      console.log(empId);

                      var $this = $(this);

                      $.ajax({
                          url: "../admin/update-auth",
                          type: "POST",
                          data: {
                             'empId': empId,
                          },
                          async:false,
                          beforeSend: function(xhr) {
                              xhr.setRequestHeader(header, token);
                          },
                          success: function(result) {

                              alert("관리자 상태가 변경되었습니다.");
                              
                              if ($this.text().trim() === "[등록]") {
                                  $this.removeClass('blue').addClass('red');
                                  $this.text("[삭제]");
                                  $this.siblings('.employee-auth-value').text('Y');
                              } else {
                                  $this.removeClass('red').addClass('blue');
                                  $this.text("[등록]");
                                  $this.siblings('.employee-auth-value').text('N');
                              }
                          }
                          /* success */
                      });
                      /* Ajax */
                  });
                  /* click */      
                  
              },
              error: function() {
                  alert("업데이트에 실패했습니다.");
              }
          });            
          
      }
  </script>
     
     
       
    </body>

    </html>