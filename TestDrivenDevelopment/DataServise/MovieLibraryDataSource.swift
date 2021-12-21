//
//  MovieLibraryDataSource.swift
//  TestDrivenDevelopment
//
//  Created by siuzanna on 21/12/21.
//

import UIKit

enum LibrarySection: Int {
    case MovieToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let moviewManager = movieManager else {return 0}
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }

        switch librarySection {
            case .MovieToSee:
                return moviewManager.moviesToSeeCount
            case .MoviesSeen:
                return moviewManager.moviesSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! Moviecell
        
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtindex(index: indexPath.row) : movieManager.checkOffMoviewAtIndex(index: indexPath.row)
        
        cell.configMovieCell(movieData)
        
        return cell
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        if librarySection == .MovieToSee {
            movieManager.checkMoviewAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }

        switch librarySection {
            case .MovieToSee:
                return "Movies To See"
            case .MoviesSeen:
                return "Movies Seen"
        }
    }
}
