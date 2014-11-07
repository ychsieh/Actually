JSONData_Project = [{
            label: "Amazon",
            value: 66
        }, {
            label: "uncompleted",
            value: 34
        }]

JSONData_Section = [{
            label: "My Progress",
            value: 70
        }, {
            label: "uncompleted",
            value: 30
        }]

JSONData_Task1 = [{
            label: "taskB",
            value: 78
        }, {
            label: "uncompleted",
            value: 22
        }]

JSONData_Task2 = [{
            label: "taskC",
            value: 99
        }, {
            label: "uncompleted",
            value: 1
        }]

JSONData_Task3 = [{
            label: "taskD",
            value: 58
        }, {
            label: "uncompleted",
            value: 42
        }]

JSONData_Task4 = [{
            label: "taskE",
            value: 80
        }, {
            label: "uncompleted",
            value: 20
        }]

$(function() {

    Morris.Donut({
        element: 'morris-donut-chart1',
        data: JSONData_Project,
        resize: true,
        colors: ['rgba(11, 98, 164, 1)', 'rgba(11, 98, 164, 0)'],
        formatter: function (y, data) { return y + '%' }
    });

    Morris.Donut({
        element: 'morris-donut-chart2',
        data: JSONData_Section,
        resize: true,
        colors: ['rgba(122, 146, 163, 1)', 'rgba(122, 146, 163, 0)'],
        formatter: function (y, data) { return y + '%' }
    });

    Morris.Donut({
        element: 'morris-donut-chart3',
        data: JSONData_Task1,
        resize: true,
        colors: ['rgba(77, 167, 77, 1)', 'rgba(77, 167, 77, 0)'],
        formatter: function (y, data) { return y + '%' }
    });

        Morris.Donut({
        element: 'morris-donut-chart4',
        data: JSONData_Task2,
        resize: true,
        colors: ['rgba(77, 167, 77, 1)', 'rgba(77, 167, 77, 0)'],
        formatter: function (y, data) { return y + '%' }
    });

    Morris.Donut({
        element: 'morris-donut-chart5',
        data: JSONData_Task3,
        resize: true,
        colors: ['rgba(77, 167, 77, 1)', 'rgba(77, 167, 77, 0)'],
        formatter: function (y, data) { return y + '%' }
    });
    
        Morris.Donut({
        element: 'morris-donut-chart6',
        data: JSONData_Task4,
        resize: true,
        colors: ['rgba(77, 167, 77, 1)', 'rgba(77, 167, 77, 0)'],
        formatter: function (y, data) { return y + '%' }
    });
});
