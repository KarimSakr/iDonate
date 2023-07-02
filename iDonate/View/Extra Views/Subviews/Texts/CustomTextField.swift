//
//  customTextField.swift
//  iDonate
//
//  Created by i-magineworks on 17/02/2023.
//

import SwiftUI

struct CustomTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var text:String
    @State var placeholder:String
    
    
    var body: some View {
        
        TextField(placeholder,text: $text)
            .padding()
            .background(colorScheme == .dark ? Color(.gray).opacity(0.25) : Color(.black).opacity(0.05))
            .cornerRadius(15)
            .padding()
            .disableAutocorrection(true)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "Text Field")
            .previewLayout(.sizeThatFits)
    }
}
