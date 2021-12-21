//
//  Mocks.swift
//  TestDrivenDevelopmentTests
//
//  Created by siuzanna on 22/12/21.
//

import UIKit

@testable import TestDrivenDevelopment
extension  MovieLibraryDataServicetests {
    
    class TableViewMock: UITableView {
        var cellDequeueProperly = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeueProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: Moviecell {
        var movieData: Movie?
        
        override func configMovieCell(_ movie: Movie) {
            movieData = movie
        }         
    }
}

extension  MovieCellsTests {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
