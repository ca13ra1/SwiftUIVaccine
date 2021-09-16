//
//  Immunization.OccurrenceX+Extension.swift
//  Immunization.OccurrenceX+Extension
//
//  Created by cole cabral on 2021-09-14.
//

import Foundation
import ModelsR4

extension Immunization.OccurrenceX {
    func fhdirdate() -> String {
        var string = ""
        if case let .dateTime(value) = self {
            string = value.value?.description ?? ""
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = formatter.date(from: string) ?? Date()
            formatter.dateFormat = "MMM d, yyyy"
            string = formatter.string(from: formattedDate)
        }
        return string
    }
}
