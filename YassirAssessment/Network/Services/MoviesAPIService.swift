//
//  MoviesAPIService.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

protocol MoviesServiceProtocol {
    func getTrendingMovies() async -> Result<MoviesResponse, RequestError>
}

struct MoviesAPIService: MoviesServiceProtocol {
    func getTrendingMovies() async -> Result<MoviesResponse, RequestError> {
        let endPoint = Endpoint(method: .get, path: "/discover/movie")
        return await Webservice.request(endPoint, responseType: MoviesResponse.self)
    }
}

struct MoviesMockService: MoviesServiceProtocol {
    func getTrendingMovies() async -> Result<MoviesResponse, RequestError> {
        return .success(Mockable().loadJSON(filename: "TrendingMovies", type: MoviesResponse.self))
    }
}
