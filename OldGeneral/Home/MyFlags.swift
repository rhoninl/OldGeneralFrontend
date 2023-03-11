//
//  MyFlags.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/23.
//

import SwiftUI

struct MyFlags: View {
    var data: [Cdr_FlagBasicInfo]
    var body: some View {
        VStack(alignment: .leading){
            Text("我的Flag")
                .padding(.leading,15)
            Divider()
            List(data, id: \.self) { flagInfo in
                NavigationLink{
                    FlagInfoPage()
                }label: {
                    MyFlagItem(info: flagInfo)
                }
                .buttonStyle(.plain)
            }
        }
        .listStyle(.plain)
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
