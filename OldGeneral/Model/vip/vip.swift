//
//  vip.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/27.
//

import Foundation

func vipTimeToPrice(_ num: Int64) -> Int64 {
    switch num {
    case 1:
        return 18
    case 3:
        return 45
    case 12:
        return 138
    default:
        return -1
    }
}
