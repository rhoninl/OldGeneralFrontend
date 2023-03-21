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
                    Text(info.name)
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(1)
                HStack{
                    Text("创建时间: \(timestampToDate(info.startTime)) ")
                    HStack{
                        Text("状态: ")
                        Text(info.status)
                            .foregroundColor(getColorByStatus(info.status))

                    }
                }
                .font(.caption2)
            }
            Spacer()
            Text("\(info.currentTime)/\(info.totalTime)  >")
        }
    }
}

struct MyFlagItem_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagBasicInfo.with{ my in
            my.name = "This is test flag"
            my.status = "running"
            my.startTime = 0
            my.id = generateUUID()
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
