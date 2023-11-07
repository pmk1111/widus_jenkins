$(document).ready(function() {

    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();

        // If the search input is empty, show all rows and remove the no results message
        if (value === '') {
            $('table tbody tr').show();
            $('#noResultsRow').remove();
            return; // exit the event handler early
        }

        var matchedRows = $('table tbody tr').filter(function() {
            return $(this).text().toLowerCase().indexOf(value) > -1;
        });

        $('table tbody tr').hide(); // hide all rows

        if (matchedRows.length === 0) {
            $('#noResultsRow').remove(); // remove existing no results row before adding a new one
            $('table tbody').append('<tr id="noResultsRow"><td colspan="4">검색어와 일치하는 결과가 없습니다</td></tr>');
        } else {
            matchedRows.show(); // show matching rows
            $('#noResultsRow').remove();
        }
    });

    var sortState = {};

    var priorityValues = {
        'Critical': 1,
        'High': 2,
        'Middle': 3,
        'Low': 4
    };

    $('.datatable-sorter').click(function() {
        var table = $('#myTable');
        var rows = $('tr:gt(0)', table).toArray();
        var columnIndex = $(this).parent().index();

        // Reset all buttons
        $('.datatable-sorter').removeClass('asc desc');

        if (!sortState[columnIndex] || sortState[columnIndex] === 'none') {
            sortState[columnIndex] = 'asc';
            $(this).addClass('asc');
        } else if (sortState[columnIndex] === 'asc') {
            sortState[columnIndex] = 'desc';
            $(this).addClass('desc');
        } else if (sortState[columnIndex] === 'desc') {
            sortState[columnIndex] = 'none';
        }

        // Sort or reset rows
        if (sortState[columnIndex] !== 'none') {
            rows.sort(function(a, b) {
                var keyA = $(a).children('td').eq(columnIndex).text();
                var keyB = $(b).children('td').eq(columnIndex).text();

                // If sorting the "우선 순위" column, use the priorityValues mapping
                if (columnIndex === 3) {
                    keyA = priorityValues[keyA.trim()];
                    keyB = priorityValues[keyB.trim()];
                }

                if (!isNaN(keyA) && !isNaN(keyB)) {
                    return sortState[columnIndex] === 'asc' ? Number(keyA) - Number(keyB) : Number(keyB) - Number(keyA);
                }

                return sortState[columnIndex] === 'asc' ? keyA.localeCompare(keyB) : keyB.localeCompare(keyA);
            });
        } else { // Reset to the original order
            rows.sort(function(a, b) {
                return $(a).data('index') - $(b).data('index');
            });
        }

        $.each(rows, function(index, row) {
            table.children('tbody').append(row);
        });
    });

})