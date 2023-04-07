//
//  MovieListsCellView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 06/04/2023.
//

import SwiftUI

struct MovieListsCellView: View {

    let movie: Movie
//viewModel: MovieDetailViewModel(MovieItem: Movie)
    var body: some View {
        NavigationLink(destination: MoviesDetailView(viewModel: MovieDetailsViewModel(movieId: movie.id))) {
            HStack(alignment: .top, spacing: 16) {
                ImageView(imageURL: ImagePathFactory.urlForImage(movie.posterPath, imageSize: .poster),
                          width: 86,
                          height: 132,
                          cornerRadius: 0)
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .font(.system(size: 18, weight: .bold))
                    dateLabel()
                        .font(.caption)
                    Text(movie.overview)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .lineLimit(5)
                }
                
            }
        }
    }

    private func dateLabel() -> Text? {
        if let releaseDate = movie.releaseDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return Text(formatter.string(from: releaseDate))
        }
        return nil
    }
}

struct MovieListsCellView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Mockable().loadJSON(filename: "Movie", type: Movie.self)
        MovieListsCellView(movie: movie)
    }
}
