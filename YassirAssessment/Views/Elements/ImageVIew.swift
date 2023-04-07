//
//  ImageVIew.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import SwiftUI

struct ImageView: View {
    
    let imageURL: URL?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        CachedAsyncImage(
            url: imageURL,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(cornerRadius)
            },
            placeholder: {
                Color.gray.opacity(0.2)
            }
        )
        .frame(width: width, height: height)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageURL: URL(string: "https://image.tmdb.org/t/p/w780/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg"),
                  width: 86,
                  height: 132,
                  cornerRadius: 8)
    }
}
