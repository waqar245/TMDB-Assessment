//
//  MoviesAPIService.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

protocol MoviesServiceProtocol {
    func getTrendingMovies(page: Int) async -> Result<MoviesResponse, RequestError>
}

struct MoviesAPIService: MoviesServiceProtocol {
    func getTrendingMovies(page: Int) async -> Result<MoviesResponse, RequestError> {
        let endPoint = Endpoint(method: .get,
                                path: "/discover/movie",
                                parameters: [URLQueryItem(name: "page", value: page.description)])
        return await Webservice.request(endPoint, responseType: MoviesResponse.self)
    }
}

struct MoviesMockService: MoviesServiceProtocol {
    func getTrendingMovies(page: Int) async -> Result<MoviesResponse, RequestError> {
        return .success(Mockable().loadJSON(filename: "TrendingMovies", type: MoviesResponse.self))
    }
}
