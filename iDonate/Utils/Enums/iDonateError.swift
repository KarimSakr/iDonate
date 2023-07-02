//
//  iDonateError.swift
//  iDonate
//
//  Created by i-magineworks on 12/06/2023.
//

import Foundation

enum iDonateError: LocalizedError, Equatable{
    
    case emailAddressEmpty
    
    case passwordEmpty
    
    case passwordNotReentered
    
    case nameEmpty
    
    case phoneNumberEmpty
    
    case passwordDoesNotMatch
    
    case bloodTypeNotChosen
    
    case donationTypeNotChosen
    
    case unitsNeededNotEntered
    
    case locationNotEntered
    
    case countryCodeError
    
    case datePostedError
    
    case userNotSignedIn
    
    case emailNotVerified
    
    case unknown(message: String)
    
    //TODO: Add Error messages
    
    var errorDescription: String {
        switch self {
            
        case .emailAddressEmpty:
            return Constants.ErrorMessages.emailAddressEmpty
            
        case .passwordEmpty:
            return Constants.ErrorMessages.passwordEmpty
            
        case .passwordNotReentered:
            return Constants.ErrorMessages.passwordNotReentered
            
        case .nameEmpty:
            return Constants.ErrorMessages.nameEmpty
            
        case .phoneNumberEmpty:
            return Constants.ErrorMessages.phoneNumberEmpty
            
        case .passwordDoesNotMatch:
            return Constants.ErrorMessages.passwordDoesNotMatch
            
        case .bloodTypeNotChosen:
            return Constants.ErrorMessages.bloodTypeNotChosen
            
        case .donationTypeNotChosen:
            return Constants.ErrorMessages.donationTypeNotChosen
            
        case .unitsNeededNotEntered:
            return Constants.ErrorMessages.unitsNeededNotEntered
            
        case .locationNotEntered:
            return Constants.ErrorMessages.locationNotEntered
            
        case .countryCodeError:
            return Constants.ErrorMessages.countryCodeError
            
        case .datePostedError:
            return Constants.ErrorMessages.datePostedError
            
        case .userNotSignedIn:
            return Constants.ErrorMessages.userNotSignedIn
            
        case .emailNotVerified:
            return Constants.ErrorMessages.emailNotVerified
            
        case .unknown(message: let message):
            return message
        }
    }
    
}
