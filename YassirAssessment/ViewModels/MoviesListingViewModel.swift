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
    
    init(service: MoviesServiceProtocol = MoviesAPIService()) {
        self.service = service
    }
    
    func fetchTrendingMovies() {
        
        isLoading = true
        
        Task(priority: .background) {
            
            let result = await service.getTrendingMovies()
            
            DispatchQueue.main.async { [weak self] in
            
                switch (result) {
                case .success(let response):
                    self?.trendingMovies = response.results
                    
                case .failure(let error):
                    self?.error = error
                }
                
                self?.isLoading = false
            }
        }
    }
}
