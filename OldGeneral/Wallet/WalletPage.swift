//
//  Wallet.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/25.
//

import SwiftUI

struct WalletPage: View {
    @State private var goldNum: Int64 = -1
    var body: some View {
        VStack{
            VStack (alignment: .leading){
                HStack{
                    Text("我的金币\n \(goldNum) 💰")
                    Spacer()
                }
                .padding(.all,5)
                NavigationLink {
                    RechargePage()
                } label: {
                    Spacer()
                    Text("充值 >")
                }
                .background(.clear)
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.yellow)
            .foregroundColor(.black)
            .cornerRadius(14)
            HStack{
                Text(" 账户流水")
                    .padding([.leading,.top],10)
                Spacer()
            }
            FlowDetailsPage()
            .cornerRadius(10)
        }
        .padding()
        .onAppear {
            goldNum = getCurrentMoney()
        }
    }
}

struct WalletPage_Previews: PreviewProvider {
    static var previews: some View {
        WalletPage()
    }
}
