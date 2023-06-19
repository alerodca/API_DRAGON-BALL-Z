//
//  WeaponTests.swift
//  TestingTests
//
//  Created by Oscar Rodriguez Garrucho on 15/12/22.
//

import XCTest

final class WeaponTests: XCTestCase {
    
    var axe: Weapon!
    var sword: Weapon!
    var bomb: Weapon!

    override func setUp() {
        super.setUp()
        
        axe = Weapon(type: .axe)
        sword = Weapon(type: .sword)
        bomb = Weapon(type: .bomb)
    }

    override func tearDown() {
        axe = nil
        sword = nil
        bomb = nil
        
        super.tearDown()
    }
    
    func testAxeDamage() {
        // Given
        
        // When
        
        // Then
        XCTAssertEqual(axe.damage, 40)
    }
    
    func test_bomb_is_greater_than_sword() {
        // Given
        
        // When
        let bombDamage = bomb.damage
        let swordDamage = sword.damage
        
        // Then
        XCTAssertGreaterThan(bombDamage, swordDamage)
    }
    
    func test_bomb_is_greater_than_axe() {
        // Given
        
        // When
        let bombDamage = bomb.damage
        let axeDamage = axe.damage
        
        // Then
        XCTAssertGreaterThan(bombDamage, axeDamage)
    }


}
