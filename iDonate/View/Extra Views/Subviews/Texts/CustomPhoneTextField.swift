//
//  CustomPhoneTextField.swift
//  iDonate
//
//  Created by i-magineworks on 05/06/2023.
//

import SwiftUI

struct CustomPhoneTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var text:String
    @State var placeholder:String
    @Binding var country:Country
    
    
    var body: some View {
        Rectangle()
            .foregroundColor(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
            .overlay {
                HStack{
                    CustomCountryPicker(selectedCountry: $country)
                    Text("|")
                    TextField(placeholder,text: $text)
                        .padding()
                        .disableAutocorrection(true)
                        .keyboardType(.phonePad)
                }
            }
            .cornerRadius(15)
            .frame(height: 50)
    }
}

struct CustomPhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomPhoneTextField(text: .constant(""), placeholder: "", country: .constant(.lebanon))
            .previewLayout(.sizeThatFits)
    }
}
