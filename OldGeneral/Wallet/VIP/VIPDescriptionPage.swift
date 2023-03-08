//
//  VIPDescriptionPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct VIPDescriptionPage: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{
            Text("👑 会员权益 👑")
                .font(.title2)
                .padding()
            
            LazyVGrid(columns: columns,spacing: 20) {
                VIPPrivilegesItem(icon: Image(systemName: "cup.and.saucer.fill"), text: "请假次数翻倍", subText: "单休变双休")
                VIPPrivilegesItem(icon: Image(systemName: "creditcard.fill"), text: "充值享折扣", subText: "VIP加送15%金币")
                VIPPrivilegesItem(icon: Image(systemName: "paperplane.fill"), text: "会员Flag推荐", subText: "更多曝光，流量加权")
                VIPPrivilegesItem(icon: Image(systemName: "phone.fill"), text: "专属客服", subText: "1对1 客服 7*24 在线")
                VIPPrivilegesItem(icon: Image(systemName: "table.badge.more"), text: "更多特权", subText: "尽情期待")
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.black.opacity(0.6))
    }
}

struct VIPDescriptionPage_Previews: PreviewProvider {
    static var previews: some View {
        VIPDescriptionPage()
    }
}
