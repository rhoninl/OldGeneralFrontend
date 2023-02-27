//
//  RechargeItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/27.
//

import SwiftUI

struct RechargeItem: View {
    var goldNum: Int
    var money: Int
    var choose: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("VIP + \(goldNum / 7)")
                    .foregroundColor(.white)
                    .padding(.all,4)
                    .background(.red)
                    .cornerRadius(10)
            }
            .font(.footnote)
            Text("💰 \(goldNum)")
                .padding(.all,2)
            HStack{
                Text("¥ \(money)")
                    .padding(.bottom,7)
            }
            .font(.caption2)
            .foregroundColor(.gray)
        }
        .frame(width: 100)
        .background(.opacity(choose ? 0.2 : 0.1))
        .cornerRadius(10)
        .lineLimit(1)
        .padding()
    }
}

struct RechargeItem_Previews: PreviewProvider {
    static var previews: some View {
        RechargeItem(goldNum: 42,money: 6,choose: false)
    }
}
