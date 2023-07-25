//
//  statusCell.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 18/07/2023.
//

import SwiftUI

enum TableStatus {
    case available
    case seated
    case ordered
    case served
    case paid
}

struct StatusCell: View {
    
    var status: TableStatus
    var statusString: String
    var statusColor: Color
    var textColor = Color(.white)
    var borderColor = Color(.black)
    var borderWidth = 0.0
    var scale: Double
    
    
    init(status: TableStatus, scale: Double = 1.0) {
        self.status = status
        self.scale = scale
        
        if self.status == TableStatus.available {
            self.statusString = "Available"
            self.statusColor = Color(red: 3/255, green: 140/255, blue: 62/255)
        } else if self.status == TableStatus.seated {
            self.statusString = "Seated"
            self.statusColor = Color(red: 222/255, green: 31/255, blue: 44/255)
        } else if self.status == TableStatus.ordered {
            self.statusString = "Ordered"
            self.statusColor = Color(.orange)
        } else if self.status == TableStatus.served {
            self.statusString = "Served"
            self.statusColor = Color(red: 159/255, green: 44/255, blue: 191/255)
        } else {
            self.statusString = "Paid"
            self.borderWidth = 2.0
            self.statusColor = Color(.white)
            self.textColor = Color(.black)
        }
    }
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10000)
                .foregroundColor(self.statusColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10000)
                        .stroke(lineWidth: self.borderWidth)
                        .foregroundColor(.black)
                )
            Text(self.statusString)
                .font(.system(size: 28 * self.scale))
                .foregroundColor(self.textColor)
        }
        .frame(width: 175 * self.scale, height: 40 * self.scale)
    }
}

struct StatusCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StatusCell(status: TableStatus.available)
            StatusCell(status: TableStatus.seated)
            StatusCell(status: TableStatus.ordered)
            StatusCell(status: TableStatus.served)
            StatusCell(status: TableStatus.paid)
        }
    }
}
