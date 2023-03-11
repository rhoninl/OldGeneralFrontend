//
//  MyFlagItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct MyFlagItem: View {
    var info: Cdr_FlagBasicInfo
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack{
                    Text(info.flagName)
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                    Text("\(info.currentTime)/\(info.totalTime)")
                }
                HStack{
                    Text("创建时间: \(timestampToDate(info.startTime)) ")
                    HStack{
                        Text("状态: ")
                        Text(info.flagStatus)
                            .foregroundColor(getColorByStatus(info.flagStatus))

                    }
                }
                .font(.caption2)
            }
            Spacer()
        }
//        .padding()
    }
}

struct MyFlagItem_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagBasicInfo.with{ my in
            my.flagName = "This is test flag"
            my.flagStatus = "running"
            my.startTime = 0
            my.flagID = generateUUID()
            my.currentTime = 10
            my.totalTime = 20
        }
        MyFlagItem(info: info)
    }
}

func getColorByStatus(_ status: String) -> Color {
    switch status {
    case "banned":
        return .gray
    case "finished":
        return .pink
    case "failed":
        return .red
    case "running":
        return .green
    default:
        return .primary
    }
}
