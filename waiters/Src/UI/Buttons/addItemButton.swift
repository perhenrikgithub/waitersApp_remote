//
//  addItemButton.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 26/07/2023.
//

import SwiftUI

struct addItemButton: View {
    @State var numberOfItems = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10000)
                .foregroundColor(Color(.red))
            if self.numberOfItems == 0 {
                HStack (spacing: 5) {
//                    Image(systemName: "bag.fill")
//                    Text("Add To Order")
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                }
                .onTapGesture {
                    self.numberOfItems += 1
                }
                .foregroundColor(.white)
                .font(.system(size: 14).bold())
            } else {
                HStack {
                    Image(systemName: "minus.circle")
                        .onTapGesture {
                            self.numberOfItems -= 1
                        }
                    Spacer()
                    Text(String(self.numberOfItems))
                        .onTapGesture {
                            self.numberOfItems += 1
                        }
                    Spacer()
                    Image(systemName: "plus.circle")
                        .onTapGesture {
                            self.numberOfItems += 1
                        }
                }
                .padding(.horizontal, 10)
                .foregroundColor(.white)
                .font(.system(size: 18).bold())
            }
        }
        .frame(width: 135, height: 40)
    }
}

struct addItemButton_Previews: PreviewProvider {
    static var previews: some View {
        addItemButton()
    }
}
