//
//  AddTableTableView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 17/07/2023.
//

import SwiftUI


struct AddTableTableView: View {
    // alerts
    @State private var showingAlert = false
    
    // init
    var tableNumber: String
    var seatingCapacity: Int
    var statusColor: Color
    var textColor: Color
    var tableHasWaiter: Bool
    var alertString: String
    
    init(tableNumber: Int, seatingCapacity: Int, tableHasWaiter: Bool) {
        if String(tableNumber).count == 1 {
            self.tableNumber = "0" + String(tableNumber)
        } else {
            self.tableNumber = String(tableNumber)
        }
        
        self.tableHasWaiter = tableHasWaiter
        self.seatingCapacity = seatingCapacity
        
        if tableHasWaiter {
            statusColor = Color.red
            self.textColor = Color.gray
            self.alertString = "Table number #\(self.tableNumber) belongs to someone else. Are you sure you want to take the table?"
        } else {
            statusColor = Color.green
            self.textColor = Color.black
            self.alertString = "You are taking table #\(self.tableNumber)"
        }
        
    
    }
    
    var body: some View {
        
        
        
        Button {
            showingAlert = true
        } label: {
            HStack {
                Label("Table #\(self.tableNumber)", systemImage: "table.furniture")
                    .font(.system(size: 18))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 1000)
                        .frame(width: 60, height: 28)
                        .foregroundColor(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 1000)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    Label("\(self.seatingCapacity)", systemImage: "person.fill")
                }
                Circle()
                    .frame(width: 14)
                    .foregroundColor(self.statusColor)
                    
            }
            .padding(.horizontal)
            .foregroundColor(self.textColor)
        }
        .alert("Taking table", isPresented: $showingAlert) {
            if !self.tableHasWaiter {
                Button("Ok") {}
                Button("Cancel", role:.cancel) {}
            } else {
                Button("Yes", role: .destructive) {}
            }
        } message: {
            Text(self.alertString)
        }

        
        
    }
}

struct AddTableTableView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AddTableTableView(tableNumber: 2, seatingCapacity: 5, tableHasWaiter: false)
            AddTableTableView(tableNumber: 2, seatingCapacity: 5, tableHasWaiter: true)
        }
    }
}
