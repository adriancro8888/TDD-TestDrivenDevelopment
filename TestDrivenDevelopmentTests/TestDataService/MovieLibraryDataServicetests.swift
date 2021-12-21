//
//  MovieLibraryDataServicetests.swift
//  TestDrivenDevelopmentTests
//
//  Created by siuzanna on 21/12/21.
//

import XCTest

@testable import TestDrivenDevelopment
class MovieLibraryDataServicetests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVc: LibraryViewController!
    
    let sififMovie = Movie(title: "Avatar")
    let discover = Movie(title: "Mulan")
    let action = Movie(title: "Action/Adventure")
        
    var tableViewMock: TableViewMock!
    override func setUp() {
        super.setUp()
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        
        _ = libraryVc.view
        
        libraryTableView = libraryVc.libraryTableView

        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    //MARK: Sections
    func testTableViewSections_Count_ReturnTwo() {
        
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    //MARK: Section One
    func testTableViewSections_SectionOne_ReturnMoviesToSeeCount() {
//        sut.movieManager?.addMovie(movie: action)
//        sut.movieManager?.addMovie(movie: sififMovie)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//        sut.movieManager?.addMovie(movie: discover)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 4)
    }
    
    //MARK: SectionTwo
    func testTableViewSections_SectionTwo_ReturnMoviesSeenCount() {
//        sut.movieManager?.addMovie(movie: action)
//        sut.movieManager?.addMovie(movie: sififMovie)
//        sut.movieManager?.checkMoviewAtIndex(0)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//
//        sut.movieManager?.checkMoviewAtIndex(0)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    //MARK: Cells
    func testCell_RowatIndex_returnMovieCell() {
        sut.movieManager?.addMovie(movie: action)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is Moviecell)
    }
     
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.addMovie(movie: discover)
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeueProperly)
    }
    
    func testCell_ShouldOneConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: discover)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, discover)
    }
    
    func testCell_ShouldTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: action)
        sut.movieManager?.addMovie(movie: sififMovie)
        sut.movieManager?.checkMoviewAtIndex(0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, action)
    }
    
    
    func testCell_Selection_ShouldetCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: action)
        sut.movieManager?.addMovie(movie: sififMovie)
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }

    func testTableViewTitles_ShouldHaveCorrectStringValues() {
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)

        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
}
