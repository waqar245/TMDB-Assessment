//
//  MovieListsCellView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 06/04/2023.
//

import SwiftUI

struct MovieListsCellView: View {

    let movie: Movie

    var body: some View {
        //NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(MovieItem: Movie))) {
            HStack(alignment: .top, spacing: 16) {
                thumbnail
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.system(size: 18, weight: .bold))
                    dateLabel()
                        .font(.system(size: 12, weight: .regular))
                    Text(movie.overview)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)
                        .lineLimit(5)
                }
                
            }
        //}
    }

    private func dateLabel() -> Text {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return Text(formatter.string(from: movie.releaseDate))
    }
    
    private var thumbnail: some View {
        AsyncImage(
            url: URL(string: "\(APIConstants.moviePosterURL)/\(movie.posterPath)"),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(width: 86, height: 132)
    }
}

struct MovieListsCellView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(id: 1,
                            title: "Avatar: The way of Water",
                            overview: "Second film in the series",
                            releaseDate: Date.now,
                            posterPath: "t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")
        MovieListsCellView(movie: movie)
    }
}
