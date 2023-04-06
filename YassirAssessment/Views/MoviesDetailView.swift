//
//  MoviesDetailView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 06/04/2023.
//

import SwiftUI

struct MoviesDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        
        ScrollView {
            VStack {
                //Cover Image
                if let backdropPath = movie.backdropPath {
                    ImageView(imageURL: ImagePathFactory.pathForBackdrop(backdropPath),
                              width: UIScreen.main.bounds.size.width,
                              height: UIScreen.main.bounds.size.width/1.74)
                }
                
                //Movie Details
                VStack(spacing: 24) {
                    
                    //Poster Image and Title
                    HStack(alignment: .top, spacing: 16) {
                        ImageView(imageURL: ImagePathFactory.pathForBackdrop(movie.posterPath),
                                  width: 142,
                                  height: 224)
                        .cornerRadius(20.0)
                        .shadow(radius: 8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(movie.title)
                                .font(.system(size: 32, weight: .bold))
                            
                            if let releaseDate = movie.releaseDate {
                                DateLabel(date: releaseDate)
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
                }
                .padding([.leading,.trailing], 16)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MoviesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Mockable().loadJSON(filename: "Movie", type: Movie.self)
        MoviesDetailView(movie: movie)
    }
}
