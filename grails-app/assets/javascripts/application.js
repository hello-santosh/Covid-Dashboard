// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-3.5.1.min
//= require popper.min
//= require bootstrap
//= require_self

function showBoth() {
    $('#covidTable').show()
    $('#myChart').show()
    $('#exportTable').show()
}
function showTable() {
    $('#covidTable').show()
    $('#myChart').hide()
    $('#exportTable').show()
}
function showGraph() {
    $('#covidTable').hide()
    $('#myChart').show()
    $('#exportTable').hide()
}
function nullChecker (cell)  {
    return cell.getValue() === null || cell.getValue() === undefined ? "--" : cell.getValue();
};