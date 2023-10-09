package covid_dashboard
import grails.converters.JSON

class CovidDataController {

    def covidDataService

    def index() {
        render covidDataService.getAllData() as JSON
    }

    def show(String state) {
        def data = covidDataService.getDataByState(state)
        if (!data) {
            render status: 404, text: "No data found for state: $state"
            return
        }
        render data as JSON
    }
}
