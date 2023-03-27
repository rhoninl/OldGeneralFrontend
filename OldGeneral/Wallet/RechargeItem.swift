//
//  RechargeItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct RechargeItem: View {
    var money: Int64
    @Binding var currentMoney: Int64
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("VIP + \(moneyToVIPPlus(money))")
                    .foregroundColor(.white)
                    .padding(.all,4)
                    .background(.red)
                    .cornerRadius(10)
            }
            .font(.footnote)
            Text("💰 \(moneyToGold(money))")
                .padding(.all,2)
            HStack{
                Text("¥ \(money)")
                    .padding(.bottom,7)
            }
            .font(.caption2)
            .foregroundColor(.gray)
        }
        .frame(width: 100)
        .background(.opacity(currentMoney == money ? 0.2 : 0.1))
        .cornerRadius(10)
        .lineLimit(1)
        .padding()
        .onTapGesture {
            currentMoney = money
        }
    }
}

struct RechargeItem_Previews: PreviewProvider {
    static var previews: some View {
        RechargeItem(money: 6,currentMoney: .constant(10))
    }
}
