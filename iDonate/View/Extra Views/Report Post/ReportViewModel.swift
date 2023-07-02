//
//  ReportViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 25/06/2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ReportViewModel {
    
    private let db = Firestore.firestore()
    
    func reasonTapped(for reason: ReportReason, from donation: Donation){
        
        guard var alreadyReportedStuff = donation.reports else {
            // handle error
            return
        }
        
        if !alreadyReportedStuff.contains(reason.rawValue){
            
            alreadyReportedStuff.append(reason.rawValue)
            
            guard let id = donation.id else {
                return
            }
            let docRef = db.collection(Constants.FS.Collection.donations).document(id)
            
            docRef.updateData([Constants.FS.DonationData.report : alreadyReportedStuff]) { error in
                
                if let error = error {
                    Log.e(error.localizedDescription)
                }
            }
        }
    }
}
