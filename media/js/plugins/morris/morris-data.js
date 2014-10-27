JSONData = [{
            period: '2014 Q0',
            developer_1: 266,
            developer_2: null,
            developer_3: 1347,
            total: 1613
        }, {
            period: '2014 Q1',
            developer_1: 2778,
            developer_2: 1294,
            developer_3: 1941,
        }, {
            period: '2014 Q2',
            developer_1: 3712,
            developer_2: 1969,
            developer_3: 2501,
        }, {
            period: '2014 Q3',
            developer_1: 4767,
            developer_2: 2597,
            developer_3: 3689,
        }, {
            period: '2014 Q4',
            developer_1: 5810,
            developer_2: 3914,
            developer_3: 4293,
        }]


JSONData_Progress = {data: [{
            developer: 'developer_1',
            actual_per: 25,
            exp_per: 21
        }, {
            developer: 'developer_2',
            actual_per: 19,
            exp_per: 24
        }, {
            developer: 'developer_3',
            actual_per: 20,
            exp_per: 20
        }]}


$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: JSONData,
        xkey: 'period',
        ykeys: ['developer_1', 'developer_2', 'developer_3'],
        labels: ['developer_1', 'developer_2', 'developer_3'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: JSONData_Progress.data,
        xkey: 'developer',
        ykeys: ['actual_per', 'exp_per'],
        labels: ['Actual Progress', 'Expected Progress'],
        hideHover: 'auto',
        resize: true
    });


});
