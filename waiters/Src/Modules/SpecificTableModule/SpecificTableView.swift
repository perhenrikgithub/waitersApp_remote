//
//  SpecificTableView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 18/07/2023.
//

import SwiftUI

struct SpecificTableView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // Header
                    Header()
                    
                    HStack {
                        NavigationLink(destination: TablesView()) {
                            Image(systemName: "chevron.backward")
                            Text("Table #04")
                        }
                        .navigationBarBackButtonHidden(true) // Hide the back button label
                        .foregroundColor(Color("MainText"))
                        .font(.system(size: 24))
                        
                        Spacer()
                        StatusCell(status: .seated, scale: 0.8)
                    }
                    .padding()
                    
                    // main area
                    VStack (spacing: 0) {
                        SeatingImage(numberOfChairs: 8)
                        ScrollView {
                            VStack {
                                // if no orders in table.getOrders()
                                Text("No orders yet")
                                    .padding(.vertical)
                                // else
                                // todo
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
        SpecificTableView()
    }
}
