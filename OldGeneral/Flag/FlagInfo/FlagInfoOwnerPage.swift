//
//  FlagInfoOwnerPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/8.
//

import SwiftUI

struct FlagInfoOwnerPage: View {
    init(info: Cdr_FlagDetailInfo) {
        flagInfo = info
    }
    var flagInfo: Cdr_FlagDetailInfo
    
    @State private var needSignInToday: Bool = false
    @State private var needResurrect: Bool = false
    @State private var jumpToSignInFlagPage:Bool = false
    @State private var askForSkip: Bool = false
    @State private var rotate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            if needSignInToday && flagInfo.totalMaskNum > flagInfo.usedMaskNum {
                HStack{
                    Spacer()
                    Button {
                        rotate.toggle()
                        askForSkip.toggle()
                    } label: {
                        Text("不想打卡?")
                    }
                    .rotationEffect(.degrees(rotate ? 360 : 0))
                    .animation(.spring(), value: rotate)
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo.opacity(0.7))
                    .padding(.trailing,10)
                }
            }
            Button {
                jumpToSignInFlagPage = true
            } label: {
                Text(needSignInToday ? "打卡" : "今日不可打卡" )
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("YellowCardColor"))
            .padding()
            .disabled(!needSignInToday)
            .background(.white)
        }
        .navigationDestination(isPresented: $jumpToSignInFlagPage) {
            SubmitSignInPage(flagId: flagInfo.id,signInTime: Int64(flagInfo.signUpInfo.count + 1))
        }
        .alert(isPresented: $askForSkip) {
            Alert(title: Text("您目前有 \(flagInfo.totalMaskNum - flagInfo.usedMaskNum) 张🎭，您是否使用一张来跳过今天的打卡？"), primaryButton: .default(Text("不，我不是小丑(不使用)")),
                secondaryButton: .default(Text("是的 我就是小丑(使用)"),action: {
                guard SkipFlag(flagInfo.id) else {
                    print("failed to skip flag")
                    return
                }
                presentationMode.wrappedValue.dismiss()
            }))
        }
        .alert(isPresented: $needResurrect) {
            Alert(title: Text(ResurrectFlagDescription), primaryButton: .default(Text("确认复活")), secondaryButton: .default(Text("放弃挑战")))
        }
        .onAppear{
            Task {
                do {
                    needSignInToday = CheckFlagNeedSigninToday(flagInfo)
                    needResurrect = flagInfo.status == "resurrect"
                    while true {
                        rotate.toggle()
                        try await Task.sleep(nanoseconds: UInt64(3 * S))
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct FlagInfoOwnerPage_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagDetailInfo.with{ my in
            my.id = "flagId"
            my.totalMaskNum = 10
            my.usedMaskNum = 0
            my.userAvatar = "https://as1.ftcdn.net/v2/jpg/03/03/97/00/1000_F_303970065_Yi0UpuVdTb4uJiEtRdF8blJLwcT4Qd4p.jpg"
            my.signUpInfo = []
        }
        FlagInfoOwnerPage(info: info)
    }
}
