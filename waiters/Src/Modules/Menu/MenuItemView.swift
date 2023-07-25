//
//  MenuItemView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI

struct MenuItemView: View {
    var menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(menuItem.name)
                .font(.system(size: 32).bold())
            Text(menuItem.description)
                .foregroundColor(.gray)
            Text(priceStringifier(price: menuItem.price))
                .font(.system(size: 20))
                .padding(.bottom)
            
            if menuItem.isVegan {
                Label("Vegan", systemImage: "carrot.fill")
                    .font(.system(size: 20))
            } else if menuItem.isVegetarian {
                Label("Vegetarian", systemImage: "leaf.fill")
                    .font(.system(size: 20))
            } else {
                HStack {
                    ZStack {
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 20))
                        Image(systemName: "xmark")
                            .foregroundColor(.yellow)
                            .font(.system(size: 32))
                    }
                    Text("Non-vegetarian")
                        .font(.system(size: 20))
                }
            }
            
            Text("Allergies & preferences")
                .font(.system(size: 32))
                .padding(.top)

            VStack (alignment: .leading) {
                ForEach(menuItem.allergens, id: \.self) { allergy in
                    HStack {
                        AllergyCellView(allergy: allergy)
                        Spacer()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.95)
            
            Text("Wine Recomandations")
                .font(.system(size: 32))
                .padding(.top)
            
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95)
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menuItem: DB().menu.items.first!)
    }
}
