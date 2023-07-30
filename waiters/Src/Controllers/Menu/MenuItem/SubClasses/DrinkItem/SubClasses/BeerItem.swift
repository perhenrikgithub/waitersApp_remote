//
//  Beer.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 30/07/2023.
//

import Foundation

enum BeerStyle: String {
    case indiaPaleAle = "India Pale Ale"
    case imperialStout = "Imperial Stout"
    case lager = "Lager"
    case porter = "Porter"
    case wheatBeer = "Wheat Beer"
    case paleAle = "Pale Ale"
    case sourAle = "Sour Ale"
    case amberAle = "Amber Ale"
    case brownAle = "Brown Ale"
    case pilsner = "Pilsner"
    case blondeAle = "Blonde Ale"
    case barleywine = "Barleywine"
    case bock = "Bock"
    case other = "Other"
    // Add more styles here as needed
}

class BeerItem: DrinkItem {
    // Private properties
    private var style: BeerStyle
    private var brewery: String?
    private var country: String?
    
    // Initializer
    init(
        // BeerItem attributes
        style: BeerStyle,
        brewery: String? = nil,
        country: String? = nil,
        // super attributes
        alcoholContent: Double,
        isAlcoholic: Bool,
        name: String,
        description: String,
        price: Double,
        allergens: [Allergy]? = nil
    ) {
        self.style = style
        self.brewery = brewery
        self.country = country
        
        super.init(
            alcoholContent: alcoholContent,
            name: name,
            description: description,
            price: price,
            allergens: allergens
        )
    }
}

