//
//  ImagePathFactory.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

struct ImagePathFactory {
    
    static func pathForPoster(_ imagePath: String) -> URL?{
        return URL(string: "\(APIConstants.movieImageURL)/w200/\(imagePath)")
    }
    
    static func pathForBackdrop(_ imagePath: String) -> URL? {
        return URL(string: "\(APIConstants.movieImageURL)/w780/\(imagePath)")
    }
}
