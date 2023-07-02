//
//  CustomRedActionButtonView.swift
//  iDonate
//
//  Created by i-magineworks on 16/04/2023.
//

import SwiftUI

struct CustomRedActionButton: View {
    
    @State var action:() -> Void
    @State var buttonTitle:String
    
    var body: some View {
        HStack{
            
            Spacer()
            
            Button(action: action) {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: Constants.ScreenSize.screenSize.width * 0.6)
            }
            .background(Color.appLightRed)
            .cornerRadius(30)
            .shadow(radius: 30)
            .padding()
            
            Spacer()
        }
    }
}


struct CustomRedActionButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomRedActionButton(action: {
            // code here
        }, buttonTitle: "Button Title")
            .previewLayout(.sizeThatFits)
    }
}

