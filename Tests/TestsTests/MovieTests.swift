//
//  MovieTests.swift
//  TestsTests
//
//  Created by Alejandro Rodríguez Cañete on 9/6/23.
//

import XCTest

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
        let year = movie.year
        
        // Then
        XCTAssertNotNil(movie)
        XCTAssertNotNil(title)
        XCTAssertEqual(title, "Titanic")
    }

    func test_movie_year() {
        // Given
        
        // When
        let title = movie.title
        let year = movie.year
        
        // Then
        XCTAssertNotNil(movie)
        XCTAssertNotNil(title)
        XCTAssertEqual(title, "Titanic")
        XCTAssertEqual(year, "1997")
        XCTAssertNotEqual(title, "Torrente")
    }
}
