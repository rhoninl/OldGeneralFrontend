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
        AsyncImage(url: URL(string: info.pictureURL)){ phase in
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
        .overlay() {
            VStack{
                Spacer()
                VStack(spacing: 5){
                    HStack {
                        Text(info.content)
                            .font(.subheadline)
                            .lineLimit(1)
                            .padding(.leading,4)
                        Spacer()
                    }
                    HStack{
                        Text(info.userName)
                            .lineLimit(1)
                        Spacer()
                        Text("挑战金：\(info.challengeNum)金")
                            .lineLimit(1)
                            .foregroundColor(Color("Money"))
                    }
                    .font(.caption2)
                    .padding([.leading,.bottom],4)
                }
                .padding(.top,5)
                .background(Color.init(red: 0.98, green: 0.98, blue: 0.98))
            }
            .frame(width: 180,height: 250)
        }
        .frame(width: 180,height: 250)
        .cornerRadius(5)
        .foregroundColor(.black)
    }
}

struct FlagSquareItem_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_FlagSquareItemInfo.with { my in
            my.currentTime = 0
            my.totalTime = 0
            my.userName = "MrLeea"
            my.content = "xijingping?"
            my.challengeNum = 100
            my.pictureURL = "https://oldgeneral.obs.cn-north-4.myhuaweicloud.com/avatars/2ac20dad-96d3-4202-85a4-fb4b2533f7a5/94bf3101-029e-4934-b52e-403a7ade4bba/85A3FB14-9A1F-4C3B-8CD2-15BA8387F324.jpg"
//            my.signinPicture = "https://gimg3.baidu.com/rel/src=https%3A%2F%2Fgips2.baidu.com%2Fit%2Fu%3D1452012816%2C1199016394%26fm%3D3028%26app%3D3028%26f%3DPNG%26fmt%3Dauto%26q%3D75%26size%3Df1138_640&refer=http%3A%2F%2Fwww.baidu.com&app=2010&size=w560&n=0&g=0n&q=100&fmt=auto?sec=1679504400&t=ae0d9e7004b189b2da761adfbf59bd32"
        }
        FlagSquareItem(info: info)
    }
}
