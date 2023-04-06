//
//  APIConstants.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

struct APIConstants {
    static let host = Bundle.main.infoDictionary?["ServerURL"] as! String
    static let apiKey = Bundle.main.infoDictionary?["APIKey"] as! String
    static let apiVersion = Bundle.main.infoDictionary?["APIVersion"] as! Int
    static let moviePosterURL = Bundle.main.infoDictionary?["MoviePosterURL"] as! String
}
