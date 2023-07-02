//
//  EditProfileView.swift
//  iDonate
//
//  Created by i-magineworks on 11/04/2023.
//

import SwiftUI

struct EditProfileView: View {
    
    //MARK: - Presentation Mode
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    //MARK: - ViewModel
    private let viewModel = EditProfileViewModel()
    
    //MARK: - Fields to be filled
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var countryCode:Country = .lebanon
    @State private var bloodType: BloodType = .chooseBloodType
    
    //MARK: - Error message and loading
    @State private var errorMessage = ""
    @State private var isLoading = false
    
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
            
            VStack(alignment: .center){
                if isLoading{
                    ProgressView("Applying Changes")
                        .tint(.appRed)
                }
                else {
                    CustomTitleText(titleText: "Edit Profile")
                    
                    
                    CustomTextField(text: $name, placeholder: "Full name")
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                        .keyboardType(.namePhonePad)
                        .focused($focus)
                    
                    
                    CustomPhoneTextField(text: $phoneNumber, placeholder: "Phone Number", country: $countryCode)
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.8)
                        .focused($focus)
                        .padding(.horizontal)
                    
                    
                    CustomBloodTypePicker(selectedBloodType: $bloodType)
                    
                    CustomErrorMessage(errorMessage: $errorMessage)
                    
                    CustomRedActionButton(action: {
                        if !isLoading{
                            
                            isLoading = true
                            viewModel.updateProfile(name:name, countryCode:countryCode, bloodType:bloodType, phoneNumber: phoneNumber){ error in
                                if let error = error {
                                    
                                    errorMessage = error.errorDescription
                                } else {
                                    isLoading = false
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }, buttonTitle: "Update")
                    
                    HStack{
                        Spacer()
                        NavigationLink {
                            ConfirmAccountView()
                        } label: {
                            Text("Change Password")
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
            }
            .onAppear{
                let user = viewModel.fetchUser()
                
                let components = user.phoneNumber?.components(separatedBy: " ")
                let phoneNumberWithoutCode = components?.last
                
                name = user.name ?? ""
                phoneNumber = phoneNumberWithoutCode ?? ""
                countryCode = user.countryCode ?? .lebanon
                bloodType = user.bloodType ?? .chooseBloodType
            }
            .frame(width: Constants.ScreenSize.screenSize.width)
            .frame(minHeight: Constants.ScreenSize.screenSize.height)
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
