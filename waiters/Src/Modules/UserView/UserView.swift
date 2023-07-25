//
//  UserView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI

struct UserView: View {
    private var username: String
    private var isAdmin: Bool
    private var userID: Int
    
    init(user: User = User(username: "userDoesNotExist", userID: 0, isAdmin: true)) {
        self.username = user.getUsername()
        self.isAdmin = user.isUserAdmin()
        self.userID = user.getUserID()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: CGFloat(200)))
                        .foregroundColor(.accentColor)
                    Text("Hi, \(self.username)!")
                        .font(.system(size: CGFloat(28)))
                    Text("user ID: \(self.userID)")
                        .font(.system(size: CGFloat(16)))
                        .foregroundColor(.gray)
                    if isAdmin {
                        VStack {
                            NavigationLink {
                                ContentView().navigationBarBackButtonHidden(true)
                            } label: {
                                lowkeyButton(title: "Edit menu", imageSystemNameString: "menucard")
                                    .padding(.horizontal, 40)
                            }
                            
                            NavigationLink {
                                ContentView().navigationBarBackButtonHidden(true)
                            } label: {
                                lowkeyButton(title: "Edit Tables", imageSystemNameString: "table.furniture")
                                    .padding(.horizontal, 40)
                            }
                            
                            NavigationLink {
                                ContentView().navigationBarBackButtonHidden(true)
                            } label: {
                                lowkeyButton(title: "Dashboard", imageSystemNameString: "sparkles.tv")
                                    .padding(.horizontal, 40)
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Logout")
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .foregroundColor(.red)
                    }
                    
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
