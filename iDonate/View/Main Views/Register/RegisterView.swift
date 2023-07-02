//
//  RegisterView.swift
//  iDonate
//
//  Created by i-magineworks on 20/02/2023.
//

import SwiftUI

struct RegisterView: View {
    
    //MARK: - PresentationMode
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    //MARK: - Loading and errors
    @State private var isLoading = false
    @State private var errorMessage = ""
    
    //MARK: - Fields to be filled
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var reEnterPassword:String = ""
    @State private var name:String = ""
    @State private var phoneNumber:String = ""
    @State private var countryCode:Country = .lebanon
    @State private var bloodType:BloodType = .chooseBloodType
    
    @Binding var isNewAccountCreated: Bool
    
    @FocusState private var focus:Bool
    
    //MARK: - ViewModel
    private let viewModel = RegisterViewModel()
    
    var body: some View {
        
        ZStack{
            Group{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.appRed)
                
                Circle()
                    .scale(2.15)
                    .foregroundColor(.appBackgroundColor.opacity(0.15))
                Circle()
                    .scale(1.85)
                    .foregroundColor(.appBackgroundColor)
                
            }
            .onTapGesture {
                focus = false
            }
            
            if isLoading{
                ProgressView("Patience, friend...")
                    .tint(.appLightRed)
            }
            else{
                ScrollView(showsIndicators: false){
                    VStack(alignment: .center){

                        CustomTextField(text: $email, placeholder: "email@example.com")
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                            .keyboardType(.emailAddress)
                            .focused($focus)
                            .textInputAutocapitalization(.never)
                        
                        CustomTextField(text: $name, placeholder: "Full name")
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                            //.keyboardType(.namePhonePad)
                            .focused($focus)
                            .textInputAutocapitalization(.words)
                        
                        
                        CustomSecureField(text: $password, placeholder: "Enter password")
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                            .focused($focus)
                        
                        
                        CustomSecureField(text: $reEnterPassword, placeholder: "Re-enter password")
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                            .focused($focus)
                        
                        CustomPhoneTextField(text: $phoneNumber, placeholder: "Phone Number", country: $countryCode)
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.8)
                            .focused($focus)
                        
                        CustomBloodTypePicker(selectedBloodType: $bloodType)
                        
                        CustomRedActionButton(action: {
                            
                            self.isLoading = true
                            
                            viewModel.registerButtonPressed(email: email, password: password, reEnterPassword: reEnterPassword, name: name, phoneNumber: phoneNumber, countryCode: countryCode, bloodType: bloodType){ error in
                                
                                if let error = error{
                                    
                                    errorMessage = error.errorDescription
                                } else {
                                    
                                    isNewAccountCreated = true
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                
                                self.isLoading = false
                            }
                        }, buttonTitle: "Register")
                        
                        CustomErrorMessage(errorMessage: $errorMessage)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isNewAccountCreated: .constant(false))
    }
}
