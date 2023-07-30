//
//  WineBottleView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI

struct WineBottleLineView: View {
    var wineBottle: WineBottle
    var haveTitle: Bool
    var iconGlassString = "icon_glassOfWine_"
    var iconBottleString = "icon_bottleOfWine_"
    
    init(wineBottle: WineBottle, haveTitle: Bool = true) {
        self.wineBottle = wineBottle
        self.haveTitle = haveTitle
        if wineBottle.type == .natural {
            self.iconGlassString += "natural"
            self.iconBottleString += "natural"
        } else if wineBottle.type == .red {
            self.iconGlassString += "red"
            self.iconBottleString += "red"
        } else if wineBottle.type == .sparkling {
            self.iconGlassString += "sparkling"
            self.iconBottleString += "sparkling"
        } else if wineBottle.type == .white {
            self.iconGlassString += "white"
            self.iconBottleString += "white"
        } else if wineBottle.type == .rose {
            self.iconGlassString += "rose"
            self.iconBottleString += "rose"
        }
    }
    
    var body: some View {
        HStack {
            
            if self.haveTitle {
                Text(wineBottle.name)
            }
            
            Spacer()
            
            HStack (spacing: 10){
                // some wines are only available as bottle
                if wineBottle.priceAsGlass != nil {
                    ZStack {
                        RoundedRectangle(cornerRadius: 1000)
                            .stroke(lineWidth: 2)
                        HStack (spacing: 0) {
                            Image(self.iconGlassString)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 10)
                                .padding(.trailing, 5)
                            
                            Text(priceStringifier(price: wineBottle.priceAsGlass!))
                            
                            Spacer()
                        }
                        .padding(.vertical,5)
                        
                    }
                    .font(.system(size: 16))
                    .fixedSize()
                }
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 1000)
                        .stroke(lineWidth: 2)
                    HStack (spacing: 0) {
                        Image(self.iconBottleString)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 10)
                            .padding(.trailing, 5)
                        
                        Text(priceStringifier(price: wineBottle.priceAsBottle))
                        
                        Spacer()
                    }
                    .padding(.vertical,5)
                    
                }
                .font(.system(size: 16))
                .fixedSize()
            }
            .frame(height: 30)
        }
        .padding(.horizontal)
    }
}

struct WineBottleLineView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WineBottleLineView(wineBottle: WineBottle(
                countryOfOrigin: "France",
                priceAsBottle: 25.99,
                winetype: .red,
                alcoholContent: 13.5,
                name: "Château de Bordeaux",
                description: "A rich and smooth Bordeaux red wine with fruity notes.",
                price: 29.99
            ))
            
            WineBottleLineView(wineBottle: WineBottle(
                countryOfOrigin: "Italy",
                priceAsBottle: 18.75,
                winetype: .white,
                alcoholContent: 12.0,
                name: "Pinot Grigio",
                description: "A crisp and refreshing Italian white wine with hints of citrus.",
                price: 22.99
            ))
            
            WineBottleLineView(wineBottle: WineBottle(
                countryOfOrigin: "Spain",
                priceAsBottle: 14.50,
                winetype: .rose,
                alcoholContent: 11.5,
                name: "Rosé Royale",
                description: "A delightful Spanish rosé with floral aromas and a soft finish.",
                price: 17.99
            ))

        }
    }
}
