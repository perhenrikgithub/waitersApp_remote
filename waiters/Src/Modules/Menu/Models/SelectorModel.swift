//
//  MenuModel.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 31/07/2023.
//

import Foundation

class SelectorModel: ObservableObject {
    @Published var _activeFoodItems: [FoodItemType] = []
    
    var activeFoodItems: [FoodItemType] {
        get {
            return self._activeFoodItems
        }
    }
    
    func addFoodItem(type: FoodItemType) {
        self._activeFoodItems.append(type)
    }
    
    func removeFoodItem(type: FoodItemType) {
        if let index = self._activeFoodItems.firstIndex(of: type) {
            self._activeFoodItems.remove(at: index)
        }
    }
    
}
