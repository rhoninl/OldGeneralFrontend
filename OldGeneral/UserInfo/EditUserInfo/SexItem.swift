//
//  SexItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/3.
//

import SwiftUI

struct SexItem: View {
    var str: String = "T"
    var ischoose: Bool = false
    var body: some View {
        Group{
            Text(str)
                .padding([.top,.bottom],20)
                .padding(.all,20)
                .font(Font.custom("", size: 50))
                .background(ischoose ? Color.yellow : Color.gray)
                .cornerRadius(10)
        }
    }
}

struct SexItem_Previews: PreviewProvider {
    static var previews: some View {
        SexItem(ischoose: true)
    }
}
