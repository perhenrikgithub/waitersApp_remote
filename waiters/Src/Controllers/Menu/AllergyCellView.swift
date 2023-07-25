//
//  Allergy2.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 25/07/2023.
//

import SwiftUI




struct AllergyCellView: View {
    var allergy: Allergy
    var color: Color
    
    init(allergy: Allergy) {
        self.allergy = allergy
        if allergy.canBeMadeWithout {
            self.color = Color(.orange)
        } else {
            self.color = Color(.red)
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 1000)
                .stroke(lineWidth: 2)
            HStack (spacing: 0) {
                ZStack {
                    Circle()
                        .padding(12)
                        .foregroundColor(self.color)
                }
                
                if allergy.allergyName != nil {
                    Text(allergy.allergyName!.prefix(1).capitalized + allergy.allergyName!.dropFirst())
                        .padding(.trailing, 12)
                } else {
                    Text(allergy.allergyType.rawValue.prefix(1).capitalized + allergy.allergyType.rawValue.dropFirst())
                        .padding(.trailing, 12)
                }
                
                Spacer()
            }
            
        }
        .frame(height: 50)
        .font(.system(size: 20))
        .fixedSize()
    }
}

struct Allergy2_Previews: PreviewProvider {
    static var previews: some View {
        AllergyCellView(allergy: Allergy(allergyType: .soybeans, canBeMadeWithout: true))
    }
}
