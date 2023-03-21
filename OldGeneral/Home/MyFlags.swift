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
        VStack(alignment: .leading,spacing: 0){
            Text("我的Flag")
                .padding([.leading,.bottom],15)
            
            Divider()
            List(data, id: \.self) { index in
                Button {
                    flagInfo = getFlagInfo(index.id)
                    jumpToFlagInfo = true
                } label: {
                    MyFlagItem(info: index)
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
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
            my.name = "This is test flag"
            my.status = "running"
            my.startTime = 0
            my.id = generateUUID()
            my.currentTime = 10
            my.totalTime = 20
        }
        let info1 = Cdr_FlagBasicInfo.with{ my in
            my.name = "This is test flag"
            my.status = "running"
            my.startTime = 0
            my.id = generateUUID()
            my.currentTime = 10
            my.totalTime = 20
        }
        let info2 = Cdr_FlagBasicInfo.with{ my in
            my.name = "This is test flag"
            my.status = "running"
            my.startTime = 0
            my.id = generateUUID()
            my.currentTime = 10
            my.totalTime = 20
        }
        MyFlags(data: [info,info1,info2])
    }
}
