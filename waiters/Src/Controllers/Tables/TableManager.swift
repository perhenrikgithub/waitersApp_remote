//
//  TableManager.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import Foundation

class TableManager {
    private var tables: [Table] = []
    
    func add(table: Table) {
        if !self.tables.contains(table) {
            self.tables.append(table)
        }
    }
    
    func remove(table: Table) {
        self.tables.removeAll {$0 == table}
    }
}
