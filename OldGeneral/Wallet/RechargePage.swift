//
//  RechargePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct RechargePage: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var money: Int64 = 6
    @State private var alert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Spacer()
            Text("选择一个金额")
            LazyVGrid(columns: columns) {
                RechargeItem(money: 6, currentMoney: $money)
                RechargeItem(money: 12, currentMoney: $money)
                RechargeItem(money: 30, currentMoney: $money)
                RechargeItem(money: 40, currentMoney: $money)
                RechargeItem(money: 68, currentMoney: $money)
                RechargeItem(money: 98, currentMoney: $money)
            }
            .padding()
            Spacer()
            Button {
                guard UpdateMoney(moneyToVIPTotal(money),content: "充值\(money)元") else {
                    print("充值失败")
                    return
                }
                alert = true
            } label: {
                Text("支 付")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
            }
            .alert(isPresented: $alert) {
                Alert(title: Text("充值 \(money)元 成功"), message: Text("余额在24小时之内到账，请注意查收")
                      , dismissButton: .default(Text("我知道了！"),action: {
                    self.presentationMode.wrappedValue.dismiss()
                }))
            }
            .padding([.leading,.trailing],10)
            .tint(.yellow)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct RechargePage_Previews: PreviewProvider {
    static var previews: some View {
        RechargePage()
    }
}
