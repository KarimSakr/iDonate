//
//  NeedBloodView.swift
//  iDonate
//
//  Created by i-magineworks on 21/02/2023.
//

import SwiftUI

struct DonationNeededView: View {
    
    //MARK: - ViewModel
    private let viewModel = DonationNeeedViewModel()
    
    
    //MARK: - Loading
    @State private var isLoading = false
    
    
    //MARK: - Fields to fill
    @State private var name                        = ""
    @State private var phoneNumber                 = ""
    @State private var optionalPhoneNumber         = ""
    @State private var countryCode:Country         = .lebanon
    @State private var optionalCountryCode:Country = .lebanon
    @State private var unitsNeeded                 = 1
    @State private var notes                       = ""
    @State private var location                    = "Choose a location"
    @State private var bloodType: BloodType        = .chooseBloodType
    @State private var donationType: DonationType  = .chooseDonationType
    @State private var showHospitals               = false
    @State private var showToastMessage            = false
    
    @FocusState private var focus:Bool
    
    //MARK: - Error message
    @State private var errorMessage = ""
    
    var body: some View {
        //MARK: - main view
        ZStack{
            
            VStack(alignment: .center){
                ScrollView(showsIndicators: false) {
                    
                    CustomTextField(text: $name, placeholder: "Full name")
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.85)
                        .focused($focus)
                    
                    
                    CustomPhoneTextField(text: $phoneNumber, placeholder: "Phone Number", country: $countryCode)
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.8)
                        .focused($focus)
                    
                    CustomPhoneTextField(text: $optionalPhoneNumber, placeholder: "Optional Phone Number", country: $optionalCountryCode)
                        .frame(width: Constants.ScreenSize.screenSize.width * 0.8)
                        .focused($focus)
                    
                    HStack{
                        Button {
                            showHospitals = true
                            
                        } label: {
                            Text(location)
                        }
                    }
                    
                    CustomBloodTypePicker(selectedBloodType: $bloodType)
                    
                    CustomDonationTypePicker(selectedType: $donationType)
                    
                    HStack{
                        Stepper("Units Needed: \(unitsNeeded)", value: $unitsNeeded, in: 1 ... 5)
                            .padding(.horizontal)
                    }
                    
                    Text("Additional Notes:")
                    Rectangle()
                        .foregroundColor(.blue)
                        .overlay {
                            TextEditor(text: $notes)
                                .focused($focus)
                        }
                        .border(.gray, width: 1)
                        .frame(height: 110)
                    
                    Group{
                        HStack{
                            Spacer()
                            Text(errorMessage)
                                .foregroundColor(.appRed)
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            Button {
                                let user = viewModel.autocompleteButtonPressed()
                                
                                let components = user.phoneNumber?.components(separatedBy: " ")
                                let phoneNumberWithoutCode = components?.last?.replacingOccurrences(of: " ", with: "")
                                
                                name = user.name ?? ""
                                bloodType = user.bloodType ?? .chooseBloodType
                                countryCode = user.countryCode ?? .lebanon
                                phoneNumber = phoneNumberWithoutCode ?? ""
                            } label: {
                                Text("I need blood")
                                    .foregroundColor(.gray)
                                    .underline()
                            }
                            Spacer()
                        }
                        
                        CustomRedActionButton(action: {
                            if !isLoading{
                                errorMessage = ""
                                isLoading = true
                                let currentDate = Date().timeIntervalSince1970
                                
                                let donation = Donation(name: name, location: location, bloodType: bloodType, phoneNumber: phoneNumber, countryCode: countryCode, optionalPhoneNumber: optionalPhoneNumber, optionalCountryCode: optionalCountryCode, notes: notes, donationType: donationType, units: unitsNeeded, datePosted: currentDate, donated: false, email: viewModel.getEmail(), reports: [])
                                
                                viewModel.postButtonPressed(donation: donation){ error in
                                    
                                    if let error = error{
                                        
                                        errorMessage = error.errorDescription
                                        
                                    } else {
                                        name = ""
                                        phoneNumber = ""
                                        optionalPhoneNumber = ""
                                        countryCode = .lebanon
                                        optionalCountryCode = .lebanon
                                        unitsNeeded = 1
                                        notes = ""
                                        location  = Constants.DefaultValues.location
                                        bloodType = .chooseBloodType
                                        donationType = .chooseDonationType
                                        showToastMessage = true
                                    }
                                    isLoading = false
                                }
                            }
                        }, buttonTitle: "Post")
                        
                        .toast(isShowing: $showToastMessage, text: "Donation posted!")
                    }
                    //MARK: - Popover View
                    .sheet(isPresented: $showHospitals){
                        ChooseLocationView(chosenHospital: $location)
                    }
                    
                
                }
            }
            .padding(.horizontal)
            if isLoading{
                
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.appBackgroundColor)
                    .opacity(0.7)
                
                ProgressView("Publishing post...")
                    .tint(.appRed)
            }
        }
    }
}

struct DonationNeededView_Previews: PreviewProvider {
    static var previews: some View {
        DonationNeededView()
    }
}
