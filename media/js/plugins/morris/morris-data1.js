JSONData_Project1 = [{
            label: "completed",
            value: 87
        }, {
            label: "uncompleted",
            value: 13
        }]

JSONData_Project2 = [{
            label: "completed",
            value: 70
        }, {
            label: "uncompleted",
            value: 30
        }]

JSONData_Project3 = [{
            label: "completed",
            value: 78
        }, {
            label: "uncompleted",
            value: 22
        }]

$(function() {

    Morris.Donut({
        element: 'morris-donut-chart1',
        data: JSONData_Project1,
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart2',
        data: JSONData_Project2,
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart3',
        data: JSONData_Project3,
        resize: true
    });

    

});
