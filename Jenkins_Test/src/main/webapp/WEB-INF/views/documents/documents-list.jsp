<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>



<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />


    <title>WidUs-Documents</title>
    <meta name="description" content="" />

    <jsp:include page="../template/cssTemplate.jsp"></jsp:include>
    <link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap">

    <!-- Helpers -->
    <script src="../resources/mainboard/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="../resources/mainboard/assets/js/config.js"></script>

    <style>
    	*{
    		font-family: 'Nanum Gothic', sans-serif;
    	}
    
		body {
	          font-size:16px;
	          font-weight: bold;
	    }
	          
	    .card{
	    	min-height: 720px
	    }
	    
	    table{
	    	font-weight: 500
	    }
        #documentarea1 {
            width: 1414px;
        }

        #layout-navbar {

            margin-top: 0px;
        }

        .file-search {
            border: 1px solid lightgrey;
            border-radius: 3px;
            width: 350px;
            height: 35px;
            padding-left: 15px;
            color: #6a6192;
            font-weight: 700
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

				.container{
					padding:0px;
				}
				
        #documentarea2 {
            margin-top: 100px;
        }
        .extension-icon{
        	width:30px;
        }
        #searchBtn{
        	margin-left:15px;
        	width:70px;
        	height:35px;
		    color: #fff;
		    background-color: #9F7AB0;
		    border-color: #9F7AB0;
		    box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
		}
		.documents-area{
		 	overflow: auto; height: 500px; 
		 }
		.issue-link{
			color:#697a8d;
		}
		.table th {
	    	font-size: 17px;
	    	text-align: center;
		}
		
		.table td {
		    justify-content: space-between;
		    align-items: center;
		    font-size: 16px;
		    height: 60px;
		    border-radius: 3px;
		    white-space: nowrap; 
		    text-overflow: ellipsis; 
		    overflow: hidden; 
		    max-width: 150px; 
		}
		
		.tablearea {
		    display: table-row;
		}
		
		#printDocumentBody{
			text-align: center;
		}
		#search-btn {
			display:none;	
		    margin-right: 15px; 
		    width: 70px;
		    height: 50px;
		    box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
		}
		.search-label {
			position:relative;
			top:-2px;
			left:-1px;
		    padding: 10px;
		    display: inline-block;
		    width: 50px;
		    height: 50px;
		    border: 1px solid lightgrey;
		    border-radius: 0px 3px 3px 0px;
		}
		.search-btn-icon {
		    width: 26px;
		    opacity: 0.4;
		}

		.search-label:hover{
			cursor:pointer
		}
		
		.file-search::placeholder{
			color: #bababa;
		}
		.issue-search:focus{
			outline:none;
		}	
		.file-search{
			border:1px solid lightgrey;
			border-radius:3px 0px 0px 3px;
			width:400px;
			height:50px;
			padding-left: 15px;
			color:#6a6192;
			font-weight: 700;
		}
		.table td:hover {
		    text-overflow: initial;
		    white-space: normal;
		    overflow: visible;
		    cursor:pointer
		}
		.left-align {
		    text-align: left !important;
		}
		.flex-column {
    flex-direction: initial !important;
}

