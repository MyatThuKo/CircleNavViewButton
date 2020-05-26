//
//  ContentView.swift
//  CircleButtonNavigation
//
//  Created by Myat Thu Ko on 5/26/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActivated = false
    @ObservedObject var menuVM = MenuViewModel()
    
    var body: some View {
        ZStack {
            menuVM.selectedMenu.menuView
            ZStack {
                Color.black.opacity(isActivated ? 0.2 : 0)
                VStack {
                    Spacer()
                    ZStack {
                        ForEach(0..<menuVM.menus.count) { i in
                            MenuButton(isActivated: self.$isActivated, menuVM: self.menuVM, currentItemIndex: i)
                        }
                        SelectedMenuButton(isActivated: self.$isActivated, menuItem: menuVM.selectedMenu)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(isActivated ? .all : .horizontal)
        .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
