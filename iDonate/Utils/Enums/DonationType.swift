//
//  DonationType.swift
//  iDonate
//
//  Created by i-magineworks on 13/03/2023.
//

import Foundation

enum DonationType: String, Codable {
    
    case chooseDonationType = "Choose the type of donation"
    case wholeBloodDonation = "Whole blood donation"
    case powerRedDonation = "Power Red donation"
    case platetDonation = "Platelet donation"
    case plasmaDonation = "Plasma donation"
    case doubleRedCellDonation = "Double red cell donation"
    case whiteBloodCellDonation = "White blood cell donation"
    case autologousDonation = "Autologous donation"
    
    
    static let allValues = [
        chooseDonationType,
        wholeBloodDonation,
        powerRedDonation,
        platetDonation,
        plasmaDonation,
        doubleRedCellDonation,
        whiteBloodCellDonation,
        autologousDonation
    ]
}
