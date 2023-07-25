//
//  SelecterCellView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI

struct SelecterCellView: View {
    @State var active = false
    var content: String
    

    init(content: String) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            if self.active {
                RoundedRectangle(cornerRadius: 10000)
                    .foregroundColor(Color(UIColor.systemGray4))
            } else {
                RoundedRectangle(cornerRadius: 10000)
                    .foregroundColor(.white)
            }
            RoundedRectangle(cornerRadius: 10000)
                .stroke(lineWidth: 2)
            Text(self.content)
                .padding()
        }
        .onTapGesture {
            self.active.toggle()
        }
        .fixedSize()
    }
}

struct SelecterCellView_Previews: PreviewProvider {
    static var previews: some View {
        SelecterCellView(content: "content")
    }
}
