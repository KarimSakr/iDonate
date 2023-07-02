//
//  DidYouKnowData.swift
//  iDonate
//
//  Created by i-magineworks on 24/04/2023.
//

import Foundation

struct DidYouKnowData{
    private let didYouKnowArray = [
        "Just 1 donation can save up to 3 lives.",
        "The average red blood cell transfusion is 3 pints (or 3 whole-blood donations).",
        "More than 1 million people every year are diagnosed with cancer for the first time. Many of them will need blood—sometimes daily—during chemotherapy.",
        "More than 38,000 blood donations are needed every day.",
        "Type O-negative whole blood can be transfused to people with any blood type, but this type of blood is rare, and supplies of it are low.",
        "Type AB plasma can be transfused to patients with all other blood types, but it's also in short supply.",
        "While 38% of the population is eligible to give blood, only 2% actually donates.",
        "About 1 in 7 people entering a hospital need blood.",
        "According to the World Heal Organization, 33% of donors are women.",
        "Donations are screened for viruses to avoid infecting recipients.",
        "More than 40% of donations are collected in high-income countries, where only 16% of the world's population lives.",
        "Physical activity after donating blood can be done in a day.. Moderate exercise along with a balanced diet is usually enough to start the body's self-healing.",
        "To fully meet the need for donated blood, at least 33 donations per 1,000 people are required per year.",
        "People who regularly make donation live five years longer on average."
    ]
    
    func didYouKnow() -> [String] {
        return didYouKnowArray.shuffled()
    }
    
    func didYouknowLength() -> Int{
        return didYouKnowArray.count + 1
    }
}
