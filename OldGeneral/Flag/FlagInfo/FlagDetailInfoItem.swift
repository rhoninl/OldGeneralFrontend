//
//  FlagInfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import SwiftUI

struct FlagDetailInfoItem: View {
    var description: String
    var data: String
    var body: some View {
        VStack(spacing: 6){
            Text(description)
                .foregroundColor(.gray).opacity(0.5)
                .font(.footnote)
            Text(data)
        }
    }
}

struct FlagDetailInfoItem_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailInfoItem(description: "description",data: "NaN")
    }
}
