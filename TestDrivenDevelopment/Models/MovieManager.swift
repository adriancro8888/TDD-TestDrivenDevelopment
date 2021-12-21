//
//  MovieManager.swift
//  TestDrivenDevelopment
//
//  Created by siuzanna on 21/12/21.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int { return moviesToSeeArray.count }
    var moviesSeenCount: Int {return moviesSeenArray.count }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie: Movie) {
        if !moviesToSeeArray.contains(movie) {
            moviesToSeeArray.append(movie)
        }
    }
    
    func movieAtindex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMoviewAtIndex(index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func checkMoviewAtIndex(_ index: Int) {
        guard index < moviesToSeeCount else {return}
        
        moviesSeenArray.append(moviesToSeeArray[index])
        moviesToSeeArray.remove(at: index)
    }
    
    func moviesSeenArray(_ index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func clearArrays() {
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
}
