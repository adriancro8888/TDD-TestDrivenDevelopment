//
//  MovieCellsTests.swift
//  TestDrivenDevelopmentTests
//
//  Created by siuzanna on 22/12/21.
//

import XCTest

@testable import TestDrivenDevelopment
class MovieCellsTests: XCTestCase {

    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    let sififMovie = Movie(title: "Avatar")
    let discover = Movie(title: "Mulan")
    let action = Movie(title: "Action/Adventure")
        
    override func setUp(){
        super.setUp()
        
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryVC?.view
        tableView = libraryVC?.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    func testCell_Config_ShouldetLablesToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! Moviecell
        cell.configMovieCell(Movie(title: "Comedy", releaseData: "2002"))
        
        XCTAssertEqual(cell.textLabel?.text, "Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2002")
    }
}
