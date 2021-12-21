//
//  LibraryViewControllerTests.swift
//  TestDrivenDevelopmentTests
//
//  Created by siuzanna on 21/12/21.
//

import XCTest

@testable import TestDrivenDevelopment
class LibraryViewControllerTests: XCTestCase {

    var sut: LibraryViewController!
    
    override func setUp() {
        super.setUp()
        sut = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        
        _ = sut.view
     }

    override func tearDownWithError() throws {
        
     }

    //MARK: Nil Check
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
 
    //MARK: Data Source
    func testDataSource_ViewDidLoad_SetTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: Data Source
    func testDataSource_ViewDidLoad_SetTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data Service Assumptions
    func testDataSource_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertEqual(sut.libraryTableView.delegate as! MovieLibraryDataService, sut.libraryTableView.dataSource as! MovieLibraryDataService)
    }
}
