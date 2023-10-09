package covid_dashboard

import grails.gorm.transactions.Transactional

@Transactional
class CovidDataService {

    def getAllData() {
        return CovidData.list()
    }

    def getDataByState(String state) {
        return CovidData.findByState(state)
    }
}
