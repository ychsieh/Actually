$(function () {

    //get all the expected and actuall progresses of developers in a project and display them using column charts from Highcharts
    $.ajax({
        dataType: "json",
        url: "http://ec2-54-188-224-227.us-west-2.compute.amazonaws.com/jsontest"
        // url: "http://127.0.0.1:8000/jsontest"
    }).done(columncallback);

    Highcharts.setOptions({
        lang: {
            drillUpText: '◁ Back to Overview'
        }
        
    });

    function columncallback(data){
        console.log("jsondata is: "+data.data);
        data = data.data;

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
            colors: ['#7cb5ec','#2f7ed8'
            ],
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
                colorByPoint: false,
                data: data.expected,
                allowPointSelect: false,
                type: 'column'
            },
            {
                name: 'Actual Progress',
                colorByPoint: false,
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
    };   
    


    var data3 = [
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

    ////get all developer actual processes in a project and display them using line chart from Highcharts
    $.ajax({
            dataType: "json",
            url: "http://ec2-54-188-224-227.us-west-2.compute.amazonaws.com/get_process_json"
            // url: "http://127.0.0.1:8000/get_process_json"
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

        });
    };

    //get all the delayed tasks of a project and display them using bar charts from Highcharts
    $.ajax({
            dataType: "json",
            url: "http://ec2-54-188-224-227.us-west-2.compute.amazonaws.com/get_past_due"
            // url: "http://127.0.0.1:8000/get_past_due"
        }).done(duecallback);

    function duecallback(data4){
        console.log(data4);
        for (var i = 0; i < data4.length; i ++) {
            var newId = "task" + i;
            var newDiv = $( "<div></div>").attr("id",newId);

            var expColor = 'rgba(0,0,216,0.5)';
            var actColor = 'rgba(0,0,216,0.8)';
            if (data4[i]["late"]==="Past Due") {
                expColor = "rgba(216,0,0,0.5)";
                actColor = "rgba(216,0,0,0.8)";
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
});
