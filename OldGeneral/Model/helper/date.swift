//
//  date.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import Foundation

let MS = 1000000
let S = 1000 * MS
let Minute = 60 * S
let Hour = 60 * Minute
let Days = 24 * Hour
let Month = 30 * Days

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
    let components = calendar.dateComponents([.day], from: endDate, to: startDate)
    let days = components.day

    return days! + 1
}


func timestampToDate(_ date: Int64) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date/1000000)))
}

func getTimestampRFC1123 () -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

   return dateFormatter.string(from: Date())
}

func timestampToTime (_ date: Int64) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    
    return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date/1000000)))
}
