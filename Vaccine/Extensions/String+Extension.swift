//
//  String+Extension.swift
//  String+Extension
//
//  Created by cole cabral on 2021-09-14.
//

import Foundation

//https://www.newswire.ca/news-releases/canadian-vaccine-catalogue-releases-critical-standardized-terminology-for-covid-19-vaccines-861079024.html
extension String {
    func vaccine() -> String {
        switch self {
        case "28581000087106":
            return "PFIZER-BIONTECH COVID-19"
        case "28571000087109":
            return "MODERNA COVID-19"
        case "28531000087107":
            return "Vaccine product against disease caused by Severe acute respiratory syndrome coronavirus 2 (medicinal product)"
        case "1119349007":
            return "Vaccine product containing only Severe acute respiratory syndrome coronavirus 2 messenger ribonucleic acid (medicinal product)"
        default:
            return ""
        }
    }
}
