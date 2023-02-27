//
//  Wallet.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/25.
//

import SwiftUI

struct WalletPage: View {
    private var GoldNum: Int = 10
    var body: some View {
        VStack{
            VStack (alignment: .leading){
                HStack{
                    Text("我的金币\n \(GoldNum) 💰")
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
            .cornerRadius(20)
        }
        .padding()
    }
}

struct WalletPage_Previews: PreviewProvider {
    static var previews: some View {
        WalletPage()
    }
}
