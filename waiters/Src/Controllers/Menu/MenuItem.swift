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
    private var _allergens: [Allergy]
    private var _type: [MenuItemType]

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

    var allergens: [Allergy] {
        get {
            return _allergens
        }
        set {
            _allergens = newValue
        }
    }
    
    var type: [MenuItemType] {
        get {
            return _type
        }
        set {
            _type = newValue
        }
    }
    
    init(name: String, description: String, price: Double, isVegetarian: Bool, isVegan: Bool, allergens: [Allergy], type: [MenuItemType]) {
        _name = name
        _description = description
        _price = price
        _isVegetarian = isVegetarian
        _isVegan = isVegan
        _allergens = allergens
        _type = type
    }
}

