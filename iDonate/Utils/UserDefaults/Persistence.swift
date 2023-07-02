//
//  Persistence.swift
//  iDonate
//
//  Created by i-magineworks on 03/04/2023.
//

import Foundation

class Persistence {
    
    static let shared = Persistence()
    public init() {}
    
    func saveUser(email:String, name:String, phoneNumber:String, countryCode:String, bloodType:String){
        save(key: Constants.PersistenceKeys.emailKey, object: email)
        save(key: Constants.PersistenceKeys.nameKey, object: name)
        save(key: Constants.PersistenceKeys.phoneKey, object: phoneNumber)
        save(key: Constants.PersistenceKeys.countryCodeKey, object: countryCode)
        save(key: Constants.PersistenceKeys.bloodTypeKey, object: bloodType)
    }
    
    func getUser() -> User {
        
        let email       = getString(key: Constants.PersistenceKeys.emailKey        )
        let name        = getString(key: Constants.PersistenceKeys.nameKey         )
        let phoneNumber = getString(key: Constants.PersistenceKeys.phoneKey        )
        let countryCode = (getCountry(key: Constants.PersistenceKeys.countryCodeKey) ?? Country(rawValue: "🇱🇧 +961"))!
        let bloodType   = (getBloodType(key: Constants.PersistenceKeys.bloodTypeKey) ?? BloodType(rawValue: "Choose your blood type"))!
        
        return User(name: name ?? "", email: email ?? "", bloodType: bloodType, phoneNumber: phoneNumber ?? "", countryCode: countryCode)
    }
    
    func deleteUserData(){
        deleteData(key: Constants.PersistenceKeys.emailKey)
        deleteData(key: Constants.PersistenceKeys.nameKey)
        deleteData(key: Constants.PersistenceKeys.phoneKey)
        deleteData(key: Constants.PersistenceKeys.countryCodeKey)
        deleteData(key: Constants.PersistenceKeys.bloodTypeKey)
    }
    
    //MARK: - private methods
    
    private let defaults = UserDefaults.standard

    //MARK: - Save
    private func save(key: String, object: Any) {
        defaults.set(object, forKey: key)
    }

    //MARK: - Fetch
    private func getString(key: String) -> String? {
        return defaults.string(forKey: key)
    }
    
    private func getCountry(key: String) -> Country? {
        
        let countryName = defaults.string(forKey: key)
        return Country(rawValue: countryName ?? "🇱🇧 +961")
    }
    
    private func getBloodType(key: String) -> BloodType? {
        
        let bloodTypeString = defaults.string(forKey: key)
        return BloodType(rawValue: bloodTypeString ?? "Choose your blood type")
    }
    
    //MARK: - Delete
    private func deleteData(key:String) {
        defaults.removeObject(forKey: key)
    }
}
