//
//  Token.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/25.
//

import Foundation
import KeychainAccess

var token: String? = nil
let keyChain = Keychain(service: keyChainName)

func StoreToken(_ token: String){
    keyChain["Token"] = token
}

func GetToken(_ cache: Bool = true) -> String? {
    if token == nil || !cache {
        token = keyChain["Token"]
    }
    
    return token
}

func RemoveToken() {
    keyChain["Token"] = nil
    token = nil
}

