//
//  Donation.swift
//  iDonate
//
//  Created by i-magineworks on 20/02/2023.
//

import Foundation

struct Donation : Codable, Hashable, Identifiable{
    
    var id                  : String?       = nil
    var name                : String?       = nil
    var location            : String?       = nil
    var bloodType           : BloodType?    = nil
    var phoneNumber         : String?       = nil
    var optionalPhoneNumber : String?       = nil
    var optionalCountryCode : Country?      = nil
    var countryCode         : Country?      = nil
    var notes               : String?       = nil
    var donationType        : DonationType? = nil
    var units               : Int?          = nil
    var datePosted          : Double?       = nil
    var donated             : Bool?         = nil
    var email               : String?       = nil
    var reports             : [String]?     = []
    
    enum CodingKeys: String, CodingKey {
        
        case id                  = "id"
        case name                = "name"
        case location            = "location"
        case bloodType           = "bloodType"
        case phoneNumber         = "phoneNumber"
        case optionalPhoneNumber = "optionalPhoneNumber"
        case notes               = "notes"
        case donationType        = "donationType"
        case units               = "units"
        case countryCode         = "countryCode"
        case optionalCountryCode = "optionalCountryCode"
        case datePosted          = "datePosted"
        case donated             = "donated"
        case email               = "email"
        case reports             = "reports"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name                = try container.decodeIfPresent(String.self      , forKey: .name               )
        self.location            = try container.decodeIfPresent(String.self      , forKey: .location           )
        self.bloodType           = try container.decodeIfPresent(BloodType.self   , forKey: .bloodType          )
        self.phoneNumber         = try container.decodeIfPresent(String.self      , forKey: .phoneNumber        )
        self.notes               = try container.decodeIfPresent(String.self      , forKey: .notes              )
        self.donationType        = try container.decodeIfPresent(DonationType.self, forKey: .donationType       )
        self.units               = try container.decodeIfPresent(Int.self         , forKey: .units              )
        self.optionalPhoneNumber = try container.decodeIfPresent(String.self      , forKey: .optionalPhoneNumber)
        self.countryCode         = try container.decodeIfPresent(Country.self     , forKey: .countryCode        )
        self.optionalCountryCode = try container.decodeIfPresent(Country.self     , forKey: .optionalCountryCode)
        self.datePosted          = try container.decodeIfPresent(Double.self      , forKey: .datePosted         )
        self.donated             = try container.decodeIfPresent(Bool.self        , forKey: .donated            )
        self.email               = try container.decodeIfPresent(String.self      , forKey: .email              )
        self.id                  = try container.decodeIfPresent(String.self      , forKey: .id                 )
        self.reports             = try container.decodeIfPresent([String].self    , forKey: .reports             )
        
    }
    
    init(name: String, location: String, bloodType: BloodType, phoneNumber: String, countryCode: Country, optionalPhoneNumber: String, optionalCountryCode: Country, notes: String, donationType: DonationType, units: Int, datePosted: Double, donated: Bool, email: String, reports: [String]) {
        
        self.name                = name
        self.location            = location
        self.bloodType           = bloodType
        self.phoneNumber         = phoneNumber
        self.optionalPhoneNumber = optionalPhoneNumber
        self.notes               = notes
        self.donationType        = donationType
        self.units               = units
        self.countryCode         = countryCode
        self.optionalCountryCode = optionalCountryCode
        self.datePosted          = datePosted
        self.donated             = donated
        self.email               = email
        self.reports             = reports
    }
    
    init(name: String, location: String, bloodType: BloodType, phoneNumber: String, optionalPhoneNumber: String, notes:String, donationType: DonationType, units: Int,donated: Bool, email: String, id: String, reports: [String]) {
        
        self.name                = name
        self.location            = location
        self.bloodType           = bloodType
        self.phoneNumber         = phoneNumber
        self.optionalPhoneNumber = optionalPhoneNumber
        self.notes               = notes
        self.donationType        = donationType
        self.units               = units
        self.donated             = donated
        self.email               = email
        self.id                  = id
        self.reports             = reports
    }
}
