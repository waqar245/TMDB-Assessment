//
//  MoviesListingViewModel.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 06/04/2023.
//

import Foundation

class MoviesListingViewModel: ObservableObject {
    
    private var service: MoviesServiceProtocol!
    
    @Published private(set) var trendingMovies: [Movie] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var error: RequestError?
    
    private(set) var page = 1
    private(set) var totalPages: Int?
    
    init(service: MoviesServiceProtocol = MoviesAPIService()) {
        self.service = service
    }
    
    func fetchTrendingMovies(page: Int = 1) {
        
        self.page = page
        
        if (page <= 1) {
            isLoading = true
        }
        
        Task(priority: .background) {
            
            let result = await service.getTrendingMovies(page: page)
            
            DispatchQueue.main.async { [weak self] in
            
                switch (result) {
                case .success(let response):
                    self?.trendingMovies.append(contentsOf: response.results)
                    self?.totalPages = response.totalPages
                    
                case .failure(let error):
                    self?.error = error
                }
                
                self?.isLoading = false
            }
        }
    }
    
    func fetchNextSetIfNeeded(currentMovie: Movie) {
        if (currentMovie.id == trendingMovies.last?.id) {
            fetchTrendingMovies(page: page + 1)
        }
    }
}
