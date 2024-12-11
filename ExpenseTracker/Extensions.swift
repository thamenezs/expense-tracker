//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Thais Souza on 10/12/24.
//

import Foundation
import SwiftUI

extension Color {
    static let backgroundColor = Color("Background")
    static let iconColor = Color("Icon")
    static let textColor = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
    
}


extension DateFormatter {
    static let allNumericBR: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parserdDate = DateFormatter.allNumericBR.date(from: self) else { return Date() }
        return parserdDate
    }
}
