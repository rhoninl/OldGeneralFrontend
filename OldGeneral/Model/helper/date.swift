//
//  date.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import Foundation

func getTimeStamp() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000)
}
