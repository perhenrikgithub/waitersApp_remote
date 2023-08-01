//
//  SelecterCellView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI

struct SelecterCellView: View {
    @State var active = false
    
    var color: Color {
        return active ? .green : .gray
    }
    
    var foodItemType: FoodItemType
    @ObservedObject var selectorModel: SelectorModel
    
    init(foodItemType: FoodItemType, selectorModel: SelectorModel) {
        self.foodItemType = foodItemType
        self.selectorModel = selectorModel
    }
    
    var body: some View {
        Button(self.foodItemType.rawValue) {
            self.active.toggle()
            if self.active {
                self.selectorModel.addFoodItem(type: self.foodItemType)
            } else {
                self.selectorModel.removeFoodItem(type: self.foodItemType)
            }
            
        }
        .buttonStyle(.bordered)
//        .controlSize(.large)
        .buttonStyle(.bordered)
        .tint(self.color)
    }
    
    struct SelecterCellView_Previews: PreviewProvider {
        static var previews: some View {
            
            VStack {
                SelecterCellView(foodItemType: .antipasti, selectorModel: SelectorModel())
                    .padding(.bottom, 40)
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 5) {
                        ForEach(FoodItemType.allCases, id: \.rawValue) { foodItemType in
                            SelecterCellView(foodItemType: foodItemType, selectorModel: SelectorModel())
                        }
                        
                        // todo: add drinks to menu
                        
                        
                    }
                }
                .padding(.horizontal, 5)
            }
        }
    }
}
