//
//  WineBottle.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import Foundation

enum WineType {
    case red
    case white
    case natural
    case sparkling
    case rose
}

class WineBottle: DrinkItem, Equatable {
    private var _countryOfOrigin: String?
    private var _priceAsBottle: Double
    private var _priceAsGlass: Double?
    private var _type: WineType
    
    init(
        // winebottle attributes
        countryOfOrigin: String?,
        priceAsBottle: Double,
        priceAsGlass: Double? = nil,
        winetype: WineType,
        // super attributes
        alcoholContent: Double,
        name: String,
        description: String,
        price: Double,
        allergens: [Allergy]? = nil
    ) {
        self._priceAsBottle = priceAsBottle
        self._priceAsGlass = priceAsGlass
        self._type = winetype
        self._countryOfOrigin = countryOfOrigin
        
        super.init(
            alcoholContent: alcoholContent,
            name: name,
            description: description,
            price: price,
            allergens: allergens
        )
    }
    
    var countryOfOrigin: String? {
        get {
            return _countryOfOrigin
        }
        set {
            _countryOfOrigin = newValue
        }
    }
    
    
    var priceAsBottle: Double {
        // Implicit default getter
        get {
            return _priceAsBottle
        }
        // Implicit default setter
        set {
            assert(newValue >= 0, "priceAsBottle cannot be assigned a negative value.")
            _priceAsBottle = newValue
        }
    }
    
    var priceAsGlass: Double? {
        // Implicit default getter
        get {
            return _priceAsGlass
        }
        // Implicit default setter
        set {
            if newValue != nil {
                if newValue! >= 0 {
                    _priceAsGlass = newValue
                }
            }
        }
    }
    
    var type: WineType {
        // Implicit default getter
        get {
            return _type
        }
        // Implicit default setter
        set {
            _type = newValue
        }
    }
    
    
    // Override the equality operator (==) to compare two WineBottle instances
    static func == (lhs: WineBottle, rhs: WineBottle) -> Bool {
        return lhs.name == rhs.name &&
               lhs.priceAsBottle == rhs.priceAsBottle &&
               lhs.priceAsGlass == rhs.priceAsGlass &&
               lhs.description == rhs.description &&
               lhs.type == rhs.type
    }
    
}
