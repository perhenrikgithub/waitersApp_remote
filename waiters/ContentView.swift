//
//  ContentView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]
    @State private var isTrue = false
    private var color: Color {
        return isTrue ? .green : .red
    }
    

        var body: some View {
            NavigationStack {
                List {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                    }
                    .onDelete(perform: delete)
                }
                .navigationTitle("Users")
            }
        }

        func delete(at offsets: IndexSet) {
            users.remove(atOffsets: offsets)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
