//
//  WineBottle.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import Foundation

class WineBottle {
    private var _name: String
    private var _priceAsBottle: Double
    private var _priceAsGlass: Double?
    private var _description: String
    
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
    
    init(name: String, priceAsBottle: Double, priceAsGlass: Double? = nil, description: String) {
        self._name = name
        self._priceAsBottle = priceAsBottle
        self._priceAsGlass = priceAsGlass
        self._description = description
    }
    
}
