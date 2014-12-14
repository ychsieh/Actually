//get progresses of different tasks for a specific developer
$.ajax({
    dataType: "json",
    url: "http://127.0.0.1:8000/get_developer_json"
}).done(callback);

function callback(data){
    console.log(data);
    var startAngle = 0;
    $('#morris-donut-chart1').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false,
            height: 400,
            spacingBottom: 0
        },
        title: {
            text: '<b style="font-size: 120%; font-weight: bold;">'+data.projectname+'</b><br>'+data.projectprogress+'%',
            align: 'center',
            verticalAlign: 'middle',
            style: {
                fontSize: '25px'
            },
            y: 0
        },
        credits: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        tooltip: {
            enabled: false
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: false,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    }
                },
                colors: ['#046a95'],
                startAngle: startAngle,
                endAngle: startAngle + data.projectprogress*0.01*360,
                center: ['50%', '50%']
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            innerSize: '70%',
            data: [
                ['Amazon:', 6],               
            ]
        }]
    });

    $('#morris-donut-chart2').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false,
            height: 400,
            spacingBottom: 0
        },
        title: {
            text: '<b style="font-size: 120%; font-weight: bold;">'+data.sectionname+'</b><br>'+data.sectionprogress+'%',
            align: 'center',
            verticalAlign: 'middle',
            style: {
                fontSize: '25px'
            },
            y: 0
        },
        credits: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        tooltip: {
            enabled: false
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: false,
                    distance: -40,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    }
                },
                colors: ['#058dc7'],
                startAngle: startAngle,
                endAngle: startAngle + data.sectionprogress*0.01*360,
                center: ['50%', '50%']
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            innerSize: '70%',
            data: [
                ['Amazon:', 6],               
            ]
        }]
    });

    for (var i = 0; i < data.tasks.length; i++) {
        var newId = "task" + i;
        //var newDiv = $( "<div></div>").attr("id",newId);
        $("<div></div>").attr("class","col-lg-3").attr("id", newId).appendTo("#taskCharts");
        $("#taskCharts div#" + newId).highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: 0,
                plotShadow: false,
                height: 220
            },
            title: {
                text: '<b style="font-size: 120%; font-weight: bold;">'+data.tasks[i].task+'</b><br>'+data.tasks[i].taskprogress+'%',
                align: 'center',
                verticalAlign: 'middle',
                style: {
                    fontSize: '25px'
                },
                y: 0
            },
            credits: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            tooltip: {
                enabled: false
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: false,
                        distance: -40,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    colors: ['rgb(105,180,50)'],
                    startAngle: startAngle,
                    endAngle: startAngle + data.tasks[i].taskprogress*0.01*360,
                    center: ['50%', '50%']
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                innerSize: '80%',
                data: [
                    ['Amazon:', 6],               
                ]
            }]
        });
    };
};
