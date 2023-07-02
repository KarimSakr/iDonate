//
//  NoWifiView.swift
//  iDonate
//
//  Created by i-magineworks on 25/04/2023.
//

import SwiftUI

struct NoWifiView: View {
    var body: some View {
        ZStack{
            
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.appRed)
            Circle()
                .scale(1.7)
                .foregroundColor(.appBackgroundColor).opacity(0.15)
            Circle()
                .scale(1.35)
                .foregroundColor(.appBackgroundColor)
            
            VStack{
                Image(systemName: "wifi.slash")
                    .foregroundColor(.appLightRed)
                    .font(.system(size: 50))
                    .padding()
                Text("Connection interrupted!")
                    .multilineTextAlignment(.center)
                    .frame(width: Constants.ScreenSize.screenSize.width * 0.7)
                
                ProgressView("Awaiting connection...")
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct NoWifiView_Previews: PreviewProvider {
    static var previews: some View {
        NoWifiView()
    }
}
