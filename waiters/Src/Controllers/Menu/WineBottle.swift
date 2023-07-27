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
}

class WineBottle: Equatable {
    private var _name: String
    private var _priceAsBottle: Double
    private var _priceAsGlass: Double?
    private var _description: String
    private var _type: WineType
    
    var name: String {
        // Implicit default getter (reads the value of the property)
        get {
            return _name
        }
        // Implicit default setter (modifies the value of the property)
        set {
            _name = newValue
        }
    }
    
    var description: String {
        // Implicit default getter
        get {
            return _description
        }
        // Implicit default setter
        set {
            _description = newValue
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
    
    init(name: String, priceAsBottle: Double, priceAsGlass: Double? = nil, description: String, winetype: WineType) {
        self._name = name
        self._priceAsBottle = priceAsBottle
        self._priceAsGlass = priceAsGlass
        self._description = description
        self._type = winetype
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
