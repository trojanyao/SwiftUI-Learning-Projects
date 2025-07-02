//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by TROJAN on 2025/6/10.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate: Date
    var favoriatedBy = [Friend]() // create a property for the inverse relationship (one-to-many) back to Friend
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "Amusing Space Traveler 3",
              releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Difficult Cat",
              releaseDate: Date(timeIntervalSinceReferenceDate: -20_000_000)),
        Movie(title: "Electrifying Trek",
              releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "Reckless Train Ride 2",
              releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "The Last Venture",
              releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "Glamorous Neighbor",
              releaseDate: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
    ]
}
