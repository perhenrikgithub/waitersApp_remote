//
//  LoginView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI


struct LoginView: View {
    @StateObject var viewModel = LoginModel()
    @State private var shouldNavigate: Bool?
    @State var errorMessage = " "
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Logo
                    ZStack {
                        Circle()
                            .foregroundColor(Color(.red))
                        Logo(fontSize: 38, fontColor: Color(.white), spacing: 6)
                    }
                    .padding(.horizontal, 50)
                    
                    InputField(secure: false, backgroundColor: Color("SolidGray_100"), textColor: Color.black, placeholder: "Username", textSize: 25, content: $viewModel.username)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: 65)
                    
                    InputField(secure: true, backgroundColor: Color("SolidGray_100"), textColor: Color.black, placeholder: "Password", textSize: 25, content: $viewModel.password)
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width, height: 65)
                    
                    VStack {
                        Button(action: {
                            if viewModel.login() {
                                shouldNavigate = true
                            } else {
                                self.errorMessage = viewModel.getErrorMessageString()
                            }
                            
                        }) {
                            LoginButton(title: "Login", background: Color(.red))
                        }
                    }
                    .background(
                        NavigationLink(
                            destination: TablesView()
                                .navigationBarBackButtonHidden(true), // Hide the "< Back" button
                            tag: true,
                            selection: $shouldNavigate
                        ) {
                            EmptyView()
                        }
                    )
                    
                    // Todo: Forgot password link
                    NavigationLink(destination: LoginView()) {
                        Text("Forgot Password")
                            .foregroundColor(.blue)
                    }
                }
                // Error message
                
                VStack {
                    Spacer()
                    Text(errorMessage)
                        .padding(.top)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