.menu-inner {
	    font-weight: 500;
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

                <!-- / Navbar -->
                
                <div class="container-xxl flex-grow-1 container-p-y" id="documentarea2">
                
	               <jsp:include page="../chat/chat.jsp"></jsp:include>
	               <jsp:include page="../notify/notify.jsp"></jsp:include>
	               
                    <div class="row">
                        <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-list" id="documentarea1">
                            <div class="card">

                                <div class="card-body documents-list-card-body">


                                    <!-- Content wrapper -->
                                    <div class="content-wrapper">
                                        <!-- Content -->

                                        <div class="container-xxl flex-grow-1 container-p-y">
                                            <div class="container">
                                                <div><h3 style="margin-bottom: 30px; font-weight: 700;">파일함</h3></div>
                                           <div class="tabelcreate">     
                                            <div class="tablearea">
                                                <!-- <div><input type="text" class="file-search" placeholder="파일명을 입력하세요." id = "keyword">
                                                <button id="searchBtn" onclick="searchDocument()"></button></div>
                                               -->
													<input type="text" class="file-search" id="keyword" name="searchText" placeholder="파일명을 입력하세요.">												
													<input type="button" id="search-btn" onclick="searchDocument()" value="검색">
													<label for="search-btn" class="search-label">
														<img class="search-btn-icon" src="../resources/project/img/projectboard/search.svg">
													</label>	
													</div>	
                                               </div>
                                               <hr>
                                               <div class="documents-area">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">No</th>
                                                            <th scope="col">이슈명</th>
                                                            <th scope="col">다운로드</th>
                                                            <th scope="col">파일명</th>
                                                            <th scope="col">용량</th>
                                                            <th scope="col">등록자</th>
                                                            <th scope="col">등록일</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                   <tbody id = "printDocumentBody">
													</tbody>
                                                </table>
                                               </div>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                    <div class="content-backdrop fade"></div>
                    
                </div>
                <!-- Content wrapper -->
                                                        <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme" style="font-weight: 500">
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
<script type="text/javascript">
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $(document).ready(function(){
        searchDocument();
    });

    function searchDocument() {
        const keyword = $("#keyword").val();

        $.ajax({
            url: '../documents/search-documents-list',
            type: 'POST',
            data: { keyword: keyword },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (response) {
                if (response.length == 0) {
                    $("#printDocumentBody").html('<tr><td colspan="7" style="text-align:center;"><img src="../resources/documents/img/search-null.svg" alt="문서를 찾을 수 없습니다"></td></tr>');
                } else {
                    var printTxt = '';
                    for (var i = 0; i < response.length; i++) {
                        printTxt += '<tr>';
                        printTxt += '<th scope="row">' + (i+1) +'</th>';
                        printTxt += '<td class="left-align"><a href="#" class="issue-link" onclick="issueDetail(\'' + response[i].issueId + '\')">' + response[i].subject + '</a></td>';
                        printTxt += '<td><a href="/widus/documents/down?saveName=' + encodeURIComponent(response[i].saveName) + '&originalName=' + encodeURIComponent(response[i].originalName) + '" style="display: block; text-align: center;">';

                        let split = response[i].originalName.split('.'); 
                        let extension = split[split.length - 1].toLowerCase(); 

                        if(extension === 'txt') { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/txt-icon.png" alt="텍스트 아이콘">';
                        } else if(['jpg', 'jpeg', 'png', 'gif', 'svg', 'bmp'].includes(extension)) { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/img-icon.png" alt="이미지 아이콘">'; 
                        } else if(['xlsx', 'xlsm', 'xlsb', 'xltx'].includes(extension)) { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/exel-icon.png" alt="엑셀 아이콘">'; 
                        } else if(['hwp', 'hwpx'].includes(extension)) { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/hwp-icon.png" alt="한글 아이콘">'; 
                        } else if(['pptx', 'pptm', 'ppt'].includes(extension)) { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/ppt-icon.png" alt="파워포인트 아이콘">'; 
                        } else if(extension === 'pdf') { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/pdf-icon.png" alt="PDF 아이콘">'; 
                        } else { 
                            printTxt += '<img class="extension-icon" src="../resources/issue/img/default-icon.png" alt="기본 아이콘">'; 
                        } 

                        printTxt += '</a></td>';
                        printTxt += '<td class="left-align">' + response[i].originalName + '</td>';
                        printTxt += '<td>' + response[i].fileSize + ' KB</td>';
                        printTxt += '<td>' + response[i].name + '</td>';
                        printTxt += '<td>' + response[i].createdAt + '</td>';
                        printTxt += '</tr>';
                    }
                    $("#printDocumentBody").html(printTxt);
                }
            },
            error: function (error) {
                console.error(error);
            }
        });
    }

    function issueDetail(issueId){
        window.location.href = '/widus/issue/issue-detail?num=' + issueId;
    }
</script>
</html>