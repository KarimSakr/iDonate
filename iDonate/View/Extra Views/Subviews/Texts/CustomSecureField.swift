//
//  customSecureField.swift
//  iDonate
//
//  Created by i-magineworks on 20/02/2023.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var text:String
    @State var placeholder:String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
            .cornerRadius(15)
            .padding()
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: "Secured Field")
            .previewLayout(.sizeThatFits)
    }
}
