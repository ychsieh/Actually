$(function () {
    var jsondata;

    $.ajax({
        dataType: "json",
        url: "http://127.0.0.1:8000/getpmjson"
    }).done(function(data) {
        console.log(data);
        jsondata = data;
    });

    Highcharts.setOptions({
        lang: {
            drillUpText: '◁ Back to Overview'
        }
    });

    var data = 
        {
            projectname: 'Facebook',
            expected:[
                {
                    name: 'developer1',
                    y: 30, //percentage
                    drilldown: 'expdeveloper1' //'exp' + name
                },{
                    name: 'developer2',
                    y: 40, 
                    drilldown: 'expdeveloper2'
                },{
                    name: 'developer3',
                    y: 50, 
                    drilldown: 'expdeveloper3'
                }
            ],

            actual:[
                {
                    name: 'developer1',
                    y: 50, 
                    drilldown: 'actdeveloper1'  //'act' + name
                },{
                    name: 'developer2',
                    y: 40, 
                    drilldown: 'actdeveloper2'
                },{
                    name: 'developer3',
                    y: 50,
                    drilldown: 'actdeveloper3'
                }
            ],

            expectedtasks:[
                {
                    id: 'expdeveloper1', //'exp' + name
                    data: [   //percentage of each task
                        ['task1', 20],
                        ['task2', 70],
                        ['task3', 50]
                    ]
                },{
                    id: 'expdeveloper2',
                    data: [
                        ['task1', 30],
                        ['task2', 40],
                        ['task3', 50]
                    ]
                },{
                    id: 'expdeveloper3',
                    data: [
                        ['task1', 30],
                        ['task2', 40],
                        ['task3', 50]
                    ]
                }
            ],

            actualtasks:[
                {
                    id: 'actdeveloper1', //'act' + name
                    data: [
                        ['task1', 10],
                        ['task2', 30],
                        ['task3', 90]
                    ]
                },{
                    id: 'actdeveloper2',
                    data: [
                        ['task1', 30],
                        ['task2', 40],
                        ['task3', 50]
                    ]
                },{
                    id: 'actdeveloper3',
                    data: [
                        ['task1', 30],
                        ['task2', 40],
                        ['task3', 50]
                    ]
                }
            ]
        };

    var tasksdata = (data.expectedtasks).concat(data.actualtasks);

            // Create the chart
    $('#overview').highcharts({
        chart: {
            type: 'column',
            //margin: [0, 0, 0, 0],
            // spaceing: [0, 0, 0, 0]
        },
        title: {
            text: data.projectname
        },
        subtitle: {
            text: 'Click the columns to view the progress for tasks'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            max: 100,
            title: {
                text: 'Percentage Completed'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y:.1f}%'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        },

        series: [{
            name: 'Expected Progress',
            colorByPoint: true,
            data: data.expected,
            allowPointSelect: false,
            type: 'column'
        },
        {
            name: 'Actual Progress',
            colorByPoint: true,
            data: data.actual,
            allowPointSelect: false,
            type: 'column'
        }],
        drilldown: {
            drillUpButton: {
                relativeTo: 'spacingBox',
                position: {
                    y: 0,
                    x: 0
                },
                
            },
            series: tasksdata
        }
    });

    var data2 = [
        {
            name: 'developer1',
            data: [1, 2, 5, 7, 9, 11, 15, 15, 15, 15, 20, 23, 25, 28, 28] //actual section progress in 30 days
                        
        },
        {
            name: 'developer2',
            data: [1, 22, 51, 71, 71, 71, 71, 71, 73, 74, 76, 77, 80, 80, 80]
        }

    ];

    var d = new Date();
    var target = d.setDate(d.getDate()-30);
    var day = d.getDate();
    var month = d.getMonth();
    var dates = [];
    for (var i = 0; i < 30; i++) {    
        var date = (month+1) + '/' + day;
        dates.push(date);
        d.setDate(d.getDate()+1);
        month = d.getMonth();
        day = d.getDate();
    };
    

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
            categories: dates,
            labels: {
                style: {
                    fontWeight: 'bold',
                    fontSize: '80%'
                },
            }
        },
        yAxis: {
            title: {
                text: 'Percentage (%)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }],
            min: 0,
            max: 100
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

        series: data2
        // series: [{
        //     name: 'Tokyo',
        //     data: [{name: 'jan', y: 7.0}
        //         , 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        // }, {
        //     name: 'New York',
        //     data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        // }, {
        //     name: 'Berlin',
        //     data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        // }, {
        //     name: 'London',
        //     data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        // }]

    });

    
});

$(function () {
    $('#task1').highcharts({
        chart: {
            type: 'bar',
            height: 150
        },
        title: {
            text: 'Past due',
            style: {
                'font-size': '15px'
            }
        },
        subtitle: {
            text: 'Task 1 Due on 11/16/2014'
        },
        xAxis: {
            categories: ['Long Ma'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            max: 100,
            title: {
                text: 'Progress(Percentage)',
                align: 'high'
            },
            labels: {
                enabled: false,
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: '%'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                },
            }
        },
        legend: {
            enabled: false,
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [ {
            name: 'Expected',
            data: [100],
            color: 'rgba(216,0,0,1)'
        },{
            name: 'Actual',
            data: [85],
            color: 'rgba(216,0,0,0.3)'
        }]
    });
});

$(function () {
    $('#task2').highcharts({
        chart: {
            type: 'bar',
            height: 150
        },
        title: {
            text: '3 Days Left',
            style: {
                'font-size': '15px'
            }
        },
        subtitle: {
            text: 'Task 2 Due on 11/21/2014'
        },
        xAxis: {
            categories: ['Sha Jin'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            max: 100,
            title: {
                text: 'Progress(Percentage)',
                align: 'high'
            },
            labels: {
                enabled: false,
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: '%'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            enabled: false,
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [ {
            name: 'Expected',
            data: [90],
            color: 'rgba(0,0,216,1)'    
        },{
            name: 'Actual',
            data: [75],
            color: 'rgba(0,0,216,0.3)'
        }]
    });
});

$(function () {
    $('#task3').highcharts({
        chart: {
            type: 'bar',
            height: 150
        },
        title: {
            text: '4 Days Left',
            style: {
                'font-size': '15px'
            }
        },
        subtitle: {
            text: 'Task 3 Due on 11/22/2014'
        },
        xAxis: {
            categories: ['Long Ma'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            max: 100,
            title: {
                text: 'Progress(Percentage)',
                align: 'high'
            },
            labels: {
                enabled: false,
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: '%'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            enabled: false,
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [ {
            name: 'Expected',
            data: [90],
            color: 'rgba(0,0,216,1)'    
        },{
            name: 'Actual',
            data: [80],
            color: 'rgba(0,0,216,0.3)'
        }]
    });
});


