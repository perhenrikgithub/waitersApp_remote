//
//  WineCellar.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import Foundation

class WineList {
    var items: [WineBottle]

    init() {
        self.items = []
    }

    func addItem(_ item: WineBottle) {
        items.append(item)
    }

    func removeItem(_ item: WineBottle) {
        if let index = items.firstIndex(where: { $0 === item }) {
            items.remove(at: index)
        } else {
            print("Item not found in the menu.")
        }
    }
    
    func getItems() -> [WineBottle] {
        return self.items
    }
}
