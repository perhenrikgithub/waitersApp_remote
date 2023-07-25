//
//  UserController.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 22/07/2023.
//

import Foundation

class Users {
    private var users: [User] = []
    
    func add(user: User) {
        self.users.append(user)
    }
    
    func remove(user: User) {
        self.users.removeAll {$0 == user}
    }
}
