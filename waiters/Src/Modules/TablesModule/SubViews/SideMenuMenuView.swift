//
//  SideMenuMenuView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 17/07/2023.
//

import SwiftUI

struct SideMenuMenuView: View {
    @State private var selectedOption = 0
    let options = ["🔢 Num", "🐘 Size" , "💸 Cost"]
    
    var body: some View {
        VStack {
            // line, seperator
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .ignoresSafeArea()
            HStack {
                VStack (alignment: .leading, spacing: 0){
                    Label("Add table", systemImage: "plus")
                        .padding(.bottom, 10)
                    Picker("Options", selection: $selectedOption) {
                        ForEach(0..<options.count) { index in
                            Text(options[index]).tag(index)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .font(.system(size: 32))
                .padding(.horizontal, 10)
                Spacer()
            }
            // line, seperator
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .ignoresSafeArea()
        }
        
       
    }
}

struct SideMenuMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuMenuView()
    }
}
