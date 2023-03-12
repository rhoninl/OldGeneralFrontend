//
//  Settings.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/5.
//

import Foundation

//let serverAddress = "oldgeneral.top"
//let grpcServerPort = 1314

let serverAddress = "192.168.0.2"
let grpcServerPort = 30001
let keyChainName = "com.oldgeneral"
var ispreview: Bool = false
let pagesize:Int64 = 20

func preview() -> Bool {
    ispreview = true
    return true
}
