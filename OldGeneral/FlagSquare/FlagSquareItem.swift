//
//  FlagSquareItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/22.
//

import SwiftUI

struct FlagSquareItem: View {
    var info: Cdr_FlagSquareItemInfo = Cdr_FlagSquareItemInfo()
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: info.signinPicture)){ phase in
                switch phase {
                case .empty:
                    ProgressView("Loading...")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default :
                    Image("avatar")
                        .resizable()
                }
            }
            Spacer()
            HStack {
                Text(info.flagName)
                    .font(.subheadline)
                    .lineLimit(1)
                    .padding(.leading,4)
                Spacer()
            }
            HStack{
                Text(info.userName)
                    .lineLimit(1)
                Spacer()
                Text("挑战金：100金")
                    .lineLimit(1)
                    .foregroundColor(Color("Money"))
            }
            .font(.caption2)
            .padding([.leading,.bottom],4)
        }
        .frame(maxWidth: 180,maxHeight: 250)
        .background(.gray.opacity(0.1))
        .cornerRadius(5)
    }
}

struct FlagSquareItem_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagSquareItemInfo.with { my in
            my.currentTime = 0
            my.totalTime = 0
            my.userName = "MrLeea"
            my.flagName = "xijingping?"
            my.payMoney = 100
            my.signinPicture = "https://img1.baidu.com/it/u=413417701,3210171500&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500"
//            my.signinPicture = "https://gimg3.baidu.com/rel/src=https%3A%2F%2Fgips2.baidu.com%2Fit%2Fu%3D1452012816%2C1199016394%26fm%3D3028%26app%3D3028%26f%3DPNG%26fmt%3Dauto%26q%3D75%26size%3Df1138_640&refer=http%3A%2F%2Fwww.baidu.com&app=2010&size=w560&n=0&g=0n&q=100&fmt=auto?sec=1679504400&t=ae0d9e7004b189b2da761adfbf59bd32"
        }
        FlagSquareItem(info: info)
    }
}
