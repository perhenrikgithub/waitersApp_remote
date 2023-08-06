//
//  User.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 22/07/2023.
//

import Foundation

class User: Equatable {
    private var _username: String
    private var _userID: Int
    private var _isAdmin: Bool
    private var _tables: [Table]
    
    init(username: String, userID: Int, isAdmin: Bool = false, tables: [Table] = []) {
        self._username = username
        self._userID = userID
        self._isAdmin = isAdmin
        self._tables = tables
    }
    
    func addTable(table: Table) {
        if !_tables.contains(table) {
            self._tables.append(table)
        }
    }
    func addTable(tables: [Table]) {
        for table in tables {
            if !_tables.contains(table) {
                self._tables.append(table)
            }
        }
    }
    
    func removeTable(table: Table) {
        self._tables.removeAll {$0 == table}
    }
    
    var tables: [Table] {
        return self._tables
    }
    
    var username: String {
        return self._username
    }
    
    var userID: Int {
        return self._userID
    }
    
    var isAdmin: Bool {
        return self._isAdmin
    }
    
    static func == (user1: User, user2: User) -> Bool {
        return user1.userID == user2.userID
    }
}
