//
//  YassirAssessmentApp.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import SwiftUI

@main
struct YassirAssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesListView(viewModel: MoviesListingViewModel())
        }
    }
}
