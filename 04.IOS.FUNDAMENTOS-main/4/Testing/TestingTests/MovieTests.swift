//
//  MovieTests.swift
//  TestingTests
//
//  Created by Oscar Rodriguez Garrucho on 15/12/22.
//

import XCTest
@testable import Testing

final class MovieTests: XCTestCase {
    
    var movie: Movie!

    override func setUp() {
        super.setUp()
        
        movie = Movie(title: "Titanic", year: "1997")
    }

    override func tearDown() {
        movie = nil
        
        super.tearDown()
    }
    
    func testMovieTitle() {
        // Given
        
        // When
        let title = movie.title
        
        // Then
        XCTAssertNotNil(movie)
        XCTAssertNotNil(title)
        XCTAssertEqual(title, "Titanic")
        XCTAssertNotEqual(title, "Torrente")
        XCTAssertTrue(title != "Torrente")
        XCTAssertFalse(title == "Torrente")
    }
    
    func test_movie_year() {
        // Given
        
        // When
        let year = movie.year
        
        // Then
        XCTAssertNotNil(year)
        XCTAssertEqual(year, "1997")
        XCTAssertTrue(year != "1995")
        XCTAssertFalse(year == "1994")
    }

}
