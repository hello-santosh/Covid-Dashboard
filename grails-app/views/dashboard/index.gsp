<%@ page contentType="text/html;charset=UTF-8" %>
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://unpkg.com/tabulator-tables@5.0.7/dist/css/tabulator.min.css" rel="stylesheet">
<script type="text/javascript" src="https://unpkg.com/tabulator-tables@5.0.7/dist/js/tabulator.min.js"></script>
<!doctype html>
<html>
<head>
    <title>Covid Dashboard</title>
</head>

<body>
<h1 class="dashboardTitle">Covid Data Dashboard</h1>
<button id="showBoth" class="customButton" autofocus onclick="showBoth()">Table/Graph</button>
<button id="showTable" class="customButton" onclick="showTable()">Table Only</button>
<button id="showGraph" class="customButton" onclick="showGraph()">Graph Only</button>
<button id="exportTable" class="customButton" onclick="exportTable()">Export</button>

<div id="covidTable"></div>
<canvas id="myChart" class="chartCanvas"></canvas>

<script>
    // Get required Data to be passed in Tabulator and Chart
    const states = []
    const positiveCases = []
    const recoveries = []
    const deaths = []
    const tableJsonData = []
    const tableData = '${jsonCovidData}'.replace(/&quot;/g, '"')

    <g:each in="${covidDataList}" var="data">
    states.push("${data.state}");
    positiveCases.push("${data.positive}");
    recoveries.push("${data.recovered}");
    deaths.push("${data.death}");
    </g:each>

    // Creating the Table
    const table = new Tabulator("#covidTable", {
        layout: "fitColumns",
        data: JSON.parse(tableData),
        columns: [
            {title: "State", field: "state", formatter: nullChecker},
            {title: "Total Positive", field: "positive", formatter: nullChecker},
            {title: "Total Negative", field: "negative", formatter: nullChecker},
            {title: "Total Recovered", field: "recovered", formatter: nullChecker},
            {title: "Total Deaths", field: "death", formatter: nullChecker}
        ],
    });

    // Export Table
    const exportTable = () => {
        table.download("csv", "data.csv");
    };

    // Creating the chart
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: states,
            datasets: [{
                label: 'Positive Cases',
                data: positiveCases,
                backgroundColor: 'rgba(252,128,154,0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }, {
                label: 'Recoveries',
                data: recoveries,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }, {
                label: 'Deaths',
                data: deaths,
                backgroundColor: 'rgba(255, 206, 86, 0.2)',
                borderColor: 'rgba(255, 206, 86, 1)',
                borderWidth: 1
            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: 'Covid-19 Cases by State',
                }
            },
            scales: {
                y: {
                    title: {
                        display: true,
                        text: 'Number of Positive Cases'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'States'
                    }
                }
            }
        }
    });
</script>
</body>
</html>

