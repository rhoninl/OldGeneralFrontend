//
//  Register.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import Foundation

func Register(username: String, password: String) -> Bool {
    print("register: username: \(username), password: \(password)")
    return username != "" && password != ""
}

