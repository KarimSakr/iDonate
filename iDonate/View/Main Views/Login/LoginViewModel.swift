//
//  LoginViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 26/03/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel{
    
    private let persistence = Persistence()
    private let db = Firestore.firestore()
    
    func loginPressed(email:String, password:String, completion: @escaping (iDonateError?) -> Void) {
        
        //check if fields are valid
        if email == ""{
            completion(.emailAddressEmpty)
        }else if password == ""{
            completion(.passwordEmpty)
        }
        else{
            //sign in
            Auth.auth().signIn(withEmail: email.lowercased(), password: password) {authResult, error in
                
                if let error = error{
                    completion(.unknown(message: error.localizedDescription))
                    
                } else {
                    guard let user = Auth.auth().currentUser else{
                        return
                    }
                    // check if user is verified
                    if user.isEmailVerified{
                        
                        //fetch user data and store them locally
                        self.db.collection(Constants.FS.Collection.users).document(email.lowercased()).getDocument(source: .server ) { document, error in
                            
                            if let document = document, document.exists {
                                
                                let name = document.get(Constants.FS.RegisterData.name) as! String
                                let phoneNumber = document.get(Constants.FS.RegisterData.phoneNumber) as! String
                                let bloodType = document.get(Constants.FS.RegisterData.bloodType) as! String
                                
                                let components = phoneNumber.components(separatedBy: " ")
                                let countrycode = components.first
                                
                                // save usre data
                                self.persistence.saveUser(email: email , name: name, phoneNumber: phoneNumber, countryCode: countrycode ?? "+961", bloodType: bloodType)
                                
                               
                                completion(nil)
                            }
                        }
                    } else {
                        completion(.emailNotVerified)
                    }
                }
            }
        }
    }
    
    //MARK: - Check if user is signed in
    func isUserSignedIn() -> Bool{
        guard persistence.getUser().email != "" else {
            return false
        }
        return true
    }
}
