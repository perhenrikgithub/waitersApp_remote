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
            
            Text("Allergies")
                .font(.system(size: 32))
                .padding(.top)

            VStack (alignment: .leading) {
                if menuItem.allergens != nil {
                    ForEach(menuItem.allergens!, id: \.self) { allergy in
                        HStack {
                            AllergyCellView(allergy: allergy)
                            Spacer()
                        }
                    }
                } else {
                    Text("No allergies :)")
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.95)
            
            Text("Wine Pairings")
                .font(.system(size: 32))
                .padding(.top)
            
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95)
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(menuItem:
            MenuItem(
                name: "Pasta Carbonara",
                description: "A beloved Roman pasta dish, Pasta Carbonara is a perfect combination of traditional guanciale or pancetta, Pecorino Romano cheese, eggs, and black pepper. The sauce is velvety and comforting, and it beautifully coats the al dente spaghetti.",
                price: 179.50,
                isVegetarian: true,
                isVegan: true,
                allergens: [
                    Allergy(allergyType: .celery, canBeMadeWithout: true),
                    Allergy(allergyType: .eggs, canBeMadeWithout: true),
                    Allergy(allergyType: .sesameSeeds, canBeMadeWithout: true),
                    Allergy(allergyType: .gluten, canBeMadeWithout: false)],
                type: [.pasta]
            )
        )
    }
}
