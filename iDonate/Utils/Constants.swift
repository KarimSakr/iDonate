//
//  Constants.swift
//  iDonate
//
//  Created by i-magineworks on 17/02/2023.
//

import Foundation
import UIKit

struct Constants{
    
    //MARK: - Hexadecimal Code
    struct HexCode{
        static let red             = "assetRed"
        static let lightRed        = "assetLightRed"
        static let backgroundColor = "assetBackgroundColor"
        static let toastColor      = "assetToastColor"
    }
    
    
    struct DefaultValues{
        static let location = "Choose a location"
    }
    
    //MARK: - Blood images
    struct BloodImage{
        static let aPositive  = "A+"
        static let aNegative  = "A-"
        static let bPositive  = "B+"
        static let bNegative  = "B-"
        static let abPositive = "AB+"
        static let abNegative = "AB-"
        static let oPositive  = "O+"
        static let oNegative  = "O-"
    }
    
    //MARK: - Firebase
    
    
    
    //MARK: - Firestore
    struct FS{
        
        
        //MARK: - Collection
        struct Collection{
            static let users     = "users"
            static let donations = "donations"
        }
        
        //MARK: - Register Data
        struct RegisterData{
            static let email       = "email"
            static let name        = "name"
            static let phoneNumber = "phoneNumber"
            static let bloodType   = "bloodType"
        }
        //MARK: - Donation Data
        struct DonationData {
            static let name                = "name"
            static let location            = "location"
            static let bloodType           = "bloodType"
            static let phoneNumber         = "phoneNumber"
            static let optionalPhoneNumber = "optionalPhoneNumber"
            static let notes               = "notes"
            static let donationType        = "donationType"
            static let units               = "units"
            static let countryCode         = "countryCode"
            static let optionalCountryCode = "optionalCountryCode"
            static let datePosted          = "datePosted"
            static let donated             = "donated"
            static let email               = "email"
            static let report              = "report"
        }
    }
    
    //MARK: - Persistence Keys
    struct PersistenceKeys{
        static let emailKey       = "com.iDonate.blood.donation.app.email"
        static let phoneKey       = "com.iDonate.blood.donation.app.phone"
        static let countryCodeKey = "com.iDonate.blood.donation.app.countryCode"
        static let bloodTypeKey   = "com.iDonate.blood.donation.app.bloodType"
        static let nameKey        = "com.iDonate.blood.donation.app.name"
    }
    
    
    //MARK: - Error Messages
    struct ErrorMessages{
        static let emailAddressEmpty     = "Enter email address."
        static let passwordEmpty         = "Enter password."
        static let passwordNotReentered  = "Re-enter password."
        static let nameEmpty             = "Enter the patient's name."
        static let phoneNumberEmpty      = "Enter phone number."
        static let passwordDoesNotMatch  = "Passwords do not match."
        static let bloodTypeNotChosen    = "Choose a blood type."
        static let emailNotVerified      = "Verify your email address."
        static let donationTypeNotChosen = "Choose donation type."
        static let unitsNeededNotEntered = "Enter how many units are needed."
        static let locationNotEntered    = "Enter the hospital's location."
        static let countryCodeError      = "countryCode error"
        static let datePostedError       = "Date Posted error"
        static let userNotSignedIn       = "This user is not currently signed in"
        static let callFailed            = "Unable to make call."
    }
    
    //MARK: - Screen size
    struct ScreenSize {
        static let screenSize = UIScreen.main.bounds.size
    }
    
    //MARK: - Messages
    struct Messages{
        static let verifyEmailMessage = "An email verification link has been sent to your personal email address, please check your inbox."
    }
    
    //MARK: - System images
    struct systemImage{
        static let houseCircle      = "house.circle"
        static let dropCircleFill   = "drop.circle.fill"
        static let pencilCircleFill = "pencil.circle.fill"
        static let envelopeCircle   = "envelope.circle"
        static let phoneFill        = "phone.fill"
    }
    //MARK: - Notification Keywords
    struct Notification{
        struct Name {
            static let notificationName = "com.iDonate.notification.name"
        }
        struct Title {
            static let didYouKnow = "Did You Know?"
        }
    }
}
