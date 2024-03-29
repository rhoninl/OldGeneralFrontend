//
//  flagInfoBarPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/13.
//

import SwiftUI

struct flagInfoBarItem: View {
    var info: Cdr_FlagDetailInfo = Cdr_FlagDetailInfo()
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 5){
                Text(info.name)
                Text("挑战金: \(info.challengeNum)金")
                    .font(.caption2)
            }
            Spacer()
            Text("详情")
                .padding([.leading,.trailing],15)
                .padding([.top,.bottom],7)
            .background(.yellow.opacity(0.7))
            .cornerRadius(7)
            .foregroundColor(.primary.opacity(0.7))
        }
        .font(.caption)
        .lineLimit(1)
        .padding(.all,10)
        .background(.yellow.opacity(0.2))
        .cornerRadius(8)
    }
}

struct flagInfoBarItem_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagDetailInfo.with{ my in
            my.name = "this is name"
            my.challengeNum = 100
        }
        flagInfoBarItem(info: info)
    }
}
