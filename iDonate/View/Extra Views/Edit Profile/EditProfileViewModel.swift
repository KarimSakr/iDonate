//
//  EditProfileViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 11/04/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class EditProfileViewModel{
    private let db = Firestore.firestore()
    private let persistence = Persistence()
    
    func updateProfile(name:String, countryCode:Country, bloodType:BloodType, phoneNumber:String, completion: @escaping (iDonateError?) -> Void){
        
        // check fields
        guard name != "" else {
            completion(.nameEmpty)
            return
        }
        
        guard phoneNumber != "" else {
            completion(.phoneNumberEmpty)
            return
        }
        
        guard bloodType != .chooseBloodType else {
            completion(.bloodTypeNotChosen)
            return
        }
        
        let updatedData : [String:String] = [
            Constants.FS.RegisterData.name : name,
            Constants.FS.RegisterData.phoneNumber : getTextFromFlags(inputString: countryCode.rawValue) + " " + phoneNumber,
            Constants.FS.RegisterData.bloodType : bloodType.rawValue,
        ]
        
        // modify the profile of user
        let userEmail = (Auth.auth().currentUser?.email)!
        
        let userCollection = db.collection(Constants.FS.Collection.users).document(userEmail)
        
        userCollection.updateData(updatedData){ error in
            
            if let error = error {
                
                completion(.unknown(message: error.localizedDescription))
            } else {
                
                self.persistence.saveUser(email: userEmail, name: name, phoneNumber: phoneNumber, countryCode: countryCode.rawValue, bloodType: bloodType.rawValue)
                
                completion(nil)
            }
        }
    }
    
    func fetchUser() -> User{
        return persistence.getUser()
    }
    
    private func getTextFromFlags(inputString: String) -> String {
        
        let text = String(inputString.unicodeScalars.filter { !$0.properties.isEmoji || ($0.properties.isEmoji && ($0.value < 127_462 || $0.value > 127_487)) })
        
        return text
    }
    
}
