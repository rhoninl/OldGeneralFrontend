//
//  FlagCardItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/4.
//

import SwiftUI

struct FlagCardItem: View {
    var info: Cdr_SignInInfo = Cdr_SignInInfo()
    var totalNum: Int64 = 1000
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            AsyncImage(url: URL(string: info.pictureURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default :
                    Image("turtlerock")
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: 150,height: 180)
            .overlay(alignment: .bottomLeading) {
                Text("进度 \(info.currentTime)/\(totalNum)")
                    .padding(.all,4)
                    .foregroundColor(Color("white"))
                    .background(.primary.opacity(0.6))
                    .cornerRadius(5)
                    .padding(.all,4)
                    .font(.caption2)
            }
            HStack{
                Text(info.content)
                    .font(.caption)
                    .lineLimit(1)
                    .padding([.leading,.bottom],2)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.all,4)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        }
        .cornerRadius(7)
        .frame(width: 150,height: 210)
    }
}

struct FlagCardItem_Previews: PreviewProvider {
    static var previews: some View {
        let info = Cdr_SignInInfo.with{ my in
            my.content = "this is test signin"
            my.pictureURL = "https://oldgeneral.obs.cn-north-4.myhuaweicloud.com:443/avatars/2ac20dad-96d3-4202-85a4-fb4b2533f7a5/94bf3101-029e-4934-b52e-403a7ade4bba/7A1AAB9F-FC2B-465D-8883-C41E4C7B45A7.jpg"
        }

        FlagCardItem(info: info,totalNum: 100)
    }
}
