//
//  CustomDonationTypePicker.swift
//  iDonate
//
//  Created by i-magineworks on 13/03/2023.
//

import SwiftUI

struct CustomDonationTypePicker: View {
    
    @Binding var selectedType: DonationType
    
    var body: some View {
        Picker("Donation Type", selection: $selectedType){
            ForEach(DonationType.allValues, id: \.self){ donationType in
                Text(donationType.rawValue).tag(donationType)
            }
        }
        .aspectRatio(contentMode: .fill)
    }
}

struct CustomDonationTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDonationTypePicker(selectedType: .constant(.chooseDonationType))
            .previewLayout(.sizeThatFits)
    }
}
