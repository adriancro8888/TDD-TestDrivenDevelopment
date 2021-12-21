//
//  Movie.swift
//  TestDrivenDevelopment
//
//  Created by siuzanna on 21/12/21.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseData: String?
    
    init(title: String, releaseData: String? = nil) {
        self.title = title
        self.releaseData = releaseData
    }
}
