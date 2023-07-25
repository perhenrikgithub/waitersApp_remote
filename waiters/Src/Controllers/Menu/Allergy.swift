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
    case sesameSeads
    case sulphurDioxide
    case lupin // lupinmel
    case molluscs // bløtdyr
}

class Allergy {
    var allergyType: Allergen
    var allergyName: String?
    var canBeMadeWithout: Bool
    
    init(allergyType: Allergen, canBeMadeWithout: Bool) {
        self.allergyType = allergyType
        self.canBeMadeWithout = canBeMadeWithout
        
        if allergyType == .sesameSeads {
            self.allergyName = "Seasame Seads"
        } else if allergyType == .sulphurDioxide {
                self.allergyName = "Sulphur Dioxide"
            }
    }
    
    
}
