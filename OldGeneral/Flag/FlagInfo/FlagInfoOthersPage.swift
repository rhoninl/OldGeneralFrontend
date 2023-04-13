//
//  FlagInfoOthersPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/4/8.
//

import SwiftUI

struct FlagInfoOthersPage: View {
    @EnvironmentObject var notice: messageNotice
    @State var flagInfo: Cdr_FlagDetailInfo
    @State private var siegeText: String = "围观"
    @State private var canSiege: Bool = false
    @State private var alertSiege: Bool = false
    @State private var showResult: Bool = false
    var body: some View {
        VStack{
            Button {
                alertSiege = true
            } label: {
                Text(siegeText)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("YellowCardColor"))
            .disabled(!canSiege)
            .padding()
        }
        .background(Color("white"))
        .alert(isPresented: $alertSiege) {
            Alert(title: Text("围观分钱"), message: Text(ConfirmSiegeDesctiption)
                  , primaryButton: .default(Text("支付10金币")){
                
                guard !trytoSiege() else {
                    return
                }
                notice.ShowMessage(message: "围观成功", emoji: "🎉")
            },secondaryButton: .destructive(Text("放弃资格")))
        }
        .onAppear {
            siegeText = updateSiegeText()
        }
    }
    func trytoSiege() -> Bool {
        guard getCurrentMoney() >= 10 else {
            notice.ShowMessage(message: "余额不足，请先充值", emoji: "😭")
            return false
        }
        guard SiegeFlag(flagInfo.id) else {
            notice.ShowMessage(message: "围观失败", emoji: "😭")
            return false
        }
        
        return true
    }
    func updateSiegeText() -> String {
        guard flagInfo.status == "running" else {
            return "当前状态不可围观"
        }
        
        guard CheckFlagisSieged(flagInfo.id) else {
            return "已围观"
        }
        
        canSiege = true
        return "围观分钱"
    }
}

struct FlagInfoOthersPage_Previews: PreviewProvider {
    static var previews: some View {
        FlagInfoOthersPage(flagInfo: Cdr_FlagDetailInfo())
            .environmentObject(messageNotice())
    }
}
