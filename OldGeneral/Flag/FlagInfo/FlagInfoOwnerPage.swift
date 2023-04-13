//
//  FlagInfoOwnerPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/8.
//

import SwiftUI

struct FlagInfoOwnerPage: View {
    @Binding var flagInfo: Cdr_FlagDetailInfo
    @Binding var needFetch: Bool
    
    @State private var needSignInToday: Bool = false
    @State private var todayHasSignined:Bool = false
    @State private var needResurrect: Bool = false
    @State private var jumpToSignInFlagPage:Bool = false
    @State private var askForSkip: Bool = false
    @State private var rotate: Bool = false
    @State private var signInText: String = "打卡"
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var notice: messageNotice
    
    var body: some View {
        VStack {
            if needSignInToday && flagInfo.totalMaskNum > flagInfo.usedMaskNum {
                HStack{
                    Spacer()
                    Button {
                        askForSkip.toggle()
                        rotate.toggle()
                    } label: {
                        Text("不想打卡?")
                    }
                    .rotationEffect(.degrees(rotate ? 360 : 0))
                    .animation(.spring(), value: rotate)
                    .buttonStyle(.borderedProminent)
                    .tint(.indigo.opacity(0.7))
                    .padding(.trailing,10)
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
                }
            }
            Button {
                jumpToSignInFlagPage = true
            } label: {
                Text(signInText)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("YellowCardColor"))
            .padding()
            .disabled(!needSignInToday)
            .background(Color("white"))
            .alert(isPresented: $needResurrect) {
                Alert(title: Text(ResurrectFlagDescription), primaryButton: .default(Text("确认复活"),action: {
                    guard ResurrectFlag(flagInfo.id) else {
                        notice.ShowMessage(message: "复活失败", emoji: "😭")
                        return
                    }
                    notice.ShowMessage(message: "复活成功", emoji: "😇")
                }), secondaryButton: .default(Text("放弃挑战"),action: {
                    guard WaiverResurrect(flagInfo.id) else {
                        notice.ShowMessage(message: "放弃失败，请联系管理员", emoji: "🙁")
                        return
                    }
                    notice.ShowMessage(message: "成功放弃", emoji: "😅")
                }))
            }
        }
        .navigationDestination(isPresented: $jumpToSignInFlagPage) {
            SubmitSignInPage(needFetch: $needFetch, flagId: flagInfo.id,signInTime: Int64(flagInfo.signUpInfo.count + 1))
        }
        .onAppear{
            (needSignInToday,todayHasSignined) = CheckFlagNeedSigninToday(flagInfo)
            needResurrect =
                flagInfo.status == "resurrect" &&
                flagInfo.usedResurrectNum < flagInfo.totalResurrectNum
                signInText = updateSignInText()
            Task {
                do {
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
    func updateSignInText() -> String {
        guard flagInfo.currentTime < flagInfo.totalTime else {
            return "已挑战成功"
        }
        
        guard flagInfo.status == "running" else {
            return "当前状态不可打卡"
        }
        
        guard !needSignInToday else {
            return "打卡"
        }
        
        guard !todayHasSignined else {
            return "今日已打卡"
        }
        
        return "系统异常，请联系管理员"
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
        FlagInfoOwnerPage(flagInfo: .constant(info), needFetch: .constant(false))
    }
}
