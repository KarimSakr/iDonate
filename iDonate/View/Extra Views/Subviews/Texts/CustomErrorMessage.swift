//
//  CustomErrorMessage.swift
//  iDonate
//
//  Created by i-magineworks on 16/04/2023.
//

import SwiftUI

struct CustomErrorMessage: View {
    @Binding var errorMessage:String
    var body: some View {
        HStack{
            Spacer()
            Text(errorMessage)
                .foregroundColor(.appRed)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct CustomErrorMessage_Previews: PreviewProvider {
    static var previews: some View {
        CustomErrorMessage(errorMessage: .constant("Error message here!"))
            .previewLayout(.sizeThatFits)
    }
}
