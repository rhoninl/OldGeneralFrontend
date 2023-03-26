//
//  SwiftUIView.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct FlowDetailItem: View {
    var info: Cdr_WaterFlow = Cdr_WaterFlow.with{ my in
        my.id = "123"
        my.goldNum = 444
        my.content = "创建Flag"
        my.createdAt = getTimeStamp()
    }

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(info.content)
                HStack{
                    Text(timestampToDate(info.createdAt)+" "+timestampToTime(info.createdAt))
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Text("\(info.goldNum > 0 ? "+ "+String(info.goldNum) : "- " + String(info.goldNum * -1))")
                .foregroundColor(info.goldNum < 0 ? .primary : .orange)
        }
        .padding(.all,3)
    }
}

struct FlowDetailItem_Previews: PreviewProvider {
    static var previews: some View {
        FlowDetailItem()
    }
}
