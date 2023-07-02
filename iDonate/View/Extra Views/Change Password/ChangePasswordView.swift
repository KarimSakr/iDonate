//
//  ChangePasswordView.swift
//  iDonate
//
//  Created by i-magineworks on 14/04/2023.
//

import SwiftUI

struct ChangePasswordView: View {
    
    //MARK: - PresentaionMode
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    //MARK: - ViewModel
    private let viewModel = ChangePasswordViewModel()
    
    //MARK: - Fields to be filled
    @State private var newPass = ""
    @State private var reEnterPass = ""
    
    //MARK: - Error message and loading
    @State private var errorMessage = ""
    @State private var isLoading = false
    
    @FocusState private var focus:Bool
    
    var body: some View {
        
        ZStack{
            Group {
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
            if isLoading {
                ProgressView("Applying Changes...")
                    .tint(.appRed)
            } else {
                
                VStack(alignment: .center){
                    
                    CustomTitleText(titleText: "Change password")
                    
                    
                    CustomSecureField(text: $newPass, placeholder: "New password")
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                        .focused($focus)
                    
                    CustomSecureField(text: $reEnterPass, placeholder: "Password")
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                        .focused($focus)
                    
                    
                    CustomErrorMessage(errorMessage: $errorMessage)
                    
                    CustomRedActionButton(action: {
                        isLoading = true
                        viewModel.changePasswordPressed(newPassword: newPass, reEnterPassword: reEnterPass) { error in
                            if let error = error {
                                errorMessage = error.errorDescription
                            } else {
                                newPass = ""
                                reEnterPass = ""
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            isLoading = false
                        }
                    }, buttonTitle: "Change password")
                }
                .frame(width: Constants.ScreenSize.screenSize.width)
                .frame(minHeight: Constants.ScreenSize.screenSize.height)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
