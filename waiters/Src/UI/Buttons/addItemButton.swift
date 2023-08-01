//
//  addItemButton.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 26/07/2023.
//

import SwiftUI

struct addItemButton: View {
    var menuItem: MenuItem
    
    @State var numberOfItems = 0
    @State private var name = ""
    @State private var showingAlert = false
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        
        HStack {
            if self.numberOfItems != 0 {
                ZStack {
                    Circle()
                        .frame(width: 40)
                        .foregroundColor(Color(.red))
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.white)
                        .font(.system(size: 16).bold())
                }
                .onTapGesture {
                    showingAlert.toggle()
                }
                .alert("👩‍🍳🧑‍🍳👨‍🍳", isPresented: $showingAlert) {
                    TextField("Comment here...", text: $name)
                    Button("OK", action: {
                        menuItem.orderComment = self.name
                    })
                } message: {
                    Text("Comment something to the chef")
                }
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10000)
                    .foregroundColor(Color(.red))
                if self.numberOfItems == 0 {
                    HStack (spacing: 5) {
                        Image(systemName: "plus")
                            .font(.system(size: 24))
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 14).bold())
                } else {
                    HStack (spacing: 0) {
                        Image(systemName: "minus.circle")
                            .font(.system(size: 22).bold())
                            .onTapGesture {
                                if self.numberOfItems > 0 {
                                    self.numberOfItems -= 1
                                    menuItem.decreaseOrderAmount()
                                }
                            }
                        Spacer()
                        Text(String(self.numberOfItems))
                        Spacer()
                            .foregroundColor(.black)
                        Image(systemName: "plus.circle")
                            .font(.system(size: 22).bold())
                    }
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .font(.system(size: 18).bold())
                    .onTapGesture {
                        self.numberOfItems += 1
                        menuItem.increaseOrderAmount()
                    }
                }
            }
            .frame(width: 135, height: 40)
            .onTapGesture {
                if self.numberOfItems == 0 {
                    self.numberOfItems += 1
                    menuItem.increaseOrderAmount()
                }
            }
            
                
                
            
            
        }
    }
}

struct addItemButton_Previews: PreviewProvider {
    static var previews: some View {
        addItemButton(menuItem: MenuItem(name: "", description: "", price: 0))
    }
}
