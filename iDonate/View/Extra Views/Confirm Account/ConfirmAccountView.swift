//
//  ConfirmAccountView.swift
//  iDonate
//
//  Created by i-magineworks on 15/04/2023.
//

import SwiftUI

struct ConfirmAccountView: View {
    
    //MARK: - ViewModel
    private let viewModel = ConfirmAccountViewModel()
    
    
    //MARK: - Fields to fill
    @State private var email = ""
    @State private var password = ""
    
    
    //MARK: - Progress tracking attributes
    @State private var errorMessage = ""
    @State private var isLoading = false
    @State private var isUserConfirmed = false
    
    @FocusState private var focus:Bool
    
    var body: some View {
        ZStack{
            
            Group{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.appRed)
                
                Circle()
                    .scale(1.9)
                    .foregroundColor(.appBackgroundColor.opacity(0.15))
                Circle()
                    .scale(1.6)
                    .foregroundColor(.appBackgroundColor)
            }
            .onTapGesture {
                focus = false
            }
            
            if isLoading{
                ProgressView("One moment...")
                    .tint(.appRed)
            } else {
                
                VStack(alignment: .center){
                    
                    CustomTitleText(titleText: "User confirmation")
                    
                    CustomTextField(text: $email, placeholder: "Email")
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                        .keyboardType(.emailAddress)
                        .focused($focus)
                        .textInputAutocapitalization(.never)
                    
                    
                    
                    CustomSecureField(text: $password, placeholder: "Current password")
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                        .focused($focus)
                    
                    
                    CustomErrorMessage(errorMessage: $errorMessage)
                    
                    CustomRedActionButton(action: {
                        isLoading = true
                        viewModel.confirmUser(email: email, password: password){ error in
                            
                            if let error = error {
                                errorMessage = error.errorDescription
                                
                            } else {
                                isUserConfirmed = true
                                errorMessage = ""
                            }
                            isLoading = false
                        }
                    }, buttonTitle: "Proceed")
                    
                    .navigationDestination(isPresented: $isUserConfirmed) {
                        ChangePasswordView()
                    }
                }
                .padding(30)
                .frame(width: Constants.ScreenSize.screenSize.width)
                .frame(minHeight: Constants.ScreenSize.screenSize.height)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct ConfirmAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmAccountView()
    }
}
