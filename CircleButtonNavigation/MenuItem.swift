//
//  MenuItem.swift
//  CircleButtonNavigation
//
//  Created by Myat Thu Ko on 5/26/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct MenuItem {
    let id = UUID()
    let color: Color
    let icon: String
    let menuView: AnyView
    var selected: Bool
}
