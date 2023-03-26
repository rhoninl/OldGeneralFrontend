//
//  VIPChargePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct VIPChargePage: View {
    var username: String
    var expiryTime: String = "2022-10-10"
    @State private var price: Int = 18
    @State private var chargeAlert: Bool = false
    
    var body: some View {
        VStack(){
            HStack{
                VStack(alignment: .leading,spacing: 6){
                    Text(username)
                    Text("开通VIP专享超值特权 \(expiryTime)")
                        .font(.caption2)
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding()
            HStack(spacing: 20){
                VIPChargeItem(time: "1个月", primaryPrice: 20, nowPrice: 18, isChoose: price == 18)
                    .onTapGesture {
                        price = 18
                    }
                VIPChargeItem(time: "3个月", primaryPrice: 50, nowPrice: 45, isChoose: price == 45)
                    .onTapGesture {
                        price = 45
                    }
                VIPChargeItem(time: "12个月", primaryPrice: 216, nowPrice: 138, isChoose: price == 138)
                    .onTapGesture {
                        price = 138
                    }
            }
            .padding(.bottom,10)
            Button {
                chargeAlert = true
            } label: {
                Text("立即开通会员")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.all,5)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("ChargeCard"))
            .cornerRadius(20)
            .alert(Text("充值\(getCurrentTime())成功"), isPresented: $chargeAlert) {
                
            } message: {
                Text("会员将在24小时之内到账，请注意查收")
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.5))
        .cornerRadius(20)
        
    }
    func getCurrentTime() -> String {
        var s: String
        switch price {
        case 18:
            s = "1个月"
        case 45:
            s = "3个月"
        case 138:
            s = "12个月"
        default:
            s = "wrong"
        }
        return s
    }
}

struct VIPChargePage_Previews: PreviewProvider {
    static var previews: some View {
        VIPChargePage(username: "Hello")
    }
}
