//
//  MenuViewModel.swift
//  CircleButtonNavigation
//
//  Created by Myat Thu Ko on 5/26/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var menus: [MenuItem] = [
        MenuItem(color: .red, icon: "1.circle.fill", menuView: AnyView(Text("First View")), selected: true),
        MenuItem(color: .blue, icon: "2.circle.fill", menuView: AnyView(Text("Second View")), selected: false),
        MenuItem(color: .green, icon: "3.circle.fill", menuView: AnyView(Text("Third View")), selected: false),
        MenuItem(color: .yellow, icon: "4.circle.fill", menuView: AnyView(Text("Fourth View")), selected: false),
        MenuItem(color: .orange, icon: "5.circle.fill", menuView: AnyView(Text("Fifth View")), selected: false)
    ]
    
    var selectedMenu: MenuItem {
        guard let selected = menus.filter({ $0.selected }).first else {
            fatalError("You need to set one of the MenuItems in MenuItems in MenuViewModel.menus as selected: true")
        }
        return selected 
    }
}
