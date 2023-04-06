//
//  ContentView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    
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
                        }
                    }
                    .padding([.leading, .trailing], -4)
                    .listStyle(.plain)
                    .refreshable {
                        fetchItems(forceRefresh: true)
                    }
                }
            }
            .navigationBarTitle("Trending Movies", displayMode: .large) //.localized
            .onAppear{
                fetchItems()
            }
        }
    }
    
    private func fetchItems(forceRefresh: Bool = false) {
        if (didLoad == false || forceRefresh) {
            viewModel.fetchTrendingMovies()
            didLoad = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MoviesListingViewModel(service: MoviesMockService()))
    }
}
