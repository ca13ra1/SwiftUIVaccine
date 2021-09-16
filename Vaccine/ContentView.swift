//
//  ContentView.swift
//  Vaccine
//
//  Created by cole cabral on 2021-09-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = VaccineData()
    var body: some View {
        VaccineList(data: data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
