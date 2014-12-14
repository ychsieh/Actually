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