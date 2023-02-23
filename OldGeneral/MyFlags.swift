//
//  MyFlags.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct MyFlags: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("我的Flag")
                .padding(.leading,15)
            Divider()
            List {
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                MyFlagItem(info: FlagInfo(id: "This is userId", FlagName: "This is FlagName1", CreatedAt: today(), FlagCurrentCount: 10, FlagTotalCount: 10, FlagStatus: "running"))
                
            }
        }
        .listStyle(.plain)
    }
}

struct MyFlags_Previews: PreviewProvider {
    static var previews: some View {
        MyFlags()
    }
}
