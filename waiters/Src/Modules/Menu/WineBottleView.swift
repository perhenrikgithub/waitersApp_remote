//
//  WineBottleView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI

struct WineBottleView: View {
    private var wineBottle: WineBottle
    
    init(wineBottle: WineBottle) {
        self.wineBottle = wineBottle
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(wineBottle.name)
                .font(.system(size: 28).bold())
                .padding(.top)
            
            if wineBottle.description != nil {
                Text(wineBottle.description!)
            }
            
            if wineBottle.countryOfOrigin != nil {
                Text("Country of origin: " + wineBottle.countryOfOrigin!)
                    .foregroundColor(Color(UIColor.darkGray))
                    .italic()
                    .padding(.top, 1)
            }
            
            
            WineBottleLineView(wineBottle: wineBottle, haveTitle: false)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95)
    }
}

struct WineBottleView_Previews: PreviewProvider {
    static var previews: some View {
        WineBottleView(wineBottle: WineBottle(
            countryOfOrigin: "Spain",
            priceAsBottle: 14.50,
            priceAsGlass: 7,
            winetype: .rose,
            alcoholContent: 11.5,
            name: "Rosé Royale",
            description: "A delightful Spanish rosé with floral aromas and a soft finish.",
            price: 17.99
        )
        )
    }
}
