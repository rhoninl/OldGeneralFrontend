//
//  props.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/5.
//

import Foundation

func GetMaskNumByDay (_ dayNum: Int64) -> Int64 {
    let num = dayNum / 7
    return isVIP ? num * 2 : num
}

func GetResurrectNumByDay(_ dayNum: Int64) -> Int64 {
    return dayNum >= 30 ? 1 : 0
}
