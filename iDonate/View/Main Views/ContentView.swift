//
//  HomeView.swift
//  iDonate
//
//  Created by i-magineworks on 20/02/2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    //MARK: - Presentation Mode
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var selectedTab = 0
    
    private let persistence = Persistence()
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: Constants.systemImage.houseCircle)
                }.tag(0)
            
            DonationNeededView()
                .tabItem {
                    Label("Donation Needed", systemImage:Constants.systemImage.dropCircleFill)
                }.tag(1)
            
        }
        .accentColor(selectedTab == 0 ? .red : .blue)
        .navigationBarBackButtonHidden(true)
        
               .navigationBarItems(leading:
                                    CustomLogOutButton()
               )
               .navigationBarItems(trailing: NavigationLink(destination: EditProfileView()) {
                   Image(systemName: Constants.systemImage.pencilCircleFill)
                               .foregroundColor(.appLightRed)
                               .font(.system(size: 25))
               })
               
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
