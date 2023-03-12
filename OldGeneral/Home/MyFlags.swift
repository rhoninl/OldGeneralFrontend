//
//  MyFlags.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct MyFlags: View {
    var data: [Cdr_FlagBasicInfo]

    @State private var jumpToFlagInfo: Bool = false
    @State private var flagInfo: Cdr_FlagDetailInfo? = nil
    var body: some View {
        VStack(alignment: .leading){
            Text("我的Flag")
                .padding(.leading,15)
            Divider()
            List(data, id: \.self) { index in
                Button {
                    flagInfo = getFlagInfo(index.flagID)
                    jumpToFlagInfo = true
                } label: {
                    MyFlagItem(info: index)
                }
            }
        }
        .listStyle(.plain)
        .navigationDestination(isPresented: $jumpToFlagInfo) {
            if flagInfo != nil {
                FlagInfoPage(flagInfo!)
            }
        }
    }
}

struct MyFlags_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagBasicInfo.with{ my in
            my.flagName = "This is test flag"
            my.flagStatus = "running"
            my.startTime = 0
            my.flagID = generateUUID()
            my.currentTime = 10
            my.totalTime = 20
        }
        MyFlags(data: [info])
    }
}
