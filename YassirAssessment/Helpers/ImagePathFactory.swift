//
//  ImagePathFactory.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

enum ImageSize: Int {
    case w300 = 300
    case w780 = 780
    case w200 = 200
}

struct ImagePathFactory {
    static func urlForImage(_ imagePath: String?, imageSize: ImageSize) -> URL?{
        if let imagePath {
            return URL(string: "\(APIConstants.movieImageURL)/w\(imageSize.rawValue)/\(imagePath)")
        }
        
        return nil
    }
}
