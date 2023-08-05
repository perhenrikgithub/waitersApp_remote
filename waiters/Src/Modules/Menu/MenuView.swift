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
    @StateObject var selectorModel = SelectorModel()
    
    private var menu: Menu
    private var connectedTable: Table
    
    init(menu: Menu, connectedTable: Table) {
        self.menu = menu
        self.connectedTable = connectedTable
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Header()
                HStack {
                    NavigationLink {
                        SpecificTableView(table: self.connectedTable).navigationBarBackButtonHidden(true)
                    } label: {
                        Image(systemName: "chevron.left")
                            .padding(.vertical, 5)
                            .font(.system(size: 28))
                            .foregroundColor(.black)
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 5) {
                            ForEach(FoodItemType.allCases, id: \.rawValue) { foodItemType in
                                SelecterCellView(foodItemType: foodItemType, selectorModel: self.selectorModel)
                            }
                            
                            // todo: add drinks to menu
                            
                            
                        }
                    }

                }
                .padding(.horizontal)

                
                
                ScrollView {
                    VStack (spacing: 0) {
                        ForEach(FoodItemType.allCases, id: \.rawValue) { foodItemType in
                            // if selector of type is active (green), or if none are selected (count == 0)
                            if selectorModel.activeFoodItems.contains(foodItemType) || selectorModel.activeFoodItems.count == 0 {
                                VStack (alignment: .leading, spacing: 0) {
                                    Text(foodItemType.rawValue) // Section header like 'Pasta'
                                        .font(.system(size: 64))
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    
                                    ForEach(self.menu.getItems()) { item in
                                        if let foodItem = item as? FoodItem {
                                            if foodItem.type == foodItemType {
                                                HStack {
                                                        NavigationLink(
                                                            destination: FoodItemView(foodItem: foodItem)
                                                        ) {
                                                            VStack (alignment: .leading, spacing: 0) {
                                                                Text(foodItem.name)
                                                                    .font(.system(size: 22))
                                                                    .multilineTextAlignment(.leading)
                                                                Spacer()
                                                                Text(priceStringifier(price: foodItem.price))
                                                                    .font(.system(size: 32))
                                                            }
                                                        }
                                                    .foregroundColor(.black)
                                                    
                                                    Spacer()

                                                    VStack {
                                                        addItemButton(menuItem: foodItem)
                                                    }
                                                }
                                                .padding(.horizontal)
                                                .padding(.bottom)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        // todo: drinks
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
                isVegetarian: true,
                isVegan: false,
                type: .pasta,
                course: .main,
                name: "Truffle Risotto",
                description: "Creamy Arborio rice cooked with black truffles and Parmigiano-Reggiano.",
                price: 45.99,
                allergens: [Allergy(allergyType: .milk, canBeMadeWithout: false)]
            ),
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .pasta,
                course: .main,
                name: "Lobster Linguine",
                description: "Fresh lobster tossed with linguine pasta, cherry tomatoes, and garlic butter sauce.",
                price: 59.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: false),
                            Allergy(allergyType: .crustaceans, canBeMadeWithout: false)]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: true,
                type: .pasta,
                course: .main,
                name: "Porcini Mushroom Risotto",
                description: "Delicate Arborio rice cooked with aromatic porcini mushrooms and truffle oil.",
                price: 48.99,
                allergens: [Allergy(allergyType: .milk, canBeMadeWithout: false)]
            ),
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .antipasti,
                course: .appetizer,
                name: "Beef Carpaccio",
                description: "Thinly sliced raw beef served with arugula, Parmesan shavings, and balsamic reduction.",
                price: 54.99,
                allergens: nil
            ),
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .seafood,
                course: .entree,
                name: "Branzino al Sale",
                description: "Whole Mediterranean sea bass encrusted in salt and baked to perfection.",
                price: 65.99,
                allergens: nil
            ),
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .pasta,
                course: .main,
                name: "Pappardelle with Wild Boar Ragù",
                description: "Wide ribbon pasta served with a rich and hearty wild boar ragù sauce.",
                price: 49.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: false),
                            Allergy(allergyType: .celery, canBeMadeWithout: false)]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: false,
                type: .antipasti,
                course: .appetizer,
                name: "Burrata Caprese Salad",
                description: "Creamy burrata cheese with ripe heirloom tomatoes, basil, and balsamic glaze.",
                price: 39.99,
                allergens: [Allergy(allergyType: .milk, canBeMadeWithout: false)]
            ),
            FoodItem(
                isVegetarian: true,
                isVegan: false,
                type: .dessert,
                course: .dessert,
                name: "Tiramisu",
                description: "Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese.",
                price: 34.99,
                allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: false),
                            Allergy(allergyType: .eggs, canBeMadeWithout: false),
                            Allergy(allergyType: .milk, canBeMadeWithout: false)]
            ),
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .seafood,
                course: .entree,
                name: "Osso Buco Milanese",
                description: "Tender veal shanks braised with vegetables, white wine, and gremolata.",
                price: 69.99,
                allergens: nil
            ),
            FoodItem(
                isVegetarian: false,
                isVegan: false,
                type: .zuppe,
                course: .appetizer,
                name: "Lobster Bisque",
                description: "Velvety soup made with fresh lobster, cream, and aromatic spices.",
                price: 42.99,
                allergens: [Allergy(allergyType: .crustaceans, canBeMadeWithout: false),
                            Allergy(allergyType: .milk, canBeMadeWithout: false)]
            )
        ]
        )
        MenuView(menu: menu, connectedTable: Table(tableNumber: 9, capacity: 9, isReserved: true, isByWindow: true))
    }
}
