//
//  Movie.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let runtime: Int?
    let releaseDate: Date?
    let posterPath: String
    let backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case runtime
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
