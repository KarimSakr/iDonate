//
//  CustomLogOutButton.swift
//  iDonate
//
//  Created by i-magineworks on 26/03/2023.
//

import SwiftUI
import FirebaseAuth

struct CustomLogOutButton: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    private let persistence = Persistence()
    var body: some View {
        Button(action: {
             do {
                try Auth.auth().signOut()
                 
                 persistence.deleteUserData()
                  
              } catch let signOutError as NSError {
                  Log.e("Error signing out: \(signOutError)")
              }
            presentationMode.wrappedValue.dismiss()
        }) {
            
            Text("Log Out")
                .foregroundColor(.appLightRed)
                .underline()
                .bold()
        }
    }
}

struct CustomLogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomLogOutButton()
    }
}
