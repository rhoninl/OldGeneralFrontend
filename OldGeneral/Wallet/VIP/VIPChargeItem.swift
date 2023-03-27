//
//  VIPChargeItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct VIPChargeItem: View {
    @Binding var currentTime: Int64
    var chargeTime: Int64
    var primaryPrice: Int64
    var nowPrice: Int64
    var body: some View {
        VStack(spacing: 10){
            Text("\(chargeTime)个月")
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
        .background(chargeTime == currentTime ?  Color.primary.opacity(0.2) : Color("ChargeCard"))
        .cornerRadius(5)
        .foregroundColor(chargeTime == currentTime ? Color("ChargeCard") : Color.black.opacity(0.8))
        .onTapGesture {
            currentTime = chargeTime
        }
    }
}

struct VIPChargeItem_Previews: PreviewProvider {
    static var previews: some View {
        VIPChargeItem(currentTime:.constant(10), chargeTime: 20, primaryPrice: 1, nowPrice: 10)
    }
}
