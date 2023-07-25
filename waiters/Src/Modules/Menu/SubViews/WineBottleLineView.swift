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
    
    init(wineBottle: WineBottle, haveTitle: Bool = true) {
        self.wineBottle = wineBottle
        self.haveTitle = haveTitle
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
                            Image(systemName: "wineglass")
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
                        Text(priceStringifier(price: wineBottle.priceAsBottle))
                            .padding(.horizontal, 5)
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
                name: "Primo Nebluso",
                priceAsBottle: 410,
                priceAsGlass: 115,
                description: "description"), haveTitle: false)
            WineBottleLineView(wineBottle: WineBottle(
                name: "Biano Sinfanio",
                priceAsBottle: 385,
                description: "description"))
        }
    }
}
