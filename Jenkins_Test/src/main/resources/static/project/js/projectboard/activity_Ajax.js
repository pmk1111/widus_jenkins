
function getRecentStatus() {

let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        url: '../project/recent',
        method: 'POST',
        beforeSend: function(xhr) { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
            xhr.setRequestHeader(header, token);
        },
        success: function(data) {
         
         console.log(data);
         
           var html = '';
           
           for (var i = 0; i < data.length; i++) {
           
               var rs = data[i];
               var color = rs.color;
               var timeDiff = rs.currenttime;
               
               if (rs.guide == 'create-project'){
                  
                  html += '<div class="activity-item d-flex">';
                  
                     html += '<div class="activite-label">';
                     
                     if (timeDiff < 1) {
                        html += '<span style="font-size:13px">방금 전</span>';
                     } else if (timeDiff >= 1 && timeDiff < 60) {
                        html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
                     } else if (timeDiff >= 60 && timeDiff < 1440) {
                        html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
                     } else if (timeDiff >= 1440 && timeDiff < 10080) {
                        html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
                     } else if (timeDiff >= 10080 && timeDiff < 43200) {
                        html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
                     }         
                        
                     html += '</div>';
                  
                     if (color == 'COLOR1') {
                         html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                     } else if (color == 'COLOR2') {
                         html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                     } else if (color == 'COLOR3') {
                         html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                     } else if (color == 'COLOR4') {
                         html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                     } else if (color == 'COLOR5') {
                         html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                     }
                     
                     html += '<div class="activity-content"><strong>축하합니다!</strong> <strong> ' + rs.master + '</strong>님이 새 프로젝트를 생성하였습니다. </div>';
                     
                  html += '</div>';
                  html += '</div>';
               
               } else if (rs.guide == 'modify-project') {
               
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                                                   
                  html += ' <div class="activity-content"><strong>' + rs.master + '</strong>님이 프로젝트 명을 <strong>' + rs.update_DATA + '</strong>로 변경하였습니다.</div>';
                  html += '</div>';
                  html += '</div>';
               
               } else if (rs.guide == 'add-invite') {
               
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                     
                  html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 <strong>' + rs.selected_USER + '</strong>님을 프로젝트에 초대하였습니다. </div>';
                  
                  html += '</div>';
                  html += '</div>';
                  
               } else if (rs.guide == 'change-auth' && rs.update_DATA == '1') {
                              
                  html += '<div class="activity-item d-flex">';
                     html += '<div class="activite-label">';
                     
                     if (timeDiff < 1) {
                        html += '<span style="font-size:13px">방금 전</span>';
                     } else if (timeDiff >= 1 && timeDiff < 60) {
                        html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
                     } else if (timeDiff >= 60 && timeDiff < 1440) {
                        html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
                     } else if (timeDiff >= 1440 && timeDiff < 10080) {
                        html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
                     } else if (timeDiff >= 10080 && timeDiff < 43200) {
                        html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
                     }
                  
                  html += '</div>';
               
                     if (color == 'COLOR1') {
                         html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                     } else if (color == 'COLOR2') {
                         html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                     } else if (color == 'COLOR3') {
                         html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                     } else if (color == 'COLOR4') {
                         html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                     } else if (color == 'COLOR5') {
                         html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                     }
                        
                     html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 <strong>' + rs.selected_USER + '</strong>님에게 <div class="status-admin"><span class="status-span" style="color: #fff">관리자</span></div> 권한을 부여하였습니다. </div>';
                  
                  html += '</div>';
                  html += '</div>';
               
               } else if (rs.guide == 'change-auth' && rs.update_DATA == '0') {
                                             
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                     
                  html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 <strong>' + rs.selected_USER + '</strong>님의 <div class="status-admin"><span class="status-span" style="color: #fff">관리자</span></div> 권한을 해제하였습니다. </div>';
                  html += '</div>';
                  html += '</div>';
               
               } else if (rs.guide == 'create-issue') {
                                                               
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                         
                  html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 이슈 ';
                  
                  if (rs.issue_TYPE == '버그') {
                     html += '<img src="../resources/issue/img/bug.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '작업') {
                     html += '<img src="../resources/issue/img/task.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '에픽') {
                     html += '<img src="../resources/issue/img/epic.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  }
                  
                  html += '<strong><a  href="../issue/issue-detail?num=' + rs.row_id + '" > ' + rs.update_DATA + '</a></strong>를 게시하였습니다. </div>';
                  html += '</div>';
                  html += '</div>';
                  
               } else if (rs.guide == 'change-type') {
                                                                              
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                        
                  html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 "' + rs.update_DATA + '"(으)로 타입 변경 : ';
                  
                  if (rs.issue_TYPE == '버그') {
                     html += '<img src="../resources/issue/img/bug.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '작업') {
                     html += '<img src="../resources/issue/img/task.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '에픽') {
                     html += '<img src="../resources/issue/img/epic.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  }
                  
                  html += '<strong><a href="../issue/issue-detail?num=' + rs.row_id + '" style="font-size:15px"> ' + rs.issue_SUBJECT + '</a></strong>';
                  html += '</div>';
                  html += '</div>';
                  
               } else if (rs.guide == 'change-assigned') {
                                                                                             
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                     
                  html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 <strong>' + rs.changed_USER + '</strong>님으로 이슈 담당자 변경 : ';
                  
                  if (rs.issue_TYPE == '버그') {
                     html += '<img src="../resources/issue/img/bug.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '작업') {
                     html += '<img src="../resources/issue/img/task.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '에픽') {
                     html += '<img src="../resources/issue/img/epic.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  }
                  
                  html += '<strong><a href="../issue/issue-detail?num=' + rs.row_id + '" style="font-size:15px"> ' + rs.issue_SUBJECT + '</a></strong>';
                  html += '</div>';
                  html += '</div>';
                  
               } else if (rs.guide == 'change-priority') {
                                                                                                            
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                     
                   html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 "' + rs.update_DATA + '"(으)로 우선순위 변경 : ';
                  
                  if (rs.issue_TYPE == '버그') {
                     html += '<img src="../resources/issue/img/bug.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '작업') {
                     html += '<img src="../resources/issue/img/task.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '에픽') {
                     html += '<img src="../resources/issue/img/epic.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  }
                  
                  html += '<strong><a href="../issue/issue-detail?num=' + rs.row_id + '" style="font-size:15px"> ' + rs.issue_SUBJECT + '</a></strong>';
                  html += '</div>';
                  html += '</div>';
                  
               } else if (rs.guide == 'change-status') {
                                                                                                                           
                  html += '<div class="activity-item d-flex">';
                  html += '<div class="activite-label">';
                  
               if (timeDiff < 1) {
                  html += '<span style="font-size:13px">방금 전</span>';
               } else if (timeDiff >= 1 && timeDiff < 60) {
                  html += '<span style="font-size:13px">' + timeDiff + ' 분 전</span>';
               } else if (timeDiff >= 60 && timeDiff < 1440) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / 60) + ' 시간 전</span>';
               } else if (timeDiff >= 1440 && timeDiff < 10080) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (24 * 60)) + ' 일 전</span>';
               } else if (timeDiff >= 10080 && timeDiff < 43200) {
                  html += '<span style="font-size:13px">' + Math.floor(timeDiff / (7 *24 *60)) + ' 주 전</span>';
               }
               
               html += '</div>';
               
                  if (color == 'COLOR1') {
                      html += '<i class="bi bi-circle-fill activity-badge text-warning align-self-start"></i>';
                  } else if (color == 'COLOR2') {
                      html += '<i class="bi bi-circle-fill activity-badge text-info align-self-start"></i>';
                  } else if (color == 'COLOR3') {
                      html += '<i class="bi bi-circle-fill activity-badge text-primary align-self-start"></i>';
                  } else if (color == 'COLOR4') {
                      html += '<i class="bi bi-circle-fill activity-badge text-danger align-self-start"></i>';
                  } else if (color == 'COLOR5') {
                      html += '<i class="bi bi-circle-fill activity-badge muted align-self-start"></i>';
                  }
                     
                   html += '<div class="activity-content"><strong>' + rs.master + '</strong>님이 "' + rs.update_DATA + '"(으)로 상태 변경 : ';
                  
                  if (rs.issue_TYPE == '버그') {
                     html += '<img src="../resources/issue/img/bug.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '작업') {
                     html += '<img src="../resources/issue/img/task.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  } else if (rs.issue_TYPE == '에픽') {
                     html += '<img src="../resources/issue/img/epic.svg" class="issueTYPE-icon" style="padding-bottom: 4px;">';
                  }
                  
                  html += '<strong><a href="../issue/issue-detail?num=' + rs.row_id + '" style="font-size:15px"> ' + rs.issue_SUBJECT + '</a></strong>';
                  html += '</div>';
                  html += '</div>';
               }
           }
   
           $('.recent-activity').html(html);
           
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
    
};