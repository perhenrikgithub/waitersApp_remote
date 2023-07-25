//
//  YourTablesTableView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 17/07/2023.
//

import SwiftUI

struct YourTablesTableView: View {
    var tableNumber: String
    var tableStatus: TableStatus
    var view: AnyView
    
    init(tableNumber: Int, tableStatus: TableStatus, view: any View) {
        if String(tableNumber).count == 1 {
            self.tableNumber = "0" + String(tableNumber)
        } else {
            self.tableNumber = String(tableNumber)
        }
        self.tableStatus = tableStatus
        self.view = AnyView(view)
    }
    
    var body: some View {
        NavigationLink(destination: self.view) {
            HStack {
                VStack(spacing: 3) {
                    HStack {
                        Text("Table")
                        Spacer()
                        Text("#" + self.tableNumber)
                    }
                    .font(.system(size: 32))
                    .padding(.horizontal, 5)
                    
                    StatusCell(status: self.tableStatus)
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



struct YourTablesTableView_Previews: PreviewProvider {
    static var previews: some View {
        YourTablesTableView(tableNumber: 1, tableStatus: .ordered, view: AnyView(UserView()))
    }
}
