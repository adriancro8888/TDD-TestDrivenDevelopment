//
//  MovieManagersTests.swift
//  TestDrivenDevelopmentTests
//
//  Created by siuzanna on 21/12/21.
//

import XCTest

@testable import TestDrivenDevelopment
class MovieManagersTests: XCTestCase {

    var sut: MovieManager!

    let sififMovie = Movie(title: "Avatar")
    let discover = Movie(title: "Mulan")
    let action = Movie(title: "Action/Adventure")
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }

    // MARK: Initialization
    func testInit_MovieToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MovieSeen() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query Movies
    func testAdd_MoviesToSeen_ReturnsOne() {
        sut.addMovie(movie: sififMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: action)
        
        let movieQueried = sut.movieAtindex(index: 0)
        XCTAssertEqual(action.title , movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdatesManagerCounts() {
        sut.addMovie(movie: discover)
        sut.checkMoviewAtIndex(0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: action)
        sut.addMovie(movie: discover)
        sut.checkMoviewAtIndex(0)
        
        XCTAssertEqual(sut.movieAtindex(index: 0).title, discover.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: sififMovie)
        sut.checkMoviewAtIndex(0)
        
        let myQueryMovie = sut.moviesSeenArray(0)
        XCTAssertEqual(sififMovie.title, myQueryMovie.title)
    }
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        let movie1 = action
        let movie2 = action

        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNoteEqualForDifferentTitles() {
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Adventure")

        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNoteEqualForDifferentReleasedates() {
        let movie1 = Movie(title: "Action", releaseData: "2022")
        let movie2 = Movie(title: "Action", releaseData: "2021")

        XCTAssertNotEqual(movie1, movie2)
    }
    
    // MARK: Clearing & Resetting
    
    func testClearrrays_ReturnsrrayCoutsZero() {
        sut.addMovie(movie: action)
        sut.addMovie(movie: sififMovie)
        sut.checkMoviewAtIndex(0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 1)

        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    // MARK: Duplicates
    
    func testDuplicates_ShouldNotBeAddedTorray() {
        sut.addMovie(movie: sififMovie)
        sut.addMovie(movie: sififMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
