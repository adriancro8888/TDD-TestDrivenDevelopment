//
//  ViewController.swift
//  TestDrivenDevelopment
//
//  Created by siuzanna on 21/12/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.libraryTableView.contentInset.top = 50
        self.libraryTableView.layer.cornerRadius = 15
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Avatar Aang", releaseData: "2001"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Mulan New Version", releaseData: "2021"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Debugging in Xcode", releaseData: "2007"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Luky Boys", releaseData: "2020"))
        
        libraryTableView.reloadData()
    }
}
