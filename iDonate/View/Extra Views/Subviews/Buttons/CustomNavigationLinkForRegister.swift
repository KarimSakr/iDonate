//
//  CustomNavigationLinkForRegister.swift
//  iDonate
//
//  Created by i-magineworks on 06/03/2023.
//

import SwiftUI

struct CustomNavigationLinkForRegister: View {
    var body: some View {
        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
            
            Spacer()
            
            Text("Register")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
        }
        .background(Color.appLightRed)
        .cornerRadius(30)
        .shadow(radius: 30)
        .padding()
    }
}


struct CustomNavigationLinkForRegister_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationLinkForRegister()
    }
}
