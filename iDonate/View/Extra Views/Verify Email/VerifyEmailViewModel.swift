//
//  VerifyEmailViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 09/04/2023.
//

import Foundation
import FirebaseAuth

class VerifyEmailViewModel{
    
    func sendEmailVerificationAgain(completion: (Bool) -> Void){
        guard let user = Auth.auth().currentUser else{
            return
        }
        // send mail
        user.sendEmailVerification()
        completion(true)
    }
}
