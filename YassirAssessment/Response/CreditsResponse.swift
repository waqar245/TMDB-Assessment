//
//  CreditsResponse.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

struct CreditsResponse: Codable {
    let id: Int
    let cast: [Cast]?
}
