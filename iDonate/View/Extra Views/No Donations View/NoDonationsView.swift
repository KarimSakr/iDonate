//
//  NoDonationsView.swift
//  iDonate
//
//  Created by i-magineworks on 30/06/2023.
//

import SwiftUI

struct NoDonationsView: View {
    
    var body: some View {
        
        VStack{
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.appLightRed)
                .font(.system(size: 50))
                .padding()
            
            Text("No Donations are needed at the moment. That's good, right?")
                .multilineTextAlignment(.center)
                .frame(width: Constants.ScreenSize.screenSize.width * 0.7)
        }
    }
}

struct NoDonationsView_Previews: PreviewProvider {
    static var previews: some View {
        NoDonationsView()
    }
}
