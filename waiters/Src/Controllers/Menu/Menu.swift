//
//  Menu.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import Foundation

class Menu {
    var items: [MenuItem]

    init() {
        self.items = []
    }

    func addItem(_ item: MenuItem) {
        items.append(item)
    }

    func removeItem(_ item: MenuItem) {
        if let index = items.firstIndex(where: { $0 === item }) {
            items.remove(at: index)
        } else {
            print("Item not found in the menu.")
        }
    }
    
    func getItems() -> [MenuItem] {
        return self.items
    }
}
