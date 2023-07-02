//
//  CustomCountryPicker.swift
//  iDonate
//
//  Created by i-magineworks on 13/03/2023.
//

import SwiftUI

struct CustomCountryPicker: View {
    
    @Binding var selectedCountry: Country
    
    var body: some View {
        Picker("Country", selection: $selectedCountry){
            ForEach(Country.allValues, id: \.self){ country in
                Text(country.rawValue).tag(country)
            }
        }
        .aspectRatio(contentMode: .fill)
    }
}

struct CustomCountryPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomCountryPicker(selectedCountry: .constant(.lebanon))
            .previewLayout(.sizeThatFits)
    }
}
