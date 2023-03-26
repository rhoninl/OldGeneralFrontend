//
//  Settings.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/5.
//

import Foundation

let serverAddress = "oldgeneral.top"
let grpcServerPort = 1314

//let serverAddress = "192.168.0.199"
//let grpcServerPort = 30001
let keyChainName = "com.oldgeneral"
let pictureServerAddress = "https://oldgeneral.obs.cn-north-4.myhuaweicloud.com:443/avatars/"
let hwAccessKeyId = ""
let pagesize:Int64 = 20
let VIPMultiplier: Float = 1.3
var ispreview: Bool = false
func preview() -> Bool {
    ispreview = true
    return true
}
