//
//  Header.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI

struct Header: View {
    private var showProfileIcon: Bool
    
    init(showProfileIcon: Bool = false) {
        self.showProfileIcon = showProfileIcon
    }
    
    var body: some View {
        VStack {
            ZStack {
                if showProfileIcon {
                    HStack {
                        Spacer()
                        NavigationLink (
                            destination: UserView().navigationBarBackButtonHidden(true)
                        ) {
                            Image(systemName: "person.circle")
                                .font(.system(size: CGFloat(28)))
                                .foregroundColor(Color("MainText"))
                                .padding(.horizontal)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                }
                Logo(fontSize: 28, fontColor: Color(.red), spacing: 6)
            }
            .frame(width: UIScreen.main.bounds.width, height: 30)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(.lightGray))
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Header(showProfileIcon: true)
            Spacer()
        }
    }
}
