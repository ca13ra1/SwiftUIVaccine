//
//  VaccineData.swift
//  VaccineData
//
//  Created by cole cabral on 2021-09-14.
//

import Foundation
import Combine
import HealthKit
import ModelsR4

class VaccineData: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let healthstore: HKHealthStore = HKHealthStore()
    @Published var authorized: Bool = false
    @Published var records: [Immunization] = []
    
    func immunizations() {
        guard let immunization = HKObjectType.clinicalType(forIdentifier: .immunizationRecord) else {
            fatalError("*** Unable to create the immunization type ***")
        }
        let immunizationQuery = HKSampleQuery(sampleType: immunization, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            guard let samples = samples else {
                print("*** An error occurred: \(error?.localizedDescription ?? "nil") ***")
                return
            }
            let immunizationrecords = samples as? [HKClinicalRecord]
            for i in immunizationrecords! {
                guard let fhirRecord = i.fhirResource else {
                    print("No FHIR record found!")
                    return
                }
                let data = fhirRecord.data
                let decoder = JSONDecoder()
                do {
                    let resource = try decoder.decode(Immunization.self, from: data)
                    DispatchQueue.main.async {
                        if self.records.contains(resource) {
                            return
                        }
                        self.records.append(resource)
                    }
                } catch {
                    print("Failed to instaimmunization ntiate Patient: \(error)")
                }
            }
        }
        healthstore.execute(immunizationQuery)
    }
    
    func authorization() {
        let type = HKObjectType.clinicalType(forIdentifier: .immunizationRecord)!
        healthstore.requestAuthorization(toShare: [], read: [type]) { (success, error) in
            guard success, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.authorized.toggle()
            }
        }
    }
}
