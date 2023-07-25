//
//  HamburgerMenu.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 17/07/2023.
//

import SwiftUI

struct HamburgerMenu: View {
    var width: Float
    var height: Float
    var spacing: Float
    var color: Color
    var action: () -> Void
    
    init(width: Float = 30, height: Float = 5, spacing: Float = 5, color: Color = Color("MainText"), action: @escaping () -> Void){
        self.width = width
        self.height = height
        self.spacing = spacing
        self.color = color
        self.action = action
    }
    
    
    var body: some View {
        Button(action: action) {
            VStack (spacing: CGFloat(self.spacing)) {
                Rectangle()
                    .frame(width: CGFloat(self.width), height: CGFloat(self.height))
                Rectangle()
                    .frame(width: CGFloat(self.width), height: CGFloat(self.height))
                Rectangle()
                    .frame(width: CGFloat(self.width), height: CGFloat(self.height))
            }
            .foregroundColor(self.color)
        }
    }
}


struct HamburgerMenu_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenu() {
            print("- - -")
        }
    }
}
