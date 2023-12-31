//
//  MenuItem.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import Foundation


class MenuItem: Identifiable {
    private var _name: String
    private var _description: String?
    private var _price: Double
    private var _allergens: [Allergy]?
    
    private var _orderAmount = 0
    private var _orderComment = ""
    
    init(
        name: String,
        description: String?,
        price: Double,
        allergens: [Allergy]? = nil
    ) {
        self._name = name
        self._description = description
        self._price = price
        self._allergens = allergens
    }
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }

    var description: String? {
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
    
    var allergens: [Allergy]? {
        get {
            return _allergens!
        }
        set {
            _allergens = newValue
        }
    }
    
    var orderAmount: Int {
        get {
            return _orderAmount
        }
        set {
            if newValue >= 0 {
                _orderAmount = newValue
            }
        }
    }
    
    func increaseOrderAmount() {
        _orderAmount += 1
    }
    
    func decreaseOrderAmount() {
        if _orderAmount > 0 {
            _orderAmount -= 1
        }
    }
    
    var orderComment: String {
        get {
            return _orderComment
        }
        set {
            _orderComment = newValue
        }
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
    
}

