$(function () {

    Highcharts.data({
        csv: document.getElementById('tsv').innerHTML,
        itemDelimiter: '\t',
        parsed: function (columns) {

            var brands = {},
                brandsData = [],
                brandsData2 = [],
                versions = {},
                versions2 = {},
                drilldownSeries = [],
                drilldownSeries2 = [];

            // Parse percentage strings
            columns[1] = $.map(columns[1], function (value) {
                if (value.indexOf('%') === value.length - 1) {
                    value = parseFloat(value);
                }
                return value;
            });

            $.each(columns[0], function (i, name) {
                var brand,
                    version;

                if (i > 0) {

                    // Remove special edition notes
                    name = name.split(' -')[0];

                    // Split into brand and version
                    version = name.match(/([0-9]+[\.0-9x]*)/);
                    if (version) {
                        version = version[0];
                    }
                    brand = name.replace(version, '');

                    // Create the main data
                    if (!brands[brand]) {
                        brands[brand] = columns[1][i];
                    } else {
                        brands[brand] += columns[1][i];
                    }

                    // Create the version data
                    if (version !== null) {
                        if (!versions[brand]) {
                            versions[brand] = [];
                        }
                        versions[brand].push(['task' + version, columns[1][i]]);
                        //versions2[brand].push(['v' + version, columns[1][i]]);
                    }
                }

            });
            
            $.each(brands, function (name, y) {
                brandsData.push({
                    name: name,
                    y: y,
                    drilldown: versions[name] ? name : null
                });
                
                brandsData2.push({
                    name: name,
                    y: 30,
                    drilldown: versions[name] ? name : null
                });
            });
            $.each(versions, function (key, value) {
                drilldownSeries.push({
                    name: key,
                    id: key,
                    data: value
                });
                
                
                
            });

            // Create the chart
            $('#overview').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Project progress for Project1'
                },
                subtitle: {
                    text: 'Click the columns to view the progress for tasks.'
                },
                xAxis: {
                    type: 'category'
                },
                yAxis: {
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
                    name: 'Project1: Expected',
                    colorByPoint: true,
                    data: brandsData,
                },
                {
                    name: 'Project1: Actual',
                    colorByPoint: true,
                    data: brandsData2,
                }],
                drilldown: {
                    series: drilldownSeries
                    /*series: [{
                        id: 'expected',
                        data: drilldownSeries
                    },{
                        id: 'actual',
                        data: drilldownSeries2
                    }]*/
                }
            });
        }
    });
});


/*$(function () {

    $('#overview').highcharts({

        chart: {
            polar: true
        },

        title: {
            text: 'Project Overview'
        },

        pane: {
            startAngle: 0,
            endAngle: 360
        },

        xAxis: {
            tickInterval: 72,
            min: 0,
            max: 360,
            labels:{ //['section 1','section 2','section 3','section 4','section 5']
                //align: 'center',
                formatter: function () {
                    return 'section' + (this.value/72 + 1);
                }
            }
        },

        yAxis: {
            min: 0
        },

        plotOptions: {
            series: {
                pointStart: 0,
                pointInterval: 72
            },
            column: {
                pointPadding: 0,
                groupPadding: 0
            }
        },

        series: [{
            type: 'column',
            name: 'Expected Progress',
            data: [80, 70, 60, 50, 40]
        }, {
            type: 'column',
            name: 'Actual Progress',
            data: [50, 80, 40, 50, 30]
        }]
    });
});*/

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