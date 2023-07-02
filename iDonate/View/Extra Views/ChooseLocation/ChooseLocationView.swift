//
//  ChooseLocationView.swift
//  iDonate
//
//  Created by i-magineworks on 18/03/2023.
//

import SwiftUI

struct ChooseLocationView: View {
    
    //MARK: - PresentationMode
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    //MARK: - Search bar
    @State private var searchText = ""
    
    @Binding var chosenHospital: String
    
    var locations = Hospitals().locations
    
    var hospitals: [String] {
        // Make countries lowercased
        let lcHospitals = locations.map { $0.lowercased() }
        
        return searchText == "" ? lcHospitals : lcHospitals.filter { $0.contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(hospitals, id: \.self){ hospital in
                    Text(hospital.capitalized).tag(hospital)
                        .onTapGesture {
                            chosenHospital = hospital.capitalized
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Hospitals")
        }
    }
}

struct ChooseLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLocationView(chosenHospital: .constant(""))
    }
}
