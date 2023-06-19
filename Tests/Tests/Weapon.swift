//
//  Weapon.swift
//  Tests
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import Foundation

struct weapon {
    let damage: Int
    let type: weaponType
    
    init(type: weaponType) {
        self.damage = type.rawValue
        self.type = type
    }
}

enum weaponType: Int {
    case axe = 40
    case sword = 25
    case bomb = 80
}
