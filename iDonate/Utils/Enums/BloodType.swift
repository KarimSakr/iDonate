//
//  BloodType.swift
//  iDonate
//
//  Created by i-magineworks on 06/03/2023.
//

import Foundation

enum BloodType: String, Codable {
    case chooseBloodType = "Choose your blood type"
    case aPositive = "A+"
    case aNegative = "A-"
    case bPositive = "B+"
    case bNegative = "B-"
    case abPositive = "AB+"
    case abNegative = "AB-"
    case oPositive = "O+"
    case oNegative = "O-"
    
    static let allValues = [chooseBloodType, aPositive, aNegative, bPositive, bNegative, abPositive, abNegative, oPositive, oNegative]
}
