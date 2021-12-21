//
//  Moviecell.swift
//  TestDrivenDevelopment
//
//  Created by siuzanna on 21/12/21.
//

import UIKit

class Moviecell: UITableViewCell {
    
    func configMovieCell(_ movie: Movie) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseData
    }
}
