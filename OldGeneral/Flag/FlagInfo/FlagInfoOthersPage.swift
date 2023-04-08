//
//  FlagInfoOthersPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/8.
//

import SwiftUI

struct FlagInfoOthersPage: View {
    init(info: Cdr_FlagDetailInfo) {
        flagInfo = info
    }
    @EnvironmentObject var notice: messageNotice
    @State private var flagInfo: Cdr_FlagDetailInfo
    @State private var canSiege: Bool = false
    @State private var alertSiege: Bool = false
    @State private var showResult: Bool = false
    @State private var errMsg:String = ""
    var body: some View {
        VStack{
            Button {
                alertSiege = true
            } label: {
                Text("围观分钱")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("YellowCardColor"))
            .padding()
        }
        .alert(isPresented: $alertSiege) {
            Alert(title: Text("围观分钱"), message: Text(ConfirmSiegeDesctiption)
                  , primaryButton: .default(Text("支付10金币")){
                TrytoSiege()
                guard errMsg == "" else {
                    return
                }
                notice.ShowMessage(message: "围观成功", emoji: "🎉")
            },secondaryButton: .destructive(Text("放弃资格")))
        }
    }
    func TrytoSiege() {
        guard getCurrentMoney() >= 10 else {
            errMsg = "余额不足，请先充值"
            print(errMsg)
            notice.ShowMessage(message: errMsg, emoji: "😭")
            return
        }
        guard SiegeFlag(flagInfo.id) else {
            errMsg = "围观失败"
            print(errMsg)
            notice.ShowMessage(message: errMsg, emoji: "😭")
            return
        }
        
        errMsg = ""
    }
}

struct FlagInfoOthersPage_Previews: PreviewProvider {
    static var previews: some View {
        FlagInfoOthersPage(info: Cdr_FlagDetailInfo())
            .environmentObject(messageNotice())
    }
}
