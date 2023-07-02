//
//  BloodTypeUtil.swift
//  iDonate
//
//  Created by i-magineworks on 13/04/2023.
//

import Foundation


class BloodTypeUtil{
    
    static func bloodTypeImage(bloodType: BloodType) -> String {
        
        let bloodTypeImages = [
            BloodType.aPositive: Constants.BloodImage.aPositive,
            BloodType.aNegative: Constants.BloodImage.aNegative,
            BloodType.bPositive: Constants.BloodImage.bPositive,
            BloodType.bNegative: Constants.BloodImage.bNegative,
            BloodType.abPositive: Constants.BloodImage.abPositive,
            BloodType.abNegative: Constants.BloodImage.abNegative,
            BloodType.oPositive: Constants.BloodImage.oPositive,
            BloodType.oNegative: Constants.BloodImage.oNegative
        ]
        
        return bloodTypeImages[bloodType] ?? ""
    }
}
