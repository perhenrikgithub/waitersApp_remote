//
//  TLButton.swift
//  TodoList
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI



struct LoginButton: View {
    
    var title: String
    var background: Color
    
    init(title: String, background: Color) {
        self.title = title
        self.background = background
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(self.background)
            Text(self.title)
                .autocapitalization(.none)
                .font(.system(size: 28).bold())
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.all)
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, height: 65)
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(title: "title", background: Color.red)
    }
}
