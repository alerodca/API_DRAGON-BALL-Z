//
//  TransformTests.swift
//  ProyectoTests
//
//  Created by Alejandro Rodríguez Cañete on 23/6/23.
//

import XCTest

final class TransformTests: XCTestCase {

    var transformation: Transformation!
    
    override func setUp() {
        super.setUp()
        
        transformation = Transformation(id: "22", name: "Super Saiyan", photo: "https://www.keepcoding.io", description: "This is the real one")
    }

    override func tearDown() {
        transformation = nil
        super.tearDown()
    }

    func testTransformationId() {
        XCTAssertNotNil(transformation.id)
        XCTAssertEqual(transformation.id, "22")
        XCTAssertNotEqual(transformation.id, "7")
    }
    
    func testTransformationName() {
        XCTAssertNotNil(transformation.name)
        XCTAssertEqual(transformation.name, "Super Saiyan")
        XCTAssertNotEqual(transformation.name, "Super Saiyan Blue")
    }
    
    func testTransformationPhoto() {
        let url = URL(string: transformation.photo)
        
        XCTAssertNotNil(transformation.photo)
        XCTAssertEqual(transformation.photo, "https://www.keepcoding.io")
        XCTAssertNotEqual(transformation.photo, "https://www.keepcoding.com")
        
        XCTAssertNotNil(url)
    }
    
    func testTransformationDescription() {
        XCTAssertNotNil(transformation.description)
        XCTAssertEqual(transformation.description, "This is the real one")
        XCTAssertNotEqual(transformation.description, "This is the real one!!!")
    }
    
}
