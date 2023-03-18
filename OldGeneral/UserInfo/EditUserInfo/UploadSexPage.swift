//
//  UploadSexPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UploadSexPage: View {
    @EnvironmentObject var userInfo: userInfoShared
    @Environment(\.presentationMode) var presentationMode
    @State var currentSex = "男"

    var body: some View {
        VStack{
            Text("选择性别")
                .padding()
            HStack(spacing: 50){
                SexItem(str: "♂",ischoose: userInfo.data.gender == "男")
                    .onTapGesture {
                        userInfo.data.gender = "男"
                    }
                SexItem(str: "♀",ischoose: userInfo.data.gender == "女")
                    .onTapGesture {
                        userInfo.data.gender = "女"
                    }
            }
            Button {
                guard UpdateUserInfo(userInfo: userInfo.data) else {
                    return
                }
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("确认")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(currentSex == "男" ? .blue : .pink )
            .padding()
            Spacer()
        }
    }
}

struct UploadSexPage_Previews: PreviewProvider {
    static var previews: some View {
        UploadSexPage()
            .environmentObject(userInfoShared())
    }
}
