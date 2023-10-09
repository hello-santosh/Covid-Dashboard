package covid_dashboard

import grails.converters.JSON

class DashboardController {

    def covidDataService

    def index() {
        def covidDataList = covidDataService.getAllData()
        [covidDataList: covidDataList, jsonCovidData: covidDataList as JSON]
    }
}
