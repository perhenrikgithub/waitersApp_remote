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
    
    var body: some View {
        VStack {
            ForEach(db.menu.getItems()) { item in
                VStack (alignment: .leading) {
                    Text(item.name)
                        .font(.system(size: 32).bold())
                    Text(item.description)
                        .foregroundColor(.gray)
                    Text(priceStringifier(price: item.price))
                        .font(.system(size: 20))
                        .padding(.bottom)
                    
                    if item.isVegan {
                        Label("Vegan", systemImage: "carrot.fill")
                            .font(.system(size: 20))
                    } else if item.isVegetarian {
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
                    
                    Text("Allergies & preferences")
                        .font(.system(size: 32))
                        .padding(.top)

                    
                    
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.95)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
