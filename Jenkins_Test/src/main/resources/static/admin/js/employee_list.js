//tab 활성화

$(function() {
    // 탭을 클릭할 때 이벤트 리스너 등록
    $(".nav-link").click(function() {
        // 클릭한 탭의 data-tab 속성 값을 가져옴
        var tabHref = $(this).attr("href");

        // URL 생성
        var targetUrl = "../admin/list" + tabHref;
    });


});



