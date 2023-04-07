//
//  DateFormatter.swift
//  YassirAssessment
//
//  Created by Waqar Ahmed on 07/04/2023.
//

import Foundation

struct DateFormatterUtility {
    
    static var mediumStyleFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }
}
