//
//  LogoView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI

struct Logo: View {

    var fontSize: Float
    var fontColor: Color
    var spacing: Float
    
    init(fontSize: Float, fontColor: Color, spacing: Float = 8) {
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.spacing = spacing
    }
    
    
    var body: some View {
        HStack (spacing: CGFloat(self.spacing)) {
            Text("WAITERS")
                .font(.system(size: CGFloat(fontSize)))
                .foregroundColor(fontColor)
            
            Rectangle()
                .frame(width: CGFloat(fontSize) / 3, height: CGFloat(fontSize))
                .foregroundColor(fontColor)
            
            Rectangle()
                .frame(width: CGFloat(fontSize) / 3, height: CGFloat(fontSize))
                .foregroundColor(fontColor.opacity(0.6))
            
            Rectangle()
                .frame(width: CGFloat(fontSize) / 3, height: CGFloat(fontSize))
                .foregroundColor(fontColor.opacity(0.3))
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo(fontSize: 50, fontColor: Color.red)
    }
}
