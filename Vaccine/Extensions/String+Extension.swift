//
//  String+Extension.swift
//  String+Extension
//
//  Created by cole cabral on 2021-09-14.
//

import Foundation

//https://cvc.canimmunize.ca/en/explore#/tradenames
//https://www.canada.ca/en/health-canada/services/drugs-health-products/covid19-industry/drugs-vaccines-treatments/authorization/list-drugs.html
extension String {
    func vaccine() -> String {
        switch self {
        case "28581000087106":
            //(PFIZER-BIONTECH COVID-19)
            return "Comirnaty"
        case "28571000087109":
            //(MODERNA COVID-19)
            return "SPIKEVAX"
        case "28761000087108":
            //(ASTRAZENECA COVID-19 VACCINE
            return "Vaxzevria"
        case "28961000087105":
            return "COVISHIELD"
        case "28951000087107":
            return "JANSSEN COVID-19 VACCINE"
        case "29171000087106":
            return "NOVAVAX COVID-19 VACCINE"
        case "30151000087105":
            return "MEDICAGO COVID-19 VACCINE"
        case "31341000087103":
            return "Sputnik V COVID-19 vaccine"
        case "31301000087101":
            return "COVID-19 vaccine BIBP"
        case "31311000087104":
            return "CoronaVac COVID-19 vaccine"
        case "31431000087100":
            return "Convidecia COVID-19 vaccine"
        default:
            return ""
        }
    }
}
