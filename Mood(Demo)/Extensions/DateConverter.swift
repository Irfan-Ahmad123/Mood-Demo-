//
//  Date.swift
//  Mood(Demo)
//
//  Created by Rashdan Natiq on 2024-03-07.
//


import Foundation

extension Date{
    func convertToMonthYearFromat ()-> String{
         let dateFromatter = DateFormatter()
        dateFromatter.dateFormat = "E, d MMMM HH:mm"
        return dateFromatter.string(from: self)
    }
}
