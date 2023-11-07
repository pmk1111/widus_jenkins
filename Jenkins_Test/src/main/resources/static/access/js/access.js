
  function formatYearMonth(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    return year + '년' + (month < 10 ? '0' : '') + month + '월';
  }

  function updateMonthSelect() {
    var select = document.querySelector('.month-select');
    var sixMonthsAgo = new Date();
    sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);

    for (var i = 6; i > 0; i--) {
      var option = document.createElement('option');
      option.text = formatYearMonth(new Date(sixMonthsAgo.getFullYear(), sixMonthsAgo.getMonth() + i));
      select.add(option);
    }
  }

  function searchTable() {
    var filterText = document.getElementById("searchInput").value.toUpperCase();
    var filterType = document.getElementById("filterSelect").value;
    var rows = document.querySelectorAll("table tbody tr");

    rows.forEach(function (row) {
      var cells = row.getElementsByTagName("td");
      var shouldHide = true;

      for (var i = 0; i < cells.length; i++) {
        var cellText = cells[i].textContent.toUpperCase();

        if ((filterType === "번호" && i === 0) || (filterType === "이름" && i === 1) || (filterType === "아이디" && i === 3)) {
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

  function tableToExcel(table, name) {
    var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head>' + '<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>' + '<x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet>' + '</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>';
    var format = function (s, c) {
      return s.replace(/{(\w+)}/g, function (m, p) {
        return c[p];
      });
    };

    var ctx = {
      worksheet: name || 'Worksheet',
      table: table.innerHTML
    };

    var blob = new Blob([ '\ufeff' + format(template, ctx) ], {
      type: 'application/vnd.ms-excel'
    });

    saveAs(blob, "테이블명.xls");
  }

  let can = '';
  handleTabClick('monthly');
  function handleTabClick(tabType) {
    if (tabType === 'monthly') {
      settings('lineChart', "monthlyGraph");
    } else if (tabType === 'weekly') {
      settings('lineChart2', "weeklyGraph");
    } else if (tabType === 'daily') {
      settings('lineChart3', "dailyGraph");
    }

    const tabElements = document.querySelectorAll('.nav-item a.nav-link');
    tabElements.forEach((tabElement) => {
      tabElement.classList.remove('active');
    });

    const selector = "a[onclick=\"handleTabClick('" + tabType + "')\"]";
    const activeTabElement = document.querySelector(selector);
    activeTabElement.classList.add('active');
  }

  function settings(charttype, graphsid) {
    let ctx = document.getElementById(charttype).getContext('2d');
    let labels = [];
    let data = [];

    if (charttype === 'lineChart') {
      var today = new Date();
      var sixMonthsAgo = new Date();
      sixMonthsAgo.setMonth(today.getMonth() - 5);

      function formatDate(date) {
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        return year + '년' + (month < 10 ? '0' : '') + month + '월';
      }

      labels = [
        formatDate(sixMonthsAgo),
        formatDate(new Date(today.getFullYear(), today.getMonth() - 4)),
        formatDate(new Date(today.getFullYear(), today.getMonth() - 3)),
        formatDate(new Date(today.getFullYear(), today.getMonth() - 2)),
        formatDate(new Date(today.getFullYear(), today.getMonth() - 1)),
        formatDate(new Date(today.getFullYear(), today.getMonth()))
      ];
      data = [50, 20, 10, 0, 25, 60];
    } else if (charttype === 'lineChart2') {
      var today = new Date();
      var firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
      var firstDayOfWeek = firstDayOfMonth.getDay();
      var currentWeek = Math.ceil((today.getDate() + firstDayOfWeek) / 7);
      var totalWeeksInMonth = Math.ceil((firstDayOfMonth.getMonth() + 2) / 3);
      labels = [];
      for (var i = 1; i <= totalWeeksInMonth; i++) {
        labels.push(i + '주차');
      }
      data = [30, 40, 50, 25, 35, 45];
    } else if (charttype === 'lineChart3') {
      var today =  new Date();
      var currentDay = today.getDate();
      labels = [];
      data = [10, 20, 15, 30, 25, 40, 55];
      for (var i = currentDay - 6; i <= currentDay; i++) {
        labels.push(today.getMonth() + 1 + '월 ' + (i < 10 ? '0' : '') + i + '일');
      }
    }

    const chartData = {
      labels: labels,
      datasets: [
        {
          data: data,
          borderColor: 'lightblue',
          backgroundColor: 'lightblue',
          pointRadius: 10,
          pointHoverRadius: 15
        }
      ]
    };

    const chartConfig = {
      type: 'line',
      data: chartData,
      options: {
        responsive: true,
        plugins: {
          title: {
            display: true
          },
          legend: {
            display: false
          }
        }
      }
    };

    if (can != '')
      can.destroy();

    can = new Chart(ctx, chartConfig);

    document.getElementById('monthlyGraph').style.display = 'none';
    document.getElementById('weeklyGraph').style.display = 'none';
    document.getElementById('dailyGraph').style.display = 'none';

    document.getElementById(graphsid).style.display = 'block';
    document.getElementById(graphsid).style.height = '250px';
  }

