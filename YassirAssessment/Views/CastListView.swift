//
//  CastListView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import SwiftUI

struct CastListView: View {
    
    let cast: [Cast]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            Text("CAST".localized)
                .font(.system(.title3, weight: .bold))
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(cast) { castMember in
                        CastCellView(cast: castMember)
                            .frame(maxWidth: 124, maxHeight: 400)
                    }
                }
            }
        }
    }
}

struct CastListView_Previews: PreviewProvider {
    static var previews: some View {
        let creditsResponse = Mockable().loadJSON(filename: "Credits", type: CreditsResponse.self)
        let castMembers = creditsResponse.cast!
        CastListView(cast: castMembers)
    }
}
