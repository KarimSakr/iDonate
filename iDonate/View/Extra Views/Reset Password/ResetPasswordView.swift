//
//  ResetPasswordView.swift
//  iDonate
//
//  Created by i-magineworks on 10/04/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
    //MARK: - Fields to be filled
    @State private var email = ""
    
    //MARK: - Progress tracking attributes
    @State private var message = ""
    @State private var isLoading = false
    
    //MARK: - ViewModel
    private let viewModel = ResetPasswordViewModel()
    
    @FocusState private var focus:Bool
    
    var body: some View {
        
        ZStack{
            Group {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.appRed)
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.appBackgroundColor.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.appBackgroundColor)
            }
            .onTapGesture {
                focus = false
            }
            
            if isLoading {
                ProgressView("One moment...")
            } else {
                
                VStack(alignment: .center){
                    CustomTitleText(titleText: "Reset password")
                    
                    CustomTextField(text: $email, placeholder: "Enter your email")
                        .focused($focus)
                    
                    CustomErrorMessage(errorMessage: $message)
                    
                    CustomRedActionButton(action: {
                        isLoading = true
                        viewModel.resetPassword(email: email) { error in
                            
                            if let error = error {
                                
                                message = error.errorDescription
                                
                            } else {
                                
                                message = "Kindly check your inbox and your spam."
                            }
                            isLoading = false
                        }
                    }, buttonTitle: "Rest Password")
                }
                .frame(width: Constants.ScreenSize.screenSize.width)
                .frame(minHeight: Constants.ScreenSize.screenSize.height)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton() )
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
