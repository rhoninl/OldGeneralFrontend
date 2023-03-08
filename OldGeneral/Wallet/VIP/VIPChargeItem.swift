//
//  VIPChargeItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct VIPChargeItem: View {
    var time: String
    var primaryPrice: Int
    var nowPrice: Int
    var isChoose: Bool
    var body: some View {
        VStack(spacing: 10){
            Text(time)
            Text("原价¥\(primaryPrice)")
                .font(.caption2)
                .strikethrough()
            HStack(spacing: 3){
                Text("¥")
                    .font(.footnote)
                    .padding(.top,10)
                Text(String(nowPrice))
                    .font(.title)
            }
        }
        .padding()
        .background(isChoose ?  Color.primary.opacity(0.2) : Color("ChargeCard"))
        .cornerRadius(5)
        .foregroundColor(isChoose ? Color("ChargeCard") : Color.black.opacity(0.8))
    }
}

struct VIPChargeItem_Previews: PreviewProvider {
    static var previews: some View {
        VIPChargeItem(time: "1个月", primaryPrice: 20, nowPrice: 30, isChoose: false)
    }
}
