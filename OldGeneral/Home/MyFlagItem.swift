//
//  MyFlagItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct MyFlagItem: View {
    var info: FlagInfo
//    var CreatedAt: String = today()
//    var FlagStatus: String = "default"
//    var FlagName: String = "I have no name"
//    var currentNum: Int = 0
//    var totalNum: Int = 0
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack{
                    Text(info.FlagName)
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                    Text("\(info.FlagCurrentCount)/\(info.FlagTotalCount)")
                }
                HStack{
                    Text("创建时间: \(info.CreatedAt) ")
                    HStack{
                        Text("状态: ")
                        Text(info.FlagStatus)
                            .foregroundColor(getColorByStatus(info.FlagStatus))

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
        MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
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
