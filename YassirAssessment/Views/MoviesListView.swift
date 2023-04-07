//
//  ContentView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import SwiftUI

struct MoviesListView: View {
    
    @StateObject var viewModel: MoviesListingViewModel
    @State private var didLoad: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if (viewModel.isLoading) {
                    ProgressView().progressViewStyle(.circular)
                }
                else {
                    List {
                        ForEach(viewModel.trendingMovies) { movie in
                            MovieListsCellView(movie: movie)
                                .task {
                                    await viewModel.fetchNextSetIfNeeded(currentMovie: movie)
                                }
                        }
                    }
                    .padding([.leading, .trailing], -4)
                    .listStyle(.plain)
                    .refreshable {
                        fetchItems(forceRefresh: true)
                    }
                }
            }
            .navigationBarTitle("TRENDING".localized, displayMode: .large)
            .onAppear{
                fetchItems()
            }
        }
    }
    
    private func fetchItems(forceRefresh: Bool = false) {
        if (didLoad == false || forceRefresh) {
            Task.init {
                await viewModel.fetchTrendingMovies()
                didLoad = true
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(viewModel: MoviesListingViewModel(service: MoviesMockService()))
    }
}
