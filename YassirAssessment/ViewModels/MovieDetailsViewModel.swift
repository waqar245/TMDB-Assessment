//
//  MovieDetailsViewModel.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    private var service: MoviesServiceProtocol!
    
    @Published private(set) var movieId: Int!
    @Published private(set) var movie: Movie?
    @Published private(set) var cast: [Cast]?
    @Published private(set) var errorMessage: String?
    @Published private(set) var isLoaded: Bool = false
    
    init(service: MoviesServiceProtocol = MoviesAPIService(), movieId: Int) {
        self.service = service
        self.movieId = movieId
    }
    
    func fetchMovieDetails() async {
        
        isLoaded = false
        
        let movieDetailsResult = await service.getMovieDetails(movieId: movieId)
        let castResult = await service.getMovieCast(movieId: movieId)
        
        await MainActor.run {
            processMoviesDetailsResult(movieDetailsResult)
            processCastResult(castResult)
            
            isLoaded = true
        }
    }
    
    private func processMoviesDetailsResult(_ result: Result<Movie, RequestError>) {
        
        switch (result) {
        case .success(let response):
            movie = response
            
        case .failure(let error):
            errorMessage = error.localizedDescription
        }
    }
    
    private func processCastResult(_ result: Result<CreditsResponse, RequestError>) {
        
        switch (result) {
        case .success(let response):
            
            if (response.cast?.count ?? 0 > 10) {
                //get max 10 cast members only
                cast = Array(response.cast?.prefix(10) ?? [])
            }
            else {
                cast = response.cast
            }
            
        case .failure(let error):
            errorMessage = error.localizedDescription
        }
    }
}
