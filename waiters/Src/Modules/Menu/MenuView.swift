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
                
                VStack {
                    Text("Pasta")
                        .font(.system(size: 32))
                    ForEach(db.menu.getItems()) { item in
                        if item.type.contains(MenuItemType.pasta) {
                            Rectangle()
                                .frame(height: 1)
                            VStack (alignment: .leading) {
                                Text(item.name)
                                    .font(.system(size: 22))
                                HStack {
                                    Text(priceStringifier(price: item.price))
                                        .font(.system(size: 32))
                                    Spacer()
                                    addItemButton()
                                }
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                ForEach(db.menu.getItems()) { item in
                    //
                }
                
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
