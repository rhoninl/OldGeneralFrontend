//
//  error.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import Foundation


let repeatedAccount = "该用户名已存在"
let withoutError = " "

func praseErrorCode(_ code: String) -> String {
    var msg: String
    switch code {
    case "1001" :
        msg = repeatedAccount
    default:
        msg = withoutError
    }
    
    return msg
}
