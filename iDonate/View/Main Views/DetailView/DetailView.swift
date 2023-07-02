//
//  DetailView.swift
//  iDonate
//
//  Created by i-magineworks on 12/03/2023.
//

import SwiftUI

struct DetailView: View {
    
    //MARK: - ViewModel
    private let viewModel = DetailViewModel()
    
    @State var donation: Donation
    
    @State private var isCopied           = false
    @State private var failedToCall       = false
    @State private var pressedNumber      = ""
    @State private var openReportView     = false
    @State private var isDonationReported = false
    
    var body: some View {
        
        //MARK: - Main View
        VStack{
            Group{
                HStack{
                    Image(viewModel.bloodTypeImage(bloodType: donation.bloodType!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                    
                    VStack(alignment: .leading){
                        
                        Text(donation.name!)
                            .font(.title)
                        Text(donation.location!)
                            .foregroundColor(.gray)
                        
                        Text("\(String(donation.units!)) \(viewModel.unitsNeededMessage(units: donation.units!))")
                            .foregroundColor(.appRed)
                    }
                    
                    if viewModel.getEmail() == donation.email {
                        
                        
                        Button {
                            donation.donated?.toggle()
                            viewModel.toggleIsChecked(donation: donation){ error in
                                
                                if error != nil{
                                    donation.donated?.toggle()
                                }
                            }
                        } label: {
                            if donation.donated! {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)
                                    .font(.system(size: 40))
                            } else {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 40))
                            }
                        }
                        
                    } else {
                        
                        if donation.donated! {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                                .font(.system(size: 40))
                        }
                    }
                    Spacer()
                }
            }
            
            Spacer()
            
            HStack{
                Text("Donation Type: ")
                Text(donation.donationType!.rawValue)
            }
            
            Spacer()
            
            Text("Notes")
            Text(donation.notes!)
            
            Spacer()
            
            if donation.optionalPhoneNumber != "" {
                HStack{
                    Menu("Contact Info") {
                        Button {
                            
                            viewModel.call(phoneNumber: donation.phoneNumber) { success in
                                
                                if success {
                                    
                                } else {
                                    failedToCall = true
                                }
                            }
                            pressedNumber = donation.phoneNumber ?? ""
                            
                        } label: {
                            Image(systemName: Constants.systemImage.phoneFill)
                            Text(donation.phoneNumber!)
                        }
                        Button {
                            
                            viewModel.call(phoneNumber: donation.optionalPhoneNumber) { success in
                                
                                if success {
                                    
                                } else {
                                    failedToCall = true
                                }
                            }
                            pressedNumber = donation.optionalPhoneNumber ?? ""
                            
                        } label: {
                            Image(systemName: Constants.systemImage.phoneFill)
                            Text(donation.optionalPhoneNumber!)
                        }
                    }
                }
            } else {
                HStack{
                    
                    Text("Phone:")
                    
                    Button {
                        
                        viewModel.call(phoneNumber: donation.phoneNumber) { success in
                            
                            if success {
                                
                            } else {
                                failedToCall = true
                            }
                        }
                        pressedNumber = donation.phoneNumber ?? ""
                        
                    } label: {
                        Image(systemName: Constants.systemImage.phoneFill)
                        Text(donation.phoneNumber!)
                    }
                }
            }
        }
        
        //MARK: - Popover View
        .sheet(isPresented: $openReportView){
            ReportView(donation: donation, isDonationReported: $isDonationReported)
        }
        
        //MARK: - Toast View
        .toast(isShowing: $isDonationReported, text: "Thank you for your feedback.")
        
        
        //MARK: - ToolBar
        .toolbar {
            
            Menu {
                Button {
                    openReportView = true
                } label: {
                    Text("Report")
                }

            } label: {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.appRed)
                    .font(.system(size: 20))
            }
        }
        
        //MARK: - Alert
        .alert("Failed to make the call", isPresented: $failedToCall) {
            
            Button(role: .destructive) {
                
                self.isCopied = true
                UIPasteboard.general.string = pressedNumber
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isCopied = false
                }
                
            } label: {
                Text("Copy Number")
            }
            
            Button(role: .cancel) {
                // dismiss message
            } label: {
                Text("Dismiss")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(donation: Donation(name: "Karim Sakr", location: "Hospital name", bloodType: .oPositive, phoneNumber: "654654", countryCode: .lebanon, optionalPhoneNumber: "654654", optionalCountryCode: .lebanon, notes: "Health", donationType: .wholeBloodDonation, units: 3, datePosted: 4334324.00, donated: true, email: "emailexample@gmail.com", reports: []))
    }
}
