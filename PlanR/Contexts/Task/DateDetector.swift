//
//  DateDetector.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 29/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import Foundation

//struct DateDetector {
//
//    func convertToDate() -> Date {
//        return Date()
//    }
//
//}

extension String {
    func isContainingToday() -> Bool {
        
        let range = NSRange(location: 0, length: self.utf16.count)
        let regex = try! NSRegularExpression(pattern: "hari ini|today", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }
    
    func convertToDate() -> Date {
        return Date()
    }
}
