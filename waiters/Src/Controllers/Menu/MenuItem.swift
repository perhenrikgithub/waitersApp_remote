//
//  MenuItem.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import Foundation

enum MenuItemType {
    case main
    case pasta
    case antipasti
    case zuppe
    case pizza
    case wines
    case reds
    case whites
    case zero
}

class MenuItem: Identifiable {
    let id = UUID()
    private var _name: String
    private var _description: String
    private var _price: Double
    private var _isVegetarian: Bool
    private var _isVegan: Bool
    private var _allergens: [Allergy]?
    private var _type: [MenuItemType]?
    private var _winePairings: [WineBottle]?

    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }

    var description: String {
        get {
            return _description
        }
        set {
            _description = newValue
        }
    }

    var price: Double {
        get {
            return _price
        }
        set {
            _price = newValue
        }
    }

    var isVegetarian: Bool {
        get {
            return _isVegetarian
        }
        set {
            _isVegetarian = newValue
        }
    }

    var isVegan: Bool {
        get {
            return _isVegan
        }
        set {
            _isVegan = newValue
        }
    }

    var allergens: [Allergy]? {
        get {
            return _allergens!
        }
        set {
            _allergens = newValue
        }
    }
    
    var type: [MenuItemType]? {
        get {
            return _type
        }
        set {
            _type = newValue
        }
    }
    
    var winePairings: [WineBottle]? {
        get {
            return _winePairings!
        }
        set {
            _winePairings = newValue
        }
    }
    
    init(
        name: String,
        description: String,
        price: Double,
        isVegetarian: Bool,
        isVegan: Bool,
        allergens: [Allergy] = [],
        type: [MenuItemType] = [],
        winePairings: [WineBottle] = []
    ) {
        _name = name
        _description = description
        _price = price
        _isVegetarian = isVegetarian
        _isVegan = isVegan
        _allergens = allergens
        _type = type
        _winePairings = winePairings
    }
    
    func addAllergy(allergy: Allergy) {
        if _allergens != nil {
            _allergens?.append(allergy)
        } else {
            _allergens = [allergy]
        }
    }
    
    func removeAllergy(allergy: Allergy) {
        if let index = _allergens?.firstIndex(of: allergy) {
            _allergens?.remove(at: index)
            // Check if the array is empty after removing an element, if true: then set it back to nil
            if _allergens?.isEmpty ?? true {
                _allergens = nil
            }
        }
    }

    
    func addMenuType(type: MenuItemType) {
        if _type != nil {
            _type?.append(type)
        } else {
            _type = [type]
        }
    }
    
    func removeMenuType(type: MenuItemType) {
        if let index = _type?.firstIndex(of: type) {
            _type?.remove(at: index)
            // Check if the array is empty after removing an element, if true: then set it back to nil
            if _type?.isEmpty ?? true {
                _type = nil
            }
        }
    }

    
    func addWinePairing(wineBottle: WineBottle) {
        if _winePairings != nil {
            _winePairings?.append(wineBottle)
        } else {
            _winePairings = [wineBottle]
        }
    }
    
    func removeWinePairing(wineBottle: WineBottle) {
        if let index = _winePairings?.firstIndex(of: wineBottle) {
            _winePairings?.remove(at: index)
            // Check if the array is empty after removing an element, if true: then set it back to nil
            if _winePairings?.isEmpty ?? true {
                _winePairings = nil
            }
        }
    }
}

