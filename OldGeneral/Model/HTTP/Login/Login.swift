//
//  Login.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import Foundation

func Login(username: String, password: String) -> Bool {
    print("login: username: \(username), password: \(password)")
    return username != "" && password != ""
}
