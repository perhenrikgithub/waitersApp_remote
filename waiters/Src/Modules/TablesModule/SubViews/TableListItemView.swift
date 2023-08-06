//
//  YourTablesTableView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 17/07/2023.
//

import SwiftUI

struct TableListItemView: View {
    private var table: Table
    
    init(table: Table) {
        self.table = table
    }
    
    var body: some View {
        NavigationLink(
            destination: SpecificTableView(table: self.table)
                .navigationBarBackButtonHidden(true) // Hide the back button label
        ) {
            HStack {
                VStack(spacing: 3) {
                    HStack {
                        Text("Table")
                        Spacer()
                        Text("#" + String(self.table.tableNumber))
                    }
                    .font(.system(size: 32))
                    .padding(.horizontal, 5)
                    
                    StatusCell(status: self.table.status)
                }
                .frame(width: 175)
                
                Spacer()
                
                Image(systemName: "arrowshape.right.fill") // "book.pages"
                    .font(.system(size: 45))
                
            }
            .padding(.horizontal)
            .foregroundColor(Color("MainText"))
        }
        
    }
}



struct TableListItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let t = Table(tableNumber: 4, capacity: 4, isReserved: true, isByWindow: true)
        
        return NavigationView {
            TableListItemView(table: t)
        }
    }
}
