//
//  Credit.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

struct Cast: Codable, Identifiable {
    let id: Int
    let name: String
    let character: String?
    let profileImage: String?
    let order: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case character
        case profileImage = "profile_path"
        case order
    }
}
