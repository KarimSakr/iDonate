//
//  ChangePasswordViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 14/04/2023.
//

import Foundation
import FirebaseAuth

class ChangePasswordViewModel{
    
    func changePasswordPressed(newPassword:String, reEnterPassword:String, completion: @escaping (iDonateError?) -> Void){
                
        // check fields if valid
        guard newPassword != "" else{
            completion(.passwordEmpty)
            return
        }
        
        guard reEnterPassword != "" else{
            completion(.passwordNotReentered)
            return
        }
        
        guard reEnterPassword == newPassword else{
            completion(.passwordDoesNotMatch)
            return
        }
        
        // update passwords
        Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
            
            if let error = error {
                completion(.unknown(message: error.localizedDescription))
            } else {
                
                completion(nil)
            }
        }
        
    }
}
