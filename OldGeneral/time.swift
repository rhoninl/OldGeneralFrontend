//
//  time.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import Foundation

func today() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
            
    let today = Date()
    let dateString = formatter.string(from: today)
    
    return dateString
}

func tomorrow() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
            
    let today = Date().addingTimeInterval(86400)
    let dateString = formatter.string(from: today)
    
    return dateString
}
