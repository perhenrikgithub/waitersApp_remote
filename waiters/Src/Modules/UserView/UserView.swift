//
//  UserView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI

struct UserView: View {
    // to handle custom '< back'-button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var username: String
    private var isAdmin: Bool
    private var userID: Int
    
    
    init(user: User = User(username: "standardUser", userID: 1, isAdmin: false)) {
        self.username = user.username
        self.isAdmin = user.isAdmin
        self.userID = user.userID
    }
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // custom back button
                // -> "in view" (over the view in z-axis
                // (instead of over it in y-axis like the built in one))
                // -> main content becomes dead center, rather then pushed down by nav
                VStack {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .bold()
                                Text("Back") // You can use any custom view here
                                    
                            }
                            .foregroundColor(.blue)
                            .font(.system(size: 18))
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal, 10)
                
                // main content
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
                 
                // Logout
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
        UserView(user: User(username: "userDoesNotExist", userID: 0, isAdmin: true))
    }
}
