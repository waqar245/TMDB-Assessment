//
//  ContentView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear {
            fetchMovies()
        }
        .padding()
    }
    
    func fetchMovies() {
        Task.init {
            //isLoading = true
            let movies = await MoviesService().getTrendingMovies()
            print("movies")
            //isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
