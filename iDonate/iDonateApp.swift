//
//  iDonateApp.swift
//  iDonate
//
//  Created by i-magineworks on 17/02/2023.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct iDonateApp: App {
    
    @StateObject var networkMonitor = NetworkMonitor()
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if networkMonitor.isConnected {
                LoginView()
                    .environmentObject(networkMonitor)
            } else {
                NoWifiView()
            }

        }
    }
}
