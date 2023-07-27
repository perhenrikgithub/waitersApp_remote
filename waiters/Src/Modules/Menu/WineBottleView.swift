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
            
            Text(wineBottle.description)
            
            WineBottleLineView(wineBottle: wineBottle, haveTitle: false)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95)
    }
}

struct WineBottleView_Previews: PreviewProvider {
    static var previews: some View {
        WineBottleView(wineBottle: WineBottle(
            name: "Riserva d'Oro Amaranto",
            priceAsBottle: 560.0,
            description: "A luscious red wine made from a rare blend of Nebbiolo, Sangiovese, and Aglianico grapes, aged for a minimum of 10 years in oak barrels, resulting in a full-bodied wine with rich flavors of black cherries, tobacco, and hints of dark chocolate.",
            winetype: .red
        )
        )
    }
}
