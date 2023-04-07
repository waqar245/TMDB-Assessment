//
//  InfoTextWithAction.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import SwiftUI

struct InfoTextWithAction: View {
    
    let text: String
    let actionButtonTitle : String
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .center,
               spacing: 8) {
            
            Text(text)
                .multilineTextAlignment(.center)
            
            Button(actionButtonTitle) {
                action()
            }
        }
    }
}


struct InfoTextWithAction_Previews: PreviewProvider {
    static var previews: some View {
        InfoTextWithAction(text: "NO_DATA".localized,
                            actionButtonTitle: "RETRY".localized, action: {})
    }
}
