//
//  VaccineView.swift
//  VaccineView
//
//  Created by cole cabral on 2021-09-14.
//

import SwiftUI

struct VaccineView: View {
    @ObservedObject var data: VaccineData
    var status: String
    var vaccineCode: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 3) {
                Text(Image(systemName: "cross.vial.fill"))
                    .font(.footnote)
                    .foregroundColor(status == "completed" && data.records.count > 1 ? Color.green : status == "completed" && data.records.count < 2 ? Color.blue : Color.red)
                Text(vaccineCode)
            }
            HStack(spacing: 3) {
                Text(Image(systemName: status == "completed" ? "checkmark.seal.fill" : "xmark.seal.fill"))
                    .foregroundColor(Color.secondary)
                    .font(.caption)
                Text(status.capitalized)
                    .foregroundColor(Color.secondary)
                    .font(.subheadline)
                
            }
        }
    }
}

struct VaccineView_Previews: PreviewProvider {
    static var previews: some View {
        VaccineView(data: VaccineData(), status: "", vaccineCode: "")
    }
}
