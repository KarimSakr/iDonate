//
//  Donation.swift
//  iDonate
//
//  Created by i-magineworks on 20/02/2023.
//

import Foundation

struct User: Codable {
    
    var name       : String?    = nil
    var email      : String?    = nil
    var bloodType  : BloodType? = nil
    var phoneNumber: String?    = nil
    var countryCode: Country?   = nil
    
    enum CodingKeys: String, CodingKey {
        
        case name        = "name"
        case email       = "email"
        case bloodType   = "bloodType"
        case phoneNumber = "phoneNumber"
        case countryCode = "countryCode"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name            = try values.decodeIfPresent(String.self     , forKey: .name            )
        email           = try values.decodeIfPresent(String.self     , forKey: .email           )
        bloodType       = try values.decodeIfPresent(BloodType.self  , forKey: .bloodType       )
        phoneNumber     = try values.decodeIfPresent(String.self     , forKey: .phoneNumber     )
        countryCode     = try values.decodeIfPresent(Country.self     , forKey: .countryCode     )
    }
    
    init(name:String, email:String, bloodType:BloodType, phoneNumber:String, countryCode:Country){
        self.name        = name
        self.email       = email
        self.bloodType   = bloodType
        self.phoneNumber = phoneNumber
        self.countryCode = countryCode
    }
    
    init() {
        
    }
}
