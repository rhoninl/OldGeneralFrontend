//
//  VIPChargePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct VIPChargePage: View {
    @EnvironmentObject var userInfo: userInfoShared
    @State private var time: Int64 = 1
    @State private var chargeAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack(){
            HStack{
                VStack(alignment: .leading,spacing: 6){
                    Text(userInfo.data.name)
                    Text("\(isVIP ? "过期时间：" + timestampToDate(vipEndTime) : "开通VIP专享超值特权" )")
                        .font(.caption2)
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding()
            HStack(spacing: 20){
                VIPChargeItem(currentTime:$time, chargeTime: 1, primaryPrice: 20, nowPrice: vipTimeToPrice(1))
                VIPChargeItem(currentTime:$time, chargeTime: 3, primaryPrice: 50, nowPrice: vipTimeToPrice(3))
                VIPChargeItem(currentTime:$time, chargeTime: 12, primaryPrice: 216, nowPrice: vipTimeToPrice(12))
            }
            .padding(.bottom,10)
            Button {
                guard ChargeVIP(time) else {
                    return
                }
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
            .alert(isPresented: $chargeAlert) {
                Alert(title: Text("充值\(getCurrentTime())成功"), message: Text("会员将在24小时之内到账，请注意查收")
                      , dismissButton: .default(Text("我知道了！"),action: {
                    self.presentationMode.wrappedValue.dismiss()
                }))
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.5))
        .cornerRadius(20)
        
    }
    func getCurrentTime() -> String {
        var s: String
        switch time {
        case 1:
            s = "1个月"
        case 3:
            s = "3个月"
        case 12:
            s = "12个月"
        default:
            s = "wrong"
        }
        return s
    }
}

struct VIPChargePage_Previews: PreviewProvider {
    static var previews: some View {
        VIPChargePage()
            .environmentObject(userInfoShared())
    }
}
