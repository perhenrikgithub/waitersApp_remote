//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import Foundation


class LoginModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    init() {}
    
    func login() -> Bool {
        if self.username == "user" && self.password == "1234" {
            
            return true
        }
        
        return false
    }
    
    func getErrorMessageString() -> String {
        if self.username != "user" && self.password != "1234" {
            return "Wrong username and password"
        }
        
        if self.username != "user"{
            return "Wrong username"
        }
        
        if self.password != "1234" {
            return "Wrong password"
        }
        
        return " "
    }
}
