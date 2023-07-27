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
    @StateObject var db = DB()
    @State var isFilterActive = false
    
    var menu = Menu(menu: [
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
        ),
        MenuItem(
            name: "Linguine alle Vongole",
            description: "This delightful seafood pasta originates from Naples. Linguine alle Vongole is a delicious medley of linguine pasta and fresh clams cooked with garlic, white wine, cherry tomatoes, and parsley. It offers a taste of the sea with every bite.",
            price: 199.00,
            isVegetarian: false,
            isVegan: false,
            allergens: [
                Allergy(allergyType: .celery, canBeMadeWithout: true),
                Allergy(allergyType: .eggs, canBeMadeWithout: true),
                Allergy(allergyType: .sesameSeeds, canBeMadeWithout: true)],
            type: [.pasta]
        ), MenuItem(
            name: "Gnocchi al Pesto Genovese",
            description: "Soft potato gnocchi tossed in a vibrant green sauce made with fresh basil leaves, pine nuts, garlic, olive oil, and Parmigiano-Reggiano cheese. Gnocchi al Pesto Genovese is a delightful and aromatic dish that captures the essence of Genoa, Italy.",
            price: 185.00,
            isVegetarian: true,
            isVegan: false,
            allergens: [
                Allergy(allergyType: .celery, canBeMadeWithout: true),
                Allergy(allergyType: .eggs, canBeMadeWithout: true),
                Allergy(allergyType: .sesameSeeds, canBeMadeWithout: true),
                Allergy(allergyType: .gluten, canBeMadeWithout: false)],
            type: [.pasta]
        ),
        MenuItem(
            name: "Ravioli di Zucca",
            description: "These exquisite ravioli are filled with a luscious mixture of roasted butternut squash, ricotta cheese, and a touch of nutmeg. The dish is completed with a sage-infused brown butter sauce and a sprinkling of toasted pine nuts.",
            price: 195.50,
            isVegetarian: true,
            isVegan: false,
            allergens: [Allergy(allergyType: .celery, canBeMadeWithout: true), Allergy(allergyType: .eggs, canBeMadeWithout: true), Allergy(allergyType: .sesameSeeds, canBeMadeWithout: true), Allergy(allergyType: .gluten, canBeMadeWithout: false)],
            type: [.pasta]
        ),
        MenuItem(
            name: "Orecchiette con Broccoli e Salsiccia",
            description: "Hailing from the Puglia region of Italy, Orecchiette con Broccoli e Salsiccia is a hearty dish that combines ear-shaped pasta with sautéed broccoli, savory Italian sausage, garlic, and a touch of chili flakes. It's a burst of flavors in every mouthful.",
            price: 189.75,
            isVegetarian: false,
            isVegan: false,
            allergens: [Allergy(allergyType: .gluten, canBeMadeWithout: false)],
            type: [.antipasti]
        )
    ])
    
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
                        SelecterCellView(content: "Main")
                        SelecterCellView(content: "Pasta")
                        SelecterCellView(content: "Antipasti")
                        SelecterCellView(content: "Zuppe")
                        SelecterCellView(content: "Pizza")
                        SelecterCellView(content: "Red Wine")
                        SelecterCellView(content: "White Wine")
                        SelecterCellView(content: "Non alcholic")
                    }
                }
                .padding(.horizontal, 5)
                
                ScrollView {
                    VStack (spacing: 0) {
                        Text("Pasta")
                            .font(.system(size: 32))
                        
                        ForEach(self.menu.getItems()) { item in
                            if item.type != nil {
                                if item.type!.contains(MenuItemType.pasta) {
                                    VStack (alignment: .leading, spacing: 0) {
                                        Text(item.name)
                                            .font(.system(size: 22))
                                        HStack {
                                            Text(priceStringifier(price: item.price))
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
