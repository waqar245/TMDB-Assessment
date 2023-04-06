//
//  MovieDetailsViewModel.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    private var service: MoviesServiceProtocol!
    
    @Published private(set) var movie: Movie!
    @Published private(set) var error: RequestError?
    
    init(service: MoviesServiceProtocol = MoviesAPIService()) {
        self.service = service
    }
    
    func fetchMovieDetails() {
        
//        Task(priority: .background) {
//
//            let result = await service.getMovieDetails(movieId: movie.id)
//
//            DispatchQueue.main.async { [weak self] in
//
//                switch (result) {
//                case .success(let response):
//                    self?.movie = movie
//                    self?.totalPages = response.totalPages
//
//                case .failure(let error):
//                    self?.error = error
//                }
//
//                self?.isLoading = false
//            }
//        }
    }
}
