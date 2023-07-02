//
//  RegisterViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 23/03/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel{
    
    private let db = Firestore.firestore()
    
    //MARK: - Register Button Pressed
    func registerButtonPressed(email:String, password:String, reEnterPassword:String, name:String,phoneNumber:String,countryCode:Country,bloodType:BloodType, completion: @escaping (iDonateError?) -> Void){
        
        
        // check if fields entered are valid
        guard email != "" else{
            completion(.emailAddressEmpty)
            return
        }
        
        guard password != "" else{
            completion(.passwordEmpty)
            return
        }
        
        guard reEnterPassword != "" else{
            completion(.passwordNotReentered)
            return
        }
        
        guard name != "" else{
            completion(.nameEmpty)
            return
        }
        
        guard phoneNumber != "" else{
            completion(.phoneNumberEmpty)
            return
        }
        
        guard reEnterPassword == password else{
            completion(.passwordDoesNotMatch)
            return
        }
        
        guard bloodType != .chooseBloodType else{
            completion(.bloodTypeNotChosen)
            return
        }
        
        let userData = [
            Constants.FS.RegisterData.email : email.lowercased(),
            Constants.FS.RegisterData.name : name,
            Constants.FS.RegisterData.phoneNumber : getTextFromFlags(inputString: countryCode.rawValue) + " " + phoneNumber,
            Constants.FS.RegisterData.bloodType : bloodType.rawValue
        ]
        
        // create user
        Auth.auth().createUser(withEmail: email, password: password){authResult, error in
            if let error = error{
                
                completion(.unknown(message: error.localizedDescription))
            }
            else{
                
                // send email verification
                Auth.auth().currentUser?.sendEmailVerification()
                
                // save user data in firebase
                self.db.collection(Constants.FS.Collection.users).document(email.lowercased()).setData(userData)
                
                completion(nil)
            }
        }
    }
    
    //MARK: - Helper functions
    private func getTextFromFlags(inputString: String) -> String {

        let text = String(inputString.unicodeScalars.filter { !$0.properties.isEmoji || ($0.properties.isEmoji && ($0.value < 127_462 || $0.value > 127_487)) })
        
        return text
    }
    
}
