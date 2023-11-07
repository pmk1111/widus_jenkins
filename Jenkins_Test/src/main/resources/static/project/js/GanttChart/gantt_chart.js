$(document).ready(function() {

	var tasks = [
		  {
		    start: "2023-10-08",
		    end: "2023-10-15",
		    name: "빵빵이 이모티콘 사주세요",
		    custom_class: "blue",
		    assignee: "빵빵이",
		    id:"1"
		  },
		  {
		    start: "2023-10-08",
		    end: "2023-10-15",
		    name: "이게되네",
		    custom_class: "blue",
		    assignee: "빵빵이",
		    id:"1"
		  },
		  {
		    start: "2023-10-10", // start date
		    end: "2023-10-22", // end date
		    name: "옥진석 예비군 훈련 10월 27일", // title
		    custom_class: "pink", //custom class name
		    assignee: "JJOK97"
		  },
		  {
		    start: "2023-10-27", // start date
		    end: "2023-10-27", // end date
		    name: "1", // title
		    custom_class: "purple", //custom class name
		    assignee: "JJOK97"
		  },
		  {
		    start: "2023-10-17", // start date
		    end: "2023-10-27", // end date
		    name: "2", // title
		    custom_class: "purple", //custom class name
		    assignee: "JJOK97"
		  },
		  {
		    start: "2023-10-17", // start date
		    end: "2023-10-27", // end date
		    name: "3", // title
		    custom_class: "purple", //custom class name
		    assignee: "JJOK97"
		  },
		  {
		    start: "2023-10-17", // start date
		    end: "2023-10-27", // end date
		    name: "4", // title
		    custom_class: "purple", //custom class name
		    assignee: "JJOK97"
		  },
		  {
		    start: "2023-10-27", // start date
		    end: "2023-10-27", // end date
		    name: "5", // title
		    custom_class: "purple", //custom class name
		    assignee: "JJOK97"
		  },	
		  {
		    start: "2023-10-27", // start date
		    end: "2023-10-27", // end date
		    name: "6", // title
		    custom_class: "purple", //custom class name
		    assignee: "JJOK97"
		  }	  		  		  
		];
		
    var epicCount = 0;
    var taskCount = 0;

    $('.js-gubun-button.all-task-project.epic').each(function() {
        epicCount += $(this).next('ul').children('li').length;
    });

    $('.js-gubun-button.all-task-project.task').each(function() {
        taskCount += $(this).next('ul').children('li').length;
    });
	
	tasks.unshift({custom_class: "task-zero"});
	
	if (epicCount + 1 < tasks.length) { // Check if the index exists
	    tasks.splice(epicCount + 1, 0, {custom_class: "task-zero"});
	}
	
	if (epicCount + taskCount + 2 < tasks.length) { // Check if the index exists
	    tasks.splice(epicCount + taskCount + 2, 0, {custom_class: "task-zero"});
	}
    
   	// Adding options
	var gantt = new Gantt("#gantt", tasks, {
	   on_click: function (task) { console.log(task); },
	   on_date_change: function (task, start, end) { console.log(task, start, end); },
	   on_progress_change: function (task, progress) { console.log(task, progress); },
	   on_view_change: function (mode) { console.log(mode); },
	
	   custom_popup_html: function (task) {
	       const start_date = task._start.toLocaleDateString();
	       const end_date = task._end.toLocaleDateString();
	
	       return `
	           <div class="details-container">
	               <h5>${task.name}</h5>
	               <p>시작일 ${start_date}</p>
	               <p>마감일 ${end_date}</p>
	               <p>담당자 : ${task.assignee}.</p>
	           </div>`;
	   },
	
	   bar_height : 20,
	   bar_corner_radius : 20,
	   arrow_curve : 10,
	   padding : 20
	});
	
    gantt.change_view_mode("Day");

    var AllModes = [$("#day"), $("#week"), $("#month")];

    function changeViewMode(mode) {
        $.each(AllModes, function(i, $mode) {
            $mode.removeClass("active");
        });
        
        gantt.change_view_mode(mode);
    }

    $("#day").on("click", function() {
        changeViewMode("Day");
        $(this).addClass("active");
    });

	$("#week").on("click", function() {
		changeViewMode("Week");
		$(this).addClass("active");
	});

	$("#month").on("click", function() {
		changeViewMode("Month");
		$(this).addClass("active");
	});
   
    $(".gantt .grid-row").eq(epicCount + 1).css("fill", "#ececec");
    $(".gantt .grid-row").eq(epicCount + taskCount + 2).css("fill", "#ececec"); 
    
});