//
//  HomeViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 12/03/2023.
//

import Foundation
import FirebaseFirestore

class HomeViewModel{
    
    private let db = Firestore.firestore()
    private let notificationHandler = NotificationHandler()
    
    func bloodTypeImage(bloodType:BloodType) -> String{
        return BloodTypeUtil.bloodTypeImage(bloodType: bloodType)
    }
    
    func fetchData(completion: @escaping ([Donation],iDonateError?) -> Void){
        
        let currentDate = Date().timeIntervalSince1970
        
        var donations:[Donation] = []
        
        // fetch data from firebase
        db.collection(Constants.FS.Collection.donations)
            .order(by: Constants.FS.DonationData.datePosted, descending: true)
            .addSnapshotListener { querySnapshot, error in
                
                donations = []
                
                if let error = error {
                    
                    completion([],.unknown(message: error.localizedDescription))
                    
                } else {
                    
                    for document in querySnapshot!.documents {
                        
                        let data = document.data()
                        
                        if let bloodType = BloodType(rawValue: data[Constants.FS.DonationData.bloodType] as! String),
                           let donationType = DonationType(rawValue: data[Constants.FS.DonationData.donationType] as! String),
                           let location = data[Constants.FS.DonationData.location] as? String,
                           let name = data[Constants.FS.DonationData.name] as? String,
                           let notes = data[Constants.FS.DonationData.notes] as? String,
                           let optionalPhoneNumber = data[Constants.FS.DonationData.optionalPhoneNumber] as? String,
                           let phoneNumber = data[Constants.FS.DonationData.phoneNumber] as? String,
                           let units = data[Constants.FS.DonationData.units] as? Int,
                           let datePosted = data[Constants.FS.DonationData.datePosted] as? TimeInterval,
                           let email = data[Constants.FS.DonationData.email] as? String,
                           let donated = data[Constants.FS.DonationData.donated] as? Bool,
                           let reports = data[Constants.FS.DonationData.report] as? [String]{
                            
                            // delete data that are older than 2 days
                            if  currentDate > datePosted + 172800{
                                document.reference.delete()
                            } else {
                                let id = document.documentID
                                
                                let newDonation = Donation(name: name, location: location, bloodType: bloodType, phoneNumber: phoneNumber, optionalPhoneNumber: optionalPhoneNumber, notes: notes, donationType: donationType, units: units,donated: donated, email: email, id: id, reports: reports)

                                donations.append(newDonation)
                            }
                        }
                    }
                    completion(donations,nil)
                }
            }
    }
    
//MARK: - Notifiaction
    
    //Schedule 'Did You Know' Notification
    func scheduleDidYouKnowNotification(){
        notificationHandler.scheduleDidYouKnowNotification()
    }
    
    func requestNotificationAuthorization(completion: @escaping (Bool, Error?) -> Void){
        notificationHandler.requestNotificationAuthorization { granted, error in
            completion(granted,error)
        }
    }
    
}
