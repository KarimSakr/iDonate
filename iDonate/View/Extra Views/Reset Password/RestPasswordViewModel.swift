//
//  RestPasswordViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 10/04/2023.
//

import Foundation
import FirebaseAuth

class ResetPasswordViewModel{
    
    func resetPassword(email:String, completion: @escaping (iDonateError?) -> Void){
        
        // reset password
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            
            if let error = error{
                
                completion(.unknown(message: error.localizedDescription))
            } else {
                
                completion(nil)
            }
        }
    }
}
