//
//  HomeView.swift
//  iDonate
//
//  Created by i-magineworks on 20/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - ViewModel
    private var viewModel = HomeViewModel()
    
    @State private var donations: [Donation] = []
    
    @State private var bloodTypeFilter: BloodType = .chooseBloodType
    
    @State private var isNotificationAccessNotGranted = false

    
    var filteredDonations: [Donation] {
        if bloodTypeFilter == .chooseBloodType {
            return donations
        } else {
            return donations.filter({ $0.bloodType == bloodTypeFilter })
        }
    }
    
    //MARK: - Loading
    @State private var isLoading = true
    
    
    var body: some View {
        
        if isLoading{
            
            ProgressView("Fetching Donations...")
                .tint(.appRed)
                .onAppear{
                    viewModel.fetchData(){ donations, error  in
                        
                        if error == nil {
                            
                            self.donations = donations
                            
                        }
                        isLoading = false
                    }
                }
        } else {
            
            if self.donations.isEmpty {
                NoDonationsView()
                    .onDisappear{
                        isLoading = true
                    }
            } else {
                VStack{
                    HStack{
                        Spacer()
                        CustomBloodTypePicker(selectedBloodType: $bloodTypeFilter)
                    }
                    List {
                        ForEach(filteredDonations) { donation in
                            NavigationLink(destination: DetailView(donation: donation)) {
                                HStack {
                                    CustomBloodImage(bloodTypeImage: viewModel.bloodTypeImage(bloodType: donation.bloodType!))
                                    VStack(alignment: .leading) {
                                        Text(donation.name!)
                                        Text(donation.location!)
                                            .foregroundColor(.gray)
                                        Text((donation.donationType?.rawValue)!)
                                            .foregroundColor(.red)
                                    }
                                    if donation.donated! {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.green)
                                            .font(.system(size: 30))
                                    }
                                }
                            }
                        }
                    }
                    .onAppear{
                        viewModel.requestNotificationAuthorization { granted, error in
                            if error != nil{
                                
                                if !granted {
                                    isNotificationAccessNotGranted = true
                                } else {
                                    viewModel.scheduleDidYouKnowNotification()
                                }
                            }
                        }
                    }
                    
                    .alert(isPresented: $isNotificationAccessNotGranted){
                        Alert(
                            title: Text("Enable Notifications by going to Settings > Notifications > iDonate and allow notifications."),
                            dismissButton: .default(Text("OK"))
                        )
                    }

                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
