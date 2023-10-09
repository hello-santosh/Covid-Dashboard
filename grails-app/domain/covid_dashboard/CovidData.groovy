package covid_dashboard

class CovidData {

    Integer id
    Integer date
    String state
    Integer positive
    Integer probableCases
    Integer negative
    Integer pending
    String totalTestResultsSource
    Integer totalTestResults
    Integer hospitalizedCurrently
    Integer hospitalizedCumulative
    Integer inIcuCurrently
    Integer inIcuCumulative
    Integer onVentilatorCurrently
    Integer onVentilatorCumulative
    Integer recovered
    String lastUpdateEt
    String dateModified
    String checkTimeEt
    Integer death
    Integer hospitalized
    Integer hospitalizedDischarged
    String dateChecked
    Integer totalTestsViral
    Integer positiveTestsViral
    Integer negativeTestsViral
    Integer positiveCasesViral
    Integer deathConfirmed
    Integer deathProbable
    Integer totalTestEncountersViral
    Integer totalTestsPeopleViral
    Integer totalTestsAntibody
    Integer positiveTestsAntibody
    Integer negativeTestsAntibody
    Integer totalTestsPeopleAntibody
    Integer positiveTestsPeopleAntibody
    Integer negativeTestsPeopleAntibody
    Integer totalTestsPeopleAntigen
    Integer positiveTestsPeopleAntigen
    Integer totalTestsAntigen
    Integer positiveTestsAntigen
    String fips
    Integer positiveIncrease
    Integer negativeIncrease
    Integer total
    Integer totalTestResultsIncrease
    Integer posNeg
    String dataQualityGrade
    Integer deathIncrease
    Integer hospitalizedIncrease
    String hash
    Integer commercialScore
    Integer negativeRegularScore
    Integer negativeScore
    Integer positiveScore
    Integer score
    String grade

    static constraints = {
    }
}
