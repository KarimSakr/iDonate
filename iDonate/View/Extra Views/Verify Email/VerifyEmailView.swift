//
//  VerifyEmailView.swift
//  iDonate
//
//  Created by i-magineworks on 09/04/2023.
//

import SwiftUI
import FirebaseAuth

struct VerifyEmailView: View {
    
    //MARK: - Presentation Mode
    @Environment(\.presentationMode) private var presentationMode
    
    
    //MARK: - ViewModel
    private let viewModel = VerifyEmailViewModel()
    
    
    private let persistence = Persistence()
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.appRed)
            
            Circle()
                .scale(1.7)
                .foregroundColor(.appBackgroundColor.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.appBackgroundColor)
            
            VStack(){
                Image(systemName: Constants.systemImage.envelopeCircle)
                    .foregroundColor(.appLightRed)
                    .font(.system(size: 100))
                    .padding()
                
                Text(Constants.Messages.verifyEmailMessage)
                    .foregroundColor(.appRed)
                    .multilineTextAlignment(.center)
                
                Button {
                    viewModel.sendEmailVerificationAgain(){ _ in
                        do {
                           try Auth.auth().signOut()
                            
                            persistence.deleteUserData()
                             
                         } catch let signOutError as NSError {
                             Log.e("Error signing out: \(signOutError)")
                         }
                       presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Send verification again")
                        .foregroundColor(.gray)
                }
                .padding()

            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct VerifyEmailView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyEmailView()
    }
}
