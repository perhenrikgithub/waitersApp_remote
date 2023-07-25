//
//  Allergy.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import Foundation

enum Allergen: String {
    case gluten
    case crustaceans // Krepsdyr
    case eggs
    case fish
    case peanuts
    case soybeans
    case milk
    case nuts
    case celery
    case mustard
    case sesameSeeds // Corrected the typo in "Seasame Seads" to "sesameSeeds"
    case sulphurDioxide // Corrected the typo in "Sulphur Dioxide" to "sulphurDioxide"
    case lupin // lupinmel
    case molluscs // bløtdyr
}

class Allergy: Hashable {
    static func == (lhs: Allergy, rhs: Allergy) -> Bool {
        return lhs.allergyType == rhs.allergyType && lhs.canBeMadeWithout == rhs.canBeMadeWithout // Corrected the comparison here
    }

    var allergyType: Allergen
    var allergyName: String? // It's better to keep the typo-prone property optional with a question mark if it's not always set.
    var canBeMadeWithout: Bool

    init(allergyType: Allergen, canBeMadeWithout: Bool) {
        self.allergyType = allergyType
        self.canBeMadeWithout = canBeMadeWithout

        if allergyType == .sesameSeeds { // Corrected the case for sesameSeeds
            self.allergyName = "Sesame Seeds" // Corrected the typo in "Seasame Seads" to "Sesame Seeds"
        } else if allergyType == .sulphurDioxide { // Corrected the case for sulphurDioxide
            self.allergyName = "Sulphur Dioxide" // Corrected the typo in "Sulphur Dioxide" to "Sulphur Dioxide"
        }
    }

    // Implementing the hash function to conform to the Hashable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(allergyType)
        hasher.combine(canBeMadeWithout)
    }
}
