//
//  SpecificTableView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 18/07/2023.
//

import SwiftUI

struct SpecificTableView: View {
    private var table: Table
    private var order: Order
    
    init(table: Table) {
        self.table = table
        self.order = table.getConnectedOrder()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // Header
                    Header()
                    
                    HStack {
                        NavigationLink(
                            destination: TableListView(user: User(username: "", userID: 0))
                                .navigationBarBackButtonHidden(true) // Hide the back button label
                        ) {
                            Image(systemName: "chevron.backward")
                            Text("Table #\(self.table.tableNumber)")
                        }
                        .foregroundColor(Color("MainText"))
                        .font(.system(size: 24))
                        
                        Spacer()
                        StatusCell(status: .seated, scale: 0.8)
                    }
                    .padding()
                    
                    // main area
                    VStack (spacing: 0) {
                        SeatingImage(numberOfChairs: self.table.capacity)
                        ScrollView {
                            if !self.order.hasAnyOrders() {
                                Text("No orders yet")
                                    .padding(.vertical)
                            } else {
                                VStack(spacing: 10) {
                                    ForEach(self.order.orderLines) {orderLine in
                                        VStack {
                                            OrderLineView(orderLine: orderLine)
                                        }
                                    }
                                }
                                .padding(.vertical)
                            }
                        }
                        .frame(maxHeight: .infinity)
                    }
                    .ignoresSafeArea()
                }
                
                LoginButton(title: "New Order", background: Color(red: 222/255, green: 31/255, blue: 44/255))
                    .offset(y: (UIScreen.main.bounds.height / 2) - 60)
            }
        }
    }
}


struct SpecificTableView_Previews: PreviewProvider {
    static var previews: some View {
        let table1 = Table(tableNumber: 14, capacity: 9, isReserved: true, isByWindow: true)
        let food = FoodItem(price: 27.99)
        let orderLine1 = OrderLine(item: food, amount: 2)
        let orderLine2 = OrderLine(item: food, amount: 5)
        let orderLine3 = OrderLine(item: food, amount: 1)
        
        table1.addOrderLine(lines: [orderLine1, orderLine2, orderLine3])
        
        return VStack {
            SpecificTableView(table: table1)
        }
    }
}
