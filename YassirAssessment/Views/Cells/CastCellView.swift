//
//  CastCellView.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import SwiftUI

struct CastCellView: View {
    
    let cast: Cast
    
    var body: some View {
        
        VStack {
            
            //Image
            ImageView(imageURL:
                        ImagePathFactory.urlForImage(cast.profileImage,
                                                        imageSize: .cast),
                      width: 124,
                      height: 200,
                      cornerRadius: 8)
            .shadow(radius: 4)
            
            //Name
            Text(cast.name)
                .font(.caption)
                
            
            //Character Name
            if let character = cast.character {
                Text(character)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CastCellView_Previews: PreviewProvider {
    static var previews: some View {
        let response = Mockable().loadJSON(filename: "Credits", type: CreditsResponse.self)
        CastCellView(cast: (response.cast?.first!)!)
    }
}
