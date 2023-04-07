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
    @Published private(set) var errorMessage: String?
    
    private(set) var page = 1
    private var totalPages: Int?
    
    init(service: MoviesServiceProtocol = MoviesAPIService()) {
        self.service = service
    }
    
    func fetchTrendingMovies(page: Int = 1) async {
        
        self.page = page
        
        if (page <= 1) {
            isLoading = true
        }
        
        let result = await service.getTrendingMovies(page: page)
        
        await MainActor.run {
            
            switch (result) {
            case .success(let response):
                trendingMovies.append(contentsOf: response.results)
                totalPages = response.totalPages
                
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
            
            isLoading = false
        }
    }
    
    func fetchNextSetIfNeeded(currentMovie: Movie) async {
        if (currentMovie.id == trendingMovies.last?.id && page < totalPages ?? 1) {
            await fetchTrendingMovies(page: page + 1)
        }
    }
}
