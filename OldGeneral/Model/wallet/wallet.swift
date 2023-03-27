//
//  wallet.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/26.
//

import Foundation

func moneyToGold(_ num: Int64) -> Int64 {
    return num * 7
}

func moneyToVIPPlus(_ num: Int64) -> Int64 {
    var tmpgold = Float(moneyToGold(num))
    tmpgold = tmpgold * (VIPMultiplier - 1)
    return Int64(tmpgold)
}

func moneyToVIPTotal(_ num: Int64) -> Int64 {
    return isVIP ? moneyToGold(num) + moneyToVIPPlus(num) : moneyToGold(num)
}
