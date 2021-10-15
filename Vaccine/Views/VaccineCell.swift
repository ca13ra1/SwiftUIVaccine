//
//  VaccineCell.swift
//  Vaccine
//
//  Created by cole cabral on 2021-10-15.
//

import SwiftUI

struct VaccineCell: View {
    @ObservedObject var data: VaccineData
    var status: String
    var vaccineCode: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 3) {
                Image(systemName: "cross.vial")
                    .renderingMode(.original)
                    .font(.headline)
                Text(vaccineCode)
                    .lineLimit(1)
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

struct VaccineCell_Previews: PreviewProvider {
    static var previews: some View {
        VaccineCell(data: VaccineData(), status: "", vaccineCode: "")
    }
}
