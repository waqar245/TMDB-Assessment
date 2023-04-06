//
//  MoviesResponse.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 06/04/2023.
//

import Foundation

struct MoviesResponse: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
