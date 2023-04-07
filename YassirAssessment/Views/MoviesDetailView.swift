//
//  MoviesDetailView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 06/04/2023.
//

import SwiftUI

struct MoviesDetailView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    var body: some View {
        
        ZStack {
            if (viewModel.isLoaded) {
                if let movie = viewModel.movie {
                    ScrollView {
                        VStack {
                            //Cover Image
                            if let backdropPath = movie.backdropPath {
                                ImageView(imageURL: ImagePathFactory.urlForImage(backdropPath,
                                                                                 imageSize: .backdrop),
                                          width: UIScreen.main.bounds.size.width,
                                          height: UIScreen.main.bounds.size.width/1.74,
                                          cornerRadius: 0)
                            }
                            
                            //Movie Details
                            VStack(spacing: 24) {
                                
                                HStack(alignment: .top, spacing: 16) {
                                    //Poster Image
                                    ImageView(imageURL: ImagePathFactory.urlForImage(movie.posterPath, imageSize: .poster),
                                              width: 142,
                                              height: 224,
                                              cornerRadius: 8)
                                    .shadow(radius: 8)
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        //Title
                                        Text(movie.title)
                                            .font(.system(size: 32, weight: .bold))
                                        
                                        //Release Date
                                        if let releaseDate = movie.releaseDate {
                                            DateLabel(date: releaseDate)
                                                .font(.system(size: 14, weight: .medium))
                                        }
                                        
                                        //Runtime
                                        if let runtime = movie.runtime {
                                            Text("\(runtime/60)h \(runtime%60)min")
                                                .font(.system(size: 14, weight: .medium))
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                
                                //Overview
                                VStack(alignment: .leading, spacing: 14) {
                                    Text("Overview")
                                        .font(.system(size: 20, weight: .bold))
                                    
                                    Text(movie.overview)
                                        .font(.system(size: 18, weight: .regular))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                //Cast
                                if let cast = viewModel.cast {
                                    VStack(alignment: .leading, spacing: 14) {
                                        Text("Top Bill Casts")
                                            .font(.system(size: 20, weight: .bold))
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            LazyHStack(spacing: 20) {
                                                ForEach(cast) { castMember in
                                                    CastCellView(cast: castMember)
                                                        .frame(maxWidth: 124, maxHeight: 400)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding([.leading,.trailing], 16)
                        }
                    }
                }
                else {
                    //Error Message
                    Text("Error: \(viewModel.errorMessage ?? "Details fetch fail")")
                }
                
            }
            else {
                //Loader
                ProgressView().progressViewStyle(.circular)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            fetchMovieDetails()
        }
    }
    
    func fetchMovieDetails() {
        viewModel.fetchMovieDetails()
    }
}

struct MoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Mockable().loadJSON(filename: "Movie", type: Movie.self)
        MoviesDetailView(viewModel: MovieDetailsViewModel(movieId: movie.id))
    }
}
