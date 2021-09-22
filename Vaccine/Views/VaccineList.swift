//
//  VaccineList.swift
//  VaccineList
//
//  Created by cole cabral on 2021-09-14.
//

import SwiftUI

struct VaccineList: View {
    @ObservedObject var data: VaccineData
    var body: some View {
        NavigationView {
            List(data.records, id: \.self){ vaccine in
                Section(header: Text(vaccine.occurrence.fhirdate().description).font(.headline).fontWeight(.bold).foregroundColor(Color.primary)) {
                    VaccineView(data: data, status: vaccine.status.value?.rawValue ?? "", vaccineCode: vaccine.vaccineCode.coding?.last?.code?.value?.string.vaccine().capitalized ?? "")
                }
            }
            .refreshable {
                data.immunizations()
            }
            .navigationBarTitle(data.records.count > 1 ? "Vaccinated" : data.records.count > 0 ? "Partially Vaccinated" : "", displayMode: .inline)
        }
        .onAppear(perform: data.authorization)
        .onChange(of: data.authorized, perform: {_ in
            data.immunizations()
        })
    }
}

struct VaccineList_Previews: PreviewProvider {
    static var previews: some View {
        VaccineList(data: VaccineData())
    }
}
