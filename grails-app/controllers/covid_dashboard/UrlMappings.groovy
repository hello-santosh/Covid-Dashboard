package covid_dashboard

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "Dashboard", action: "index")
        "/data"(controller: "covidData", action: "index")  // a) List the data of all 10 states
        "/data/${state}"(controller: "covidData", action: "show")  // b) List the data by state name
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
