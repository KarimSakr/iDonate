//
//  ContentView.swift
//  iDonate
//
//  Created by i-magineworks on 17/02/2023.
//

import SwiftUI

struct LoginView: View {
    //MARK: - ViewModel
    private let viewModel = LoginViewModel()
    
    
    //MARK: - Fields to be filled
    @State var email:String = ""
    @State var password:String = ""
    
    
    //MARK: - Progress Tracking attributes.
    @State private var isLoading = false
    @State private var errorMessage = ""
    @State private var isUserSignedIn = false
    @State private var isUserVerified = false
    @State private var isNewAccountCreated = false
    
    @FocusState private var focus:Bool
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Group{
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(.appRed)
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.appBackgroundColor).opacity(0.15)
                    Circle()
                        .scale(1.35)
                        .foregroundColor(.appBackgroundColor)
                }
                .onTapGesture {
                    focus = false
                }
                
                if isLoading{
                    ProgressView("This will take a few seconds...")
                        .tint(.appLightRed)
                }
                else{
                    
                    VStack(alignment: .center){
                        Spacer()
                        
                        CustomTitleText(titleText: "Login")
                        
                        CustomTextField(text: $email, placeholder: "Email")
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                            .keyboardType(.emailAddress)
                            .focused($focus)
                            .textInputAutocapitalization(.never)
                        
                        
                        
                        CustomSecureField(text: $password, placeholder: "Password")
                            .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                            .focused($focus)
                        
                        
                        HStack{
                            Spacer()
                            NavigationLink {
                                ResetPasswordView()
                            } label: {
                                Text("Forgot password?")
                                    .underline()
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(1)
                        
                        CustomErrorMessage(errorMessage: $errorMessage)
                        
                        CustomRedActionButton(action: {
                            isLoading = true
                            viewModel.loginPressed(email: email, password: password) { error in
                                
                                if let error = error{
                                    errorMessage = error.errorDescription
                                    if error == .emailNotVerified{
                                        isUserVerified = true
                                    }
                                } else {
                                    isUserSignedIn = true
                                    errorMessage = ""
                                }
                                
                                isLoading = false
                            }
                        }, buttonTitle: "Login")
                        
                        HStack{
                            Spacer()
                            Text("Not registered yet?")
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            NavigationLink(destination: RegisterView(isNewAccountCreated: $isNewAccountCreated)) {
                                
                                Text("Register")
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 150)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .frame(width: Constants.ScreenSize.screenSize.width)
                    .frame(minHeight: Constants.ScreenSize.screenSize.height)
                    
                    .toast(isShowing: $isNewAccountCreated, text: "Verfication email sent!")
                    
                    
                    .navigationDestination(isPresented: $isUserSignedIn) {
                        ContentView()
                        
                    }
                    .navigationDestination(isPresented: $isUserVerified){
                        VerifyEmailView()
                        
                    }
                }
            }
            .onAppear{
                isUserSignedIn = viewModel.isUserSignedIn()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
