//
//  FoodItem.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 30/07/2023.
//

import Foundation

enum FoodItemType: String, CaseIterable {
    case pasta = "Pasta"
    case antipasti = "Antipasti"
    case zuppe = "Zuppe"
    case pizza = "Pizza"
    case other = "Other"
}

enum Course {
    case appetizer
    case entree
    case main
    case dessert
}


class FoodItem: MenuItem {
    private var _isVegetarian: Bool
    private var _isVegan: Bool
    private var _type: FoodItemType
    private var _course: Course
    private var _winePairings: [WineBottle]?

    init(
        // self
        isVegetarian: Bool,
        isVegan: Bool,
        type: FoodItemType,
        course: Course,
        winePairings: [WineBottle] = [],
        // super
        name: String,
        description: String,
        price: Double,
        allergens: [Allergy]? = nil
    ) {
        _isVegetarian = isVegetarian
        _isVegan = isVegan
        _type = type
        _winePairings = winePairings
        _course = course
        
        super.init(
            name: name,
            description: description,
            price: price,
            allergens: allergens
        )
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
    
    var type: FoodItemType {
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
