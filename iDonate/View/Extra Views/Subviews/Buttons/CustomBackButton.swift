//
//  CustomBackButton.swift
//  iDonate
//
//  Created by i-magineworks on 09/04/2023.
//

import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button {
            
           presentationMode.wrappedValue.dismiss()
            
        } label: {
            Text("Back")
                .foregroundColor(.white)
                .underline()
        }

    }
}

struct CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackButton()
    }
}
