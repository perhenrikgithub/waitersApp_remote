//
//  TablesView.swift
//  waiters
//
//  Created by Per Henrik Mork Viken on 16/07/2023.
//

import SwiftUI



struct TableListView: View {

    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    // side menu
    @State var menuWidth = 0.67
    @State var menuWidthInverse = 0.33
    @State var blurRadiusWhenMenuIsActive = 0.0 // 2.5
    @State var menuIsActive = false
    
    func toggleMenu() {
        self.menuIsActive.toggle() // Toggle the value of menuIsActive
        self.blurRadiusWhenMenuIsActive = self.menuIsActive ? 2.5 : 0.0
    }

    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    // main content
                    VStack (spacing: 0) {
                        Header(showProfileIcon: true)
                        
                        // 'your tables' line
                        HStack {
                            Text("Your Tables")
                                .font(.system(size: CGFloat(52)))
                            Spacer()
                            
                            HamburgerMenu() {
                                toggleMenu()
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        .foregroundColor(Color("MainText"))
                        
                        ScrollView {
                            VStack {
                                ForEach(self.user.tables) {table in
                                    TableListItemView(table: table)
                                }
                            }
                            .padding(.vertical) // Add some vertical padding between the table views
                        }
                        .frame(maxHeight: .infinity) // Allow the ScrollView to expand to its maximum height
                    }
                    .blur(radius: self.blurRadiusWhenMenuIsActive)
                }


                
                // side menu
                if menuIsActive {
                    HStack (spacing: 0) {
                        // left side of the menu, clear side, clickable -> toggles menu
                        Button {
                            toggleMenu()
                        } label: {
                            Rectangle()
                                .frame(width: (UIScreen.main.bounds.width * CGFloat(menuWidthInverse)) - 2, height: UIScreen.main.bounds.height)
                                .foregroundColor(.clear)
                                .ignoresSafeArea()

                        }
                        
                        
                        // thin vertical line
                        Rectangle()
                            .frame(width: 2, height: UIScreen.main.bounds.height)
                            .foregroundColor(.gray)
                            .ignoresSafeArea()

                        // actual sideMenu
                        ZStack {
                            Rectangle()
                                .ignoresSafeArea()
                                .foregroundColor(Color(.white))
                            VStack {
                                // sideMenu contents
                                
                                // X-button
                                HStack {
                                    Spacer()
                                    Button {
                                        toggleMenu()
                                    } label: {
                                        Image(systemName: "xmark")
                                            .font(.system(size: 50))
                                            .padding(10)
                                            .foregroundColor(.black)
                                    }
                                }
                                SideMenuMenuView() // "+ Add Table", filters and lines over and under
                                
                                ScrollView {
                                    VStack {
                                        // for each table that is not in 'your tables'
                                        AddTableTableView(tableNumber: 2, seatingCapacity: 5, tableHasWaiter: false)
                                        AddTableTableView(tableNumber: 25, seatingCapacity: 5, tableHasWaiter: false)
                                        AddTableTableView(tableNumber: 6, seatingCapacity: 25, tableHasWaiter: false)
                                        AddTableTableView(tableNumber: 2, seatingCapacity: 5, tableHasWaiter: false)
                                        AddTableTableView(tableNumber: 25, seatingCapacity: 5, tableHasWaiter: false)
                                        AddTableTableView(tableNumber: 6, seatingCapacity: 25, tableHasWaiter: true)
                                    }
                                    .padding(.vertical) // Add some vertical padding between the table views
                                }
                                .frame(maxHeight: .infinity) // Allow the ScrollView to expand to its maximum height
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * self.menuWidth, height: UIScreen.main.bounds.height)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct TableListView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(username: "user1", userID: 0)
        let t1 = Table(tableNumber: 1, capacity: 1, isReserved: false, isByWindow: false)
        let t2 = Table(tableNumber: 2, capacity: 9, isReserved: false, isByWindow: false, status: .seated)
        let t3 = Table(tableNumber: 3, capacity: 1, isReserved: false, isByWindow: false, status: .ordered)
        let t4 = Table(tableNumber: 4, capacity: 1, isReserved: false, isByWindow: false, status: .served)
        let t5 = Table(tableNumber: 5, capacity: 1, isReserved: false, isByWindow: false, status: .paid)
        
        user.addTable(tables: [t1, t2, t3, t4, t5])
        
        return TableListView(user: user)
    }
}
