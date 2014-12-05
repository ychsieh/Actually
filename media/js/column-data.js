$(function () {

    $.ajax({
        dataType: "json",
        url: "http://127.0.0.1:8000/jsontest"
    }).done(columncallback);

    Highcharts.setOptions({
        lang: {
            drillUpText: '◁ Back to Overview'
        }
        
    });

    function columncallback(data){
        console.log("jsondata is: "+data.data);
        data = data.data;

        var data3 = 
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
                name: 'Expected Progress',
                data: [   //percentage of each task
                    ['task1', 20],
                    ['task2', 70],
                    ['task3', 50]
                ]
            },{
                id: 'expdeveloper2',
                name: 'Expected Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            },{
                id: 'expdeveloper3',
                name: 'Expected Progress',
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
                name: 'Actual Progress',
                data: [
                    ['task1', 10],
                    ['task2', 30],
                    ['task3', 90]
                ]
            },{
                id: 'actdeveloper2',
                name: 'Actual Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            },{
                id: 'actdeveloper3',
                name: 'Actual Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            }
        ]
    };
        var tasksdata = (data.expectedtasks).concat(data.actualtasks);
        var exppro = 'Expected Progress';
        var actpro = 'Actual Progress';

                // Create the chart
        $('#overview').highcharts({
            chart: {
                type: 'column',
                //margin: [0, 0, 0, 0],
                // spaceing: [0, 0, 0, 0]
            },
            credits: {
                enabled: false
            },
            title: {
                text: data.projectname
            },
            subtitle: {
                text: 'Click the columns to view the progress for tasks'
            },
            exporting: {
                enabled: false
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
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.1f}%</b><br/>'
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
                series: tasksdata,
                tooltip: {
                    headerFormat: '<span style="font-size:11px">{point.name}</span><br>',
                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.1f}%</b><br/>'
                },
            }
        });
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
    },
    {
        name: 'developer3',
        data: [1, 2, 51, 71, 71, 81, 71, 71, 7, 74, 76, 77, 80, 80, 80]
    }

];


$.ajax({
        dataType: "json",
        url: "http://127.0.0.1:8000/get_process_json"
    }).done(linecallback);

function linecallback(data2){
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
        exporting: {
                enabled: false
        },
        credits: {
                enabled: false
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
var data10 = [ // the array of delayed tasks decided by checking if expected progress exceed 90%
        {
        task: 'Task 1', //task name
        date: '11/16/2014',  //due date
        late: 'Past Due', // check if the task past the due date
        developer: 'Long', //developer name
        expected: 100,  //expected progress
        actual: 85      //actual progress
        },
        {
        task: 'Task 2',
        date: '11/16/2014',
        late: 2, //if not past due then return how many days left
        developer: 'Jin', 
        expected: 95,
        actual: 85
        },
        {
        task: 'Task 3',
        date: '11/16/2014',
        late: 6, 
        developer: 'Ya-Chen', 
        expected: 90,
        actual: 75
        },
        {
        task: 'Task 4',
        date: '11/16/2014',
        late: 3,
        developer: 'Xinhe', 
        expected: 95,
        actual: 90
        }
    ];


$.ajax({
        dataType: "json",
        url: "http://127.0.0.1:8000/get_past_due"
    }).done(duecallback);

function duecallback(data4){
    console.log(data4);
    for (var i = 0; i < data4.length; i ++) {
        var newId = "task" + i;
        var newDiv = $( "<div></div>").attr("id",newId);

        var expColor = 'rgba(0,0,216,0.6)';
        var actColor = 'rgba(0,0,216,0.6)';
        if (data4[i]["late"]==="Past Due") {
            expColor = "rgba(216,0,0,0.6)";
            actColor = "rgba(216,0,0,0.6)";
        }

        var late = data4[i]["late"];
        if(data4[i]["late"] != 'Past Due')
            late = late + ' Days Left';

        $("#delayed").append(newDiv);
        $("#delayed div#" + newId).highcharts({

            chart: {
                type: 'bar',
                height: 150
            },
            title: {
                text: late,
                style: {
                    'font-size': '15px'
                }
            },
            exporting: {
                enabled: false
            },
            subtitle: {
                text: data4[i]["task"] + ' Due on ' + data4[i]["date"] //taskname+'Due on'+date
            },
            xAxis: {
                categories: [data4[i]["developer"]], //developer name
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
                data: [data4[i]["expected"]], //expected
                color: expColor
            },{
                name: 'Actual',
                data: [data4[i]["actual"]], //actual
                color: actColor
            }]
        });
    };
};
};
