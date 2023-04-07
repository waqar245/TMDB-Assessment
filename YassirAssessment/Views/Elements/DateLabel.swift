//
//  DateLabel.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import SwiftUI

struct DateLabel: View {
    
    let date: Date
    
    var body: some View {
        Text(DateFormatterUtility.mediumStyleFormatter.string(from: date))
    }
}

struct DateLabel_Previews: PreviewProvider {
    static var previews: some View {
        DateLabel(date: Date.now)
    }
}
