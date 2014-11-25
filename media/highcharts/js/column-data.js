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
