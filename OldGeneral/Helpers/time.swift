//
//  time.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import Foundation

func today() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
            
    let today = Date()
    let dateString = formatter.string(from: today)
    
    return dateString
}

func tomorrow() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
            
    let today = Date().addingTimeInterval(86400)
    let dateString = formatter.string(from: today)
    
    return dateString
}

func diffDateNow(_ date: Int64) -> Int {
//    let startDate = dateFormatter.date(from: "2022-01-01")! // replace with your start date
    let startDate = Date()
    let endDate = Date(timeIntervalSince1970: TimeInterval(date / 1000000))

    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: startDate, to: endDate)
    let days = components.day

    print("Number of days between start and end date: \(days!)")
    return days! + 1
}
