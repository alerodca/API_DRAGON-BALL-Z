//
//  WeaponTests.swift
//  TestsTests
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import XCTest

final class WeaponTests: XCTestCase {

    var axe: weapon!
    var sword: weapon!
    var bomb: weapon!
    
    override func setUp() {
        super.setUp()
        
        axe = weapon(type: .axe)
        sword = weapon(type: .sword)
        bomb = weapon(type: .bomb)
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
    
    func testBombIsBetterThanSword() {
        // Given
        
        // When
        let bombDamage = bomb.damage
        let swordDamage = sword.damage
        // Then
        XCTAssertGreaterThanOrEqual(bombDamage, swordDamage)
    }
    
    func testBombIsBetterThanAxe() {
        // Given
        
        // When
        let bombDamage = bomb.damage
        let axeDamage = axe.damage
        // Then
        XCTAssertGreaterThanOrEqual(bombDamage, axeDamage)
    }

}
