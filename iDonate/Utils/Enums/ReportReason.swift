//
//  ReportReason.swift
//  iDonate
//
//  Created by i-magineworks on 25/06/2023.
//

import Foundation

enum ReportReason: String {
    case inappropriateContent = "Inappropriate content"
    case harassmentOrBullying = "Harassment or bullying"
    case spamOrAdvertisements = "Spam or advertisements"
    case misinformationOrFalseContent = "Misinformation or false content"
    case privacyConcerns = "Privacy concerns"
    case impersonationOrFakeAccounts = "Impersonation or fake accounts"
    case violentOrGraphicContent = "Violent or graphic content"
    case discriminationOrHateSpeech = "Discrimination or hate speech"
    case copyrightOrIPInfringement = "Copyright or intellectual property infringement"
    case otherViolations = "Other violations"
    
    static let reportReasons: [ReportReason] = [
        .inappropriateContent,
        .harassmentOrBullying,
        .spamOrAdvertisements,
        .misinformationOrFalseContent,
        .privacyConcerns,
        .impersonationOrFakeAccounts,
        .violentOrGraphicContent,
        .discriminationOrHateSpeech,
        .copyrightOrIPInfringement,
        .otherViolations
    ]

}
