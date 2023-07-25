//
//  User.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 22/07/2023.
//

import Foundation

class User: Equatable {
    private var username: String
    private var userID: Int
    private var isAdmin: Bool
    
    init(username: String, userID: Int, isAdmin: Bool = false) {
        self.username = username
        self.userID = userID
        self.isAdmin = isAdmin
    }
    
    func getUsername() -> String {
        return self.username
    }
    
    func getUserID() -> Int {
        return self.userID
    }
    
    func isUserAdmin() -> Bool {
        return self.isAdmin
    }
    
    static func == (user1: User, user2: User) -> Bool {
        return user1.userID == user2.userID
    }
}
