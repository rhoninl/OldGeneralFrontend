//
//  Flag.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import Foundation

struct FlagInfo: Hashable, Codable, Identifiable {
    var id: String
    var FlagName: String
    var CreatedAt: String
    var FlagCurrentCount: Int
    var FlagTotalCount: Int
    var FlagStatus: String
}
