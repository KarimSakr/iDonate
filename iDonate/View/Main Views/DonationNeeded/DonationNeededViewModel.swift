//
//  DonationNeededViewModel.swift
//  iDonate
//
//  Created by i-magineworks on 13/03/2023.
//

import Foundation
import FirebaseFirestore

class DonationNeeedViewModel{
    
    private let db = Firestore.firestore()
    private let persistence = Persistence()
    
    //MARK: - Post Button Pressed
    func postButtonPressed(donation: Donation, completion: @escaping (iDonateError?) -> Void){
                
        // check if fields are valid
        guard let name = donation.name, !name.isEmpty else{
            completion(.nameEmpty)
            return
        }
        
        guard let bloodType = donation.bloodType, bloodType != .chooseBloodType else{
            completion(.bloodTypeNotChosen)
            return
        }
        
        guard let donationType = donation.donationType, donationType != .chooseDonationType else{
            completion(.donationTypeNotChosen)
            return
        }
        
        guard var phoneNumber = donation.phoneNumber, !phoneNumber.isEmpty else{
            completion(.phoneNumberEmpty)
            return
        }
        
        guard let optionalPhoneNumber = donation.optionalPhoneNumber else{
            return
        }
        
        guard let units = donation.units, units != 0 else{
            completion(.unitsNeededNotEntered)
            return
        }
        
        guard let location = donation.location, location != Constants.DefaultValues.location else{
            completion(.locationNotEntered)
            return
        }
        
        guard let countryCode = donation.countryCode else{
            completion(.countryCodeError)
            return
        }
        
        guard let datePosted = donation.datePosted else{
            completion(.datePostedError)
            return
        }
        
        guard var optionalCountryCode = donation.optionalCountryCode?.rawValue else{
            return
        }
        
        guard let notes = donation.notes else{
            return
        }
        
        if optionalPhoneNumber == "" {
            optionalCountryCode = ""
        }
        
        if !optionalPhoneNumber.isEmpty && phoneNumber.isEmpty {
            phoneNumber = optionalPhoneNumber
        }
        
        guard let email = persistence.getUser().email else {
            return
        }
        
        guard let donated = donation.donated else {
            return
        }
        
        let donationData : [String : Any] = [
            Constants.FS.DonationData.name                : name,
            Constants.FS.DonationData.location            : location,
            Constants.FS.DonationData.bloodType           : bloodType.rawValue,
            Constants.FS.DonationData.notes               : notes,
            Constants.FS.DonationData.donationType        : donationType.rawValue,
            Constants.FS.DonationData.units               : units,
            Constants.FS.DonationData.datePosted          : datePosted,
            Constants.FS.DonationData.phoneNumber         : getTextFromFlags(inputString: countryCode.rawValue) + phoneNumber,
            Constants.FS.DonationData.optionalPhoneNumber : getTextFromFlags(inputString: optionalCountryCode) + optionalPhoneNumber,
            Constants.FS.DonationData.email               : email,
            Constants.FS.DonationData.donated             : donated,
            Constants.FS.DonationData.report              : [] as [String]
        ]
        
        // post data to firebase
        db.collection(Constants.FS.Collection.donations).addDocument(data: donationData){ error in
            if let error = error{
                completion(.unknown(message: error.localizedDescription))
            }
            else{
                completion(nil)
            }
        }
    }
    
    //MARK: - Autocomplete Button Pressed
    func autocompleteButtonPressed() -> User{
        return persistence.getUser()
    }
    
    private func getTextFromFlags(inputString: String) -> String {
        
        let text = String(inputString.unicodeScalars.filter { !$0.properties.isEmoji || ($0.properties.isEmoji && ($0.value < 127_462 || $0.value > 127_487)) })
        
        return text
    }
    
    //MARK: - Fetch email
    func getEmail() -> String{
        guard let email = persistence.getUser().email else {
            return ""
        }
        
        return email
    }
}
