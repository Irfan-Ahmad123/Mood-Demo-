//
//  Date+Ext.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-03-07.
//

import Foundation

extension String{
    func converToDate()->Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
    
        return dateFormatter.date(from: self)!
    }
    
    func convertToDisplayFormat() -> String{
        guard let date = self.converToDate() else {return "N/A"}
        return date.convertToMonthYearFromat()
    }
}
