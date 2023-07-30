//
//  MenuView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import SwiftUI

func priceStringifier(price: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency // This will format the number as a currency
    
    numberFormatter.currencySymbol = ""
    
    if let formattedString = numberFormatter.string(from: NSNumber(value: price)) {
        return formattedString
    } else {
        return "Invalid Price"
    }
}


struct MenuView: View {
    @State var isFilterActive = false
    
    var menu: Menu
    
    init(menu: Menu) {
        self.menu = menu
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Header()
                HStack {
                    NavigationLink {
                        SpecificTableView()
                    } label: {
                        Image(systemName: "chevron.left")
                    }

                    Spacer()

                    HStack {
                        Text("Filters?")
                        Image(systemName: "waveform")
                    }
                    .onTapGesture {
                        self.isFilterActive.toggle()
                    }
                }
                .padding(.horizontal)
                .font(.system(size: 28))
                .foregroundColor(.black)

                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 5) {
                        ForEach(FoodItemType.allCases, id: \.rawValue) { foodItemType in
                            SelecterCellView(content: foodItemType.rawValue)
                        }
                        
                        // todo: add drinks to menu
                        
                        
                    }
                }
                .padding(.horizontal, 5)
                
                ScrollView {
                    ForEach(FoodItemType.allCases, id: \.rawValue) { foodItemType in
                        
                        VStack (spacing: 0) {
                            Text(foodItemType.rawValue)
                                .font(.system(size: 32))
                            
                            ForEach(self.menu.getItems()) { item in
                                if let foodItem = item as? FoodItem {
                                    if foodItem.type == foodItemType {
                                        VStack (alignment: .leading, spacing: 0) {
                                            Text(foodItem.name)
                                                .font(.system(size: 22))
                                            HStack {
                                                Text(priceStringifier(price: foodItem.price))
                                                    .font(.system(size: 32))
                                                Spacer()
                                                addItemButton()
                                            }

                                        }
                                        .padding()
                                        .overlay(Divider().background(Color.black), alignment: .top)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let menu = Menu(menu: [
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
                    Allergy(allergyType: .eggs, canBeMadeWithout: true)
                ]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: false,
                type: .antipasti,
                course: .appetizer,
                name: "Gourmet Antipasti Platter",
                description: "An exquisite selection of imported Italian cheeses, artisanal cured meats, marinated olives, grilled artichokes, and sun-dried tomatoes.",
                price: 34.99
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: true,
                type: .zuppe,
                course: .appetizer,
                name: "Velvety Tomato Bisque",
                description: "A velvety tomato bisque made from San Marzano tomatoes, drizzled with cold-pressed olive oil, and garnished with fresh basil leaves.",
                price: 19.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: true)]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: false,
                type: .pizza,
                course: .main,
                name: "Truffle Burrata Margherita Pizza",
                description: "A divine thin-crust pizza topped with San Marzano tomato sauce, creamy burrata cheese, fresh basil, and a hint of aromatic black truffle oil.",
                price: 42.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: true)]
            ),
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
                    Allergy(allergyType: .eggs, canBeMadeWithout: true)
                ]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: false,
                type: .antipasti,
                course: .appetizer,
                name: "Gourmet Antipasti Platter",
                description: "An exquisite selection of imported Italian cheeses, artisanal cured meats, marinated olives, grilled artichokes, and sun-dried tomatoes.",
                price: 34.99
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: true,
                type: .zuppe,
                course: .appetizer,
                name: "Velvety Tomato Bisque",
                description: "A velvety tomato bisque made from San Marzano tomatoes, drizzled with cold-pressed olive oil, and garnished with fresh basil leaves.",
                price: 19.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: true)]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: false,
                type: .pizza,
                course: .main,
                name: "Truffle Burrata Margherita Pizza",
                description: "A divine thin-crust pizza topped with San Marzano tomato sauce, creamy burrata cheese, fresh basil, and a hint of aromatic black truffle oil.",
                price: 42.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: true)]
            )
        ]
        )
        MenuView(menu: menu)
    }
}
