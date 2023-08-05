//
//  orderLineView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 02/08/2023.
//

import SwiftUI

struct OrderLineView: View {
    @State private var hasBeenServed = false
    private var color: Color {
        return hasBeenServed ? .green : .red
    }
    private var orderLine: OrderLine
    
    init(orderLine: OrderLine) {
        self.orderLine = orderLine
    }
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 16)
                .foregroundColor(self.color)
            Text("\(self.orderLine.amount)x")
                .foregroundColor(.gray)
            Text(self.orderLine.item.name)
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 24))
        .onLongPressGesture {
            self.hasBeenServed.toggle()
        }
        
    }
        
}

struct orderLineView_Previews: PreviewProvider {
    static var previews: some View {
        
        let food1 = FoodItem(price: 27.99)
        let orderLine1 = OrderLine(item: food1, amount: 2)
        
        return OrderLineView(orderLine: orderLine1)
    }
}
