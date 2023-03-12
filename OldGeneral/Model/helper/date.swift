//
//  date.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import Foundation

func getTimeStamp() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000000)
}

func today() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000000)
}

func tomorrow() -> Int64 {
    return Int64(Date().addingTimeInterval(86400).timeIntervalSince1970 * 1000000)
}

func diffDateNow(_ date: Int64) -> Int {
    let startDate = Date()
    let endDate = Date(timeIntervalSince1970: TimeInterval(date / 1000000))

    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: startDate, to: endDate)
    let days = components.day

    return days! + 1
}


func timestampToDate(_ date: Int64) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date/1000000)))
}
