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
    let headers: [String: String]? = nil
    let parameters: [URLQueryItem]? = nil
}

