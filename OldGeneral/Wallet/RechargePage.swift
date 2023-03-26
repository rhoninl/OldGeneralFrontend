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
                RechargeItem(money: 6,choose: money == 6)
                    .onTapGesture {
                        money = 6
                    }
                RechargeItem(money: 12, choose: money == 12)
                    .onTapGesture {
                        money = 12
                    }
                RechargeItem(money: 30, choose: money == 30)
                    .onTapGesture {
                        money = 30
                    }
                RechargeItem(money: 40, choose: money == 40)
                    .onTapGesture {
                        money = 40
                    }
                RechargeItem(money: 68, choose: money == 68)
                    .onTapGesture {
                        money = 68
                    }
                RechargeItem(money: 98, choose: money == 98)
                    .onTapGesture {
                        money = 98
                    }
            }
            .padding()
            Spacer()
            Button {
                guard UpdateMoney(moneyToGold(money),content: "充值\(money)元") else {
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
