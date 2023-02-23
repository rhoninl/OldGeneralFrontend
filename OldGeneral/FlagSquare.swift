//
//  FlagSquare.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct FlagSquare: View {
    var body: some View {
        VStack{
            Text("This is Flag Square Page")
            FlagSquareItem()
        }
    }
}

struct FlagSquare_Previews: PreviewProvider {
    static var previews: some View {
        FlagSquare()
    }
}
