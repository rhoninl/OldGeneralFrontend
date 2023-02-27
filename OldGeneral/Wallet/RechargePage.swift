//
//  RechargePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct RechargePage: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var money: Int = 6
    @State private var alert: Bool = false
    var body: some View {
        VStack{
            Spacer()
            Text("选择一个金额")
            LazyVGrid(columns: columns) {
                RechargeItem(goldNum: 42, money: 6,choose: money == 6)
                    .onTapGesture {
                        money = 6
                    }
                RechargeItem(goldNum: 85, money: 12, choose: money == 12)
                    .onTapGesture {
                        money = 12
                    }
                RechargeItem(goldNum: 222, money: 30, choose: money == 30)
                    .onTapGesture {
                        money = 30
                    }
                RechargeItem(goldNum: 288, money: 40, choose: money == 40)
                    .onTapGesture {
                        money = 40
                    }
                RechargeItem(goldNum: 480, money: 68, choose: money == 68)
                    .onTapGesture {
                        money = 68
                    }
                RechargeItem(goldNum: 696, money: 98, choose: money == 98)
                    .onTapGesture {
                        money = 98
                    }
            }
            .padding()
            Spacer()
            Button {
                alert = true
            } label: {
                Text("支 付")
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
            }
            .alert(isPresented: $alert) {
                Alert(title: Text("充值 \(money)元 成功"), message: Text("余额在24小时之内到账，请注意查收")
                      , dismissButton: .default(Text("我知道了！")))
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
