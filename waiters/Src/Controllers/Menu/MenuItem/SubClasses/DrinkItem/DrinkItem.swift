//
//  DrinkItem.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 30/07/2023.
//

import Foundation

enum DrinkItemType {
    case wine
    case beer
    case other
}

class DrinkItem: MenuItem {
    private var _alcoholContent: Double
    
    init(
        alcoholContent: Double,
        name: String,
        description: String?,
        price: Double,
        allergens: [Allergy]? = nil
    ) {
        self._alcoholContent = alcoholContent
        
        super.init(
            name: name,
            description: description,
            price: price
        )
    }
}
