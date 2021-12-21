//
//  MovieStructTests.swift
//  TestDrivenDevelopmentTests
//
//  Created by siuzanna on 21/12/21.
//

import XCTest

@testable import TestDrivenDevelopment
class MovieStructTests: XCTestCase {
 
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Siuzanna title")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Siuzanna title")
    }
    
    func testInit_SetMovieTitleAndReleaseData() {
        let testMovie = Movie(title: "Avatar 3", releaseData: "2022")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseData, "2022")
    }
}
