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
        Text(dateFormatter.string(from: date))
    }
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }
}

struct DateLabel_Previews: PreviewProvider {
    static var previews: some View {
        DateLabel(date: Date.now)
    }
}
