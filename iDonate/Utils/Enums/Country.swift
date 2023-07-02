//
//  Country.swift
//  iDonate
//
//  Created by i-magineworks on 06/03/2023.
//

import Foundation

enum Country: String, Codable {
    case lebanon = "🇱🇧 +961"
    case jordan = "🇯🇴 +962"
    case syria = "🇸🇾 +963"
    case iraq = "🇮🇶 +964"
    case kuwait = "🇰🇼 +965"
    case saudiArabia = "🇸🇦 +966"
    case yemen = "🇾🇪 +967"
    case oman = "🇴🇲 +968"
    case palestine = "🇵🇸 +970"
    case unitedArabEmirates = "🇦🇪 +971"
    case qatar = "🇶🇦 +974"
    case bahrain = "🇧🇭 +973"
    
    static let allValues = [lebanon, jordan, syria, iraq, kuwait, saudiArabia, yemen, oman, palestine, unitedArabEmirates, qatar, bahrain]
}
