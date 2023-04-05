//
//  MoviesAPIService.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

protocol MoviesServiceProtocol {
    func getTrendingMovies() async -> Result<[Movie], RequestError>
}

struct MoviesService: MoviesServiceProtocol {
    func getTrendingMovies() async -> Result<[Movie], RequestError> {
        let endPoint = Endpoint(method: .get,
                                 path: "/discover/movie")
        return await Webservice.request(endPoint, responseType: [Movie].self)
    }
}

