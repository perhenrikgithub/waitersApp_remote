//
//  Header.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    NavigationLink (destination: UserView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "person.circle")
                            .font(.system(size: CGFloat(28)))
                            .foregroundColor(Color("MainText"))
                            .padding(.horizontal)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                Logo(fontSize: 28, fontColor: Color(.red))
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
            Header()
            Spacer()
        }
    }
}
