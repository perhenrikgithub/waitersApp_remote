//
//  Table.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 22/07/2023.
//

import Foundation

class Table: Equatable {
    private var tableNumber: Int
    private var capacity: Int
    private var isReserved: Bool
    private var isByWindow: Bool
    
    init(tableNumber: Int, capacity: Int, isReserved: Bool, isByWindow: Bool) {
        self.tableNumber = tableNumber
        self.capacity = capacity
        self.isReserved = isReserved
        self.isByWindow = isByWindow
    }
    
    func getTableNumber() -> Int {
        return self.tableNumber
    }
    
    func getCapacity() -> Int {
        return self.capacity
    }
    
    func isTableReserved() -> Bool {
        return self.isReserved
    }
    
    func isTableByWindow() -> Bool {
        return self.isByWindow
    }
    
    static func == (table1: Table, table2: Table) -> Bool {
        return table1.getTableNumber() == table2.getTableNumber()
    }
}
