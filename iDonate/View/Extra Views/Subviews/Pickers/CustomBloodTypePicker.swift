//
//  CustomBloodTypePicker.swift
//  iDonate
//
//  Created by i-magineworks on 13/03/2023.
//

import SwiftUI

struct CustomBloodTypePicker: View {
    @Binding var selectedBloodType: BloodType
    var body: some View {
        Picker("Blood Type", selection: $selectedBloodType) {
            ForEach(BloodType.allValues, id: \.self) { bloodType in
                Text(bloodType.rawValue).tag(bloodType)
            }
        }
        .aspectRatio(contentMode: .fill)
    }
}

struct CustomBloodTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomBloodTypePicker(selectedBloodType: .constant(.chooseBloodType))
            .previewLayout(.sizeThatFits)
    }
}
