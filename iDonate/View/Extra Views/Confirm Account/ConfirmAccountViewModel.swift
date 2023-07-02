//
//  ConfirmAccountViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 15/04/2023.
//

import Foundation
import FirebaseAuth

class ConfirmAccountViewModel{
    
    private let persistence = Persistence()
    
    func confirmUser(email:String, password:String, completion: @escaping (iDonateError?) -> Void){
        
        // get current user
        let currentUserEmail = persistence.getUser().email?.lowercased()
        
        // check if fields are valid
        guard email != "" else {
            completion(.emailAddressEmpty)
            return
        }
        
        guard password != "" else {
            completion(.passwordEmpty)
            return
        }
        
        // check if current user is the user changing passewords
        guard email == currentUserEmail else{
            completion(.userNotSignedIn)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password){ auth, error in
            
            if let error = error {
                completion(.unknown(message: error.localizedDescription))
            } else {
                
                completion(nil)
            }
        }
        
    }
}
