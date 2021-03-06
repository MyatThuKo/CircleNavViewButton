//
//  MenuButton.swift
//  CircleButtonNavigation
//
//  Created by Myat Thu Ko on 5/26/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    @Binding var isActivated: Bool
    @ObservedObject var menuVM: MenuViewModel
    var currentItemIndex: Int
    
    var body: some View {
        let menuItem = menuVM.menus[currentItemIndex]
        return Circle()
            .fill(menuItem.color)
            .frame(width: isActivated ? 50 : 20, height: isActivated ? 50 : 20)
            .shadow(radius: 5)
            .overlay(Image(systemName: menuItem.icon))
            .foregroundColor(.white)
            .offset(x: isActivated ? calcOffSet().x : 0, y: isActivated ? calcOffSet().y : -10)
            .onTapGesture {
                self.isActivated.toggle()
                self.updateSelected()
        }
    }
    
    // updating the selected item (selected: True / the rest: False)
    func updateSelected() {
        let menuItem = menuVM.menus[currentItemIndex]
        for i in 0..<menuVM.menus.count {
            menuVM.menus[i].selected = menuItem.id == menuVM.menus[i].id
        }
    }
    
    func calcOffSet() -> (x: CGFloat, y: CGFloat) {
        switch menuVM.menus.count {
        case 2:
            switch currentItemIndex {
            case 0:
                return (-70, -70)
            default:
                return (70, -70)
            }
        case 3:
            switch currentItemIndex {
            case 0:
                return (-70, -70)
            case 1:
                return (0, -110)
            default:
                return (70, -70)
            }
        case 4:
            switch currentItemIndex {
            case 0:
                return (-90, -40)
            case 1:
                return (-45, -110)
            case 2:
                return (-45, -110)
            default:
                return (90, -40)
            }
        default: // case 5
            switch currentItemIndex {
            case 0:
                return (-100, -20)
            case 1:
                return (-70, -80)
            case 2:
                return (0, -110)
            case 3:
                return (70, -80)
            default:
                return (100, -20)
            }
        }
    }
}

struct SelectedMenuButton: View {
    @Binding var isActivated: Bool
    var menuItem: MenuItem
    var body: some View {
        Circle()
            .fill(menuItem.color)
            .frame(width: isActivated ? 50 : 65, height: isActivated ? 50 : 65)
            .shadow(radius: 5)
            .overlay(Image(systemName: menuItem.icon))
            .foregroundColor(.white)
            .offset(x: 0, y: isActivated ? -20 : -10)
            .onTapGesture {
                self.isActivated.toggle()
        }
    }
}
