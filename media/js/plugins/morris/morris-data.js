// JSONData = [{
//             period: '2014 Q0',
//             developer_1: 266,
//             developer_2: null,
//             developer_3: 1347,
//             total: 1613
//         }, {
//             period: '2014 Q1',
//             developer_1: 2778,
//             developer_2: 1294,
//             developer_3: 1941,
//         }, {
//             period: '2014 Q2',
//             developer_1: 3712,
//             developer_2: 1969,
//             developer_3: 2501,
//         }, {
//             period: '2014 Q3',
//             developer_1: 4767,
//             developer_2: 2597,
//             developer_3: 3689,
//         }, {
//             period: '2014 Q4',
//             developer_1: 5810,
//             developer_2: 3914,
//             developer_3: 2293,
//         }]


// JSONData_Progress = {data: [{
//             developer: 'Long',
//             actual_per: 8,
//             exp_per: 21,
//         }, {
//             developer: 'developer_2',
//             actual_per: 19,
//             exp_per: 60,
//         }, {
//             developer: 'developer_3',
//             actual_per: 20,
//             exp_per: 20,
//         }]}


$(function() {

    $.ajax({
            dataType: "json",
            url: "http://127.0.0.1:8000/getpmjson"
        }).done(function(data) {
            console.log(data);
            Morris.Area({
                element: 'morris-area-chart',
                data: data.JSONData,
                xkey: 'period',
                ykeys: data.developers,
                labels: data.developers,
                pointSize: 2,
                hideHover: 'auto',
                resize: true
            });

            Morris.Bar({
                element: 'morris-bar-chart',
                data: data.JSONData_Progress.data,
                xkey: 'developer',
                ykeys: ['actual_per', 'exp_per'],
                labels: ['Actual Progress', 'Expected Progress'],
                yLabelFormat: function (y) { return y.toString() + '%'; },
                hideHover: 'auto',
                ymax: 100,
                resize: true
            });
        });
        
    $('#container').highcharts({
        title: {
            text: 'Actual progress',
            x: -20 //center
        },
        subtitle: {
            text: 'Completed portion for each section',
            x: -20
        },
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: 'Percentage (%)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '%'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Tokyo',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'New York',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: 'Berlin',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: 'London',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });

});
