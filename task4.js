!async function(){
  data = await fetch("./data/task4.json")
     .then((response) => response.json())
     .then(data => {
         return data;
     })
     .catch(error => {
         console.error(error);
     })
     
   
 
 
 

Highcharts.chart('container', {
    chart: {
      type: 'column'
    },
    title: {
      text: 'mathes played by each team every season'
    },
    subtitle: {
      text: 'Source: WorldClimate.com'
    },
    xAxis: {
      categories: [
        "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"
      ],
      crosshair: true
    },
    yAxis: {
      min: 0,
      title: {
        text: 'Mathes'
      }
    },
    tooltip: {
      headerFormat: '<span style="font-size:10px"></span><table>',
      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
        '<td style="padding:0"><b>{point.y:1f} mm</b></td></tr>',
      footerFormat: '</table>',
      shared: true,
      useHTML: true
    },
    plotOptions: {
      column: {
        pointPadding: 0.2,
        borderWidth: 0
      }
    },
    series:data
  });
}();