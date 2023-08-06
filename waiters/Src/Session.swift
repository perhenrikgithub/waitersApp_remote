//
//  Session.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 05/08/2023.
//

import Foundation

class Session: ObservableObject {
    @Published var activeUser: User
    
    init(activeUser: User) {
        self.activeUser = activeUser
    }
}
