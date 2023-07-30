//
//  FoodItemView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI

struct FoodItemView: View {
    var foodItem: FoodItem
    
    init(foodItem: FoodItem) {
        self.foodItem = foodItem
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(foodItem.name)
                .font(.system(size: 32).bold())
            if foodItem.description != nil {
                Text(foodItem.description!)
                    .foregroundColor(.gray)
            }
            Text(priceStringifier(price: foodItem.price))
                .font(.system(size: 20))
                .padding(.bottom)
            
            if foodItem.isVegan {
                Label("Vegan", systemImage: "carrot.fill")
                    .font(.system(size: 20))
            } else if foodItem.isVegetarian {
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
                if foodItem.allergens != nil {
                    ForEach(foodItem.allergens!, id: \.self) { allergy in
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

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(foodItem:
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .pasta,
                course: .main,
                name: "Truffle Carbonara",
                description: "Handcrafted truffle-infused pasta with organic eggs, aged Pecorino Romano, crispy pancetta, and freshly ground black truffle.",
                price: 27.99,
                allergens: [
                    Allergy(allergyType: .gluten, canBeMadeWithout: true),
                    Allergy(allergyType: .eggs, canBeMadeWithout: false)
                ]
            )
        )
    }
}
