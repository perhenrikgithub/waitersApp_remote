//
//  DB.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 23/07/2023.
//

import Foundation

class DB: ObservableObject {
    @Published var menu = Menu()
    
    init() {
        // Pasta Carbonara
        // Create instances for an Italian restaurant menu with pasta dishes (more expensive)

        // Pasta Carbonara
        let item1 = MenuItem(
            name: "Pasta Carbonara",
            description: "A beloved Roman pasta dish, Pasta Carbonara is a perfect combination of traditional guanciale or pancetta, Pecorino Romano cheese, eggs, and black pepper. The sauce is velvety and comforting, and it beautifully coats the al dente spaghetti.",
            price: 179.50,
            isVegetarian: true,
            isVegan: true,
            allergens: [.celery, .crustaceans, .eggs, .fish, .sulphurDioxide]
        )

        // Linguine alle Vongole
        let item2 = MenuItem(
            name: "Linguine alle Vongole",
            description: "This delightful seafood pasta originates from Naples. Linguine alle Vongole is a delicious medley of linguine pasta and fresh clams cooked with garlic, white wine, cherry tomatoes, and parsley. It offers a taste of the sea with every bite.",
            price: 199.00,
            isVegetarian: false,
            isVegan: false,
            allergens: [.gluten, .molluscs]
        )

        // Gnocchi al Pesto Genovese
        let item3 = MenuItem(
            name: "Gnocchi al Pesto Genovese",
            description: "Soft potato gnocchi tossed in a vibrant green sauce made with fresh basil leaves, pine nuts, garlic, olive oil, and Parmigiano-Reggiano cheese. Gnocchi al Pesto Genovese is a delightful and aromatic dish that captures the essence of Genoa, Italy.",
            price: 185.00,
            isVegetarian: true,
            isVegan: false,
            allergens: [.gluten, .nuts, .milk]
        )

        // Ravioli di Zucca
        let item4 = MenuItem(
            name: "Ravioli di Zucca",
            description: "These exquisite ravioli are filled with a luscious mixture of roasted butternut squash, ricotta cheese, and a touch of nutmeg. The dish is completed with a sage-infused brown butter sauce and a sprinkling of toasted pine nuts.",
            price: 195.50,
            isVegetarian: true,
            isVegan: false,
            allergens: [.gluten, .milk, .nuts]
        )

        // Orecchiette con Broccoli e Salsiccia
        let item5 = MenuItem(
            name: "Orecchiette con Broccoli e Salsiccia",
            description: "Hailing from the Puglia region of Italy, Orecchiette con Broccoli e Salsiccia is a hearty dish that combines ear-shaped pasta with sautéed broccoli, savory Italian sausage, garlic, and a touch of chili flakes. It's a burst of flavors in every mouthful.",
            price: 189.75,
            isVegetarian: false,
            isVegan: false,
            allergens: [.gluten]
        )

        
        menu.addItem(item1)
        //menu.addItem(item2)
        //menu.addItem(item3)
        //menu.addItem(item4)
        //menu.addItem(item5)

    }
    
    
}
