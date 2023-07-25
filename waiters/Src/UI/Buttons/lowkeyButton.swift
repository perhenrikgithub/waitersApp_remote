//
//  lowkeyButton.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import SwiftUI

import SwiftUI



struct lowkeyButton: View {
    
    var title: String
    var background = Color("SolidGray_100")
    var imageSystemNameString: String
    
    init(title: String, imageSystemNameString: String) {
        self.title = title
        self.imageSystemNameString = imageSystemNameString
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(self.background)
            HStack {
                Image(systemName: "\(self.imageSystemNameString)")
                Text("\(self.title)")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(Color.blue)
        }
        .frame(height: 35)
    }
}


struct lowkeyButton_Previews: PreviewProvider {
    static var previews: some View {
        lowkeyButton(title: "aaaaaaaa", imageSystemNameString: "pencil")
    }
}
