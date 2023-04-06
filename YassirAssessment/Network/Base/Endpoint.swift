//
//  Endpoint.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import Foundation

struct Endpoint {
    let method: RequestMethod
    let path: String
    let headers: [String: String]?
    let parameters: [URLQueryItem]?
    
    init(method: RequestMethod, path: String, headers: [String: String]? = nil, parameters: [URLQueryItem]? = nil) {
        self.method = method
        self.path = path
        self.headers = headers
        self.parameters = parameters
    }
}

