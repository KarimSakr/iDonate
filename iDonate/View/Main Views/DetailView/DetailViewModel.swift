//
//  DetailViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 05/04/2023.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore

class DetailViewModel{
    
    private let persistence = Persistence.shared
    private let db = Firestore.firestore()
    
    //MARK: - Blood Image
    func bloodTypeImage(bloodType: BloodType) -> String {
        
        BloodTypeUtil.bloodTypeImage(bloodType: bloodType)
    }
    
    //MARK: - Units Needed Message
    func unitsNeededMessage(units:Int) -> String{
        if units == 1 {
            return "unit needed."
        } else{
            return "units needed."
        }
    }
    
    func call(phoneNumber: String?, completion: @escaping (Bool) -> Void){
        
        guard let phoneNumber = phoneNumber else{
            return
        }
        if let url = URL(string: "tel://\(phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines))"),
           UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
            completion(true)
        } else {
            completion(false)
        }
    }
    
    func toggleIsChecked(donation: Donation, completion: @escaping (Error?) -> Void){
        
        guard let id = donation.id else {
            return
        }
        let docRef = db.collection(Constants.FS.Collection.donations).document(id)
        
        guard let donated = donation.donated else {
            return
        }
        docRef.updateData([Constants.FS.DonationData.donated : donated]) { error in
            
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    func getEmail() -> String {
        guard let email = persistence.getUser().email else {
            return ""
        }
        
        return email
    }
}
