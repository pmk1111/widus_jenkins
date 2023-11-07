<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
     <title>직원정보 상세조회</title>
      <link rel="icon" type="image/x-icon"
			href="${pageContext.request.contextPath}/mainboard/assets/img/favicon/favicon.png" />
      


</head>

<body>

  	
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="empModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        
        
          <!--  Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title" id=#empDetailModal>필수정보</h4>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
              <form action="employee-update" name="empDetail" method="POST">
               <div class="info-modal">
                  <div class="modal-overlay">
                       <input type="hidden" name="id"  value="${emp.id}">
                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                          <div class="content">
                                <h3>필수정보</h3>
                           </div>
                           <div class="modal-content-wrap">
                              <div class="employee-info-detail">
                                 <div class="text">
                                    <div class="form-group">
                                        <label for="name">이름 *</label> <input type="text" class="form-control" id="empName" placeholder="이름을 입력하세요" name="name" value="${info.name}" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">이메일 *</label> <input type="text" class="form-control" id="empemail" placeholder="이메일을 입력하세요" name="email" value="${info.email}" readOnly>
                                    </div>
                                        <hr>
                                        
                                        <h3>추가정보</h3>
                                    <div class="form-group">
                                        <label for="companyName">회사명</label> <input type="text" class="form-control" id="companyName" name="company_name" value="${info.company_name}" readOnly>
                                    </div>

                                    <div class="form-group">
                                        <label for="companyDepart">부서</label> <input type="text" class="form-control" id="companyDepart" placeholder="부서명을 입력하세요" name="department" value="${info.department}">
                                    </div>

                                    <div class="form-group">
                                        <label for="companyPosition">직책</label> <input type="text" class="form-control" id="companyPosition" name="position" value="${info.position}">
                                    </div>

                                    <div class="form-group">
                                        <label for="phone">전화번호</label> <input type="text" class="form-control" id="phone" placeholder="번호를 입력하세요" name="phone" value="${info.phone}">
                                    </div>
                                 </div>
                              </div>
                           </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
     
              </div>
            
              <!-- <div class="modal-footer">
                <div class="btnArea">
                    <button type="button" class="btn btn-secondary" id="cancelButton">확인</button>
                </div> -->
                
					<div class="btnArea">
					   <button type="submit" class="btn btn-secondary" id="saveButton">저장</button>
					<button type="button" class="btn btn-secondary"id="cancelButton" data-dismiss="modal">취소</button>
					</div> 
				</form>
            </div>
        </div>
    </div>
</div>

</body>