//
//  UserInfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI
import UIKit


struct UserInfo: View {
    @EnvironmentObject var userInfo: userInfoShared
    @State private var refreshImage = false
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: userInfo.data.avatar)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                default :
                    Image("avatar")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                }
            }
            Spacer()
                .frame(width: 30.0)
            VStack(alignment: .leading,spacing: 5){
                Text(userInfo.data.name)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("id: \(userInfo.data.id)")
                    .font(.custom("", size: 10))
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("性别：\(userInfo.data.gender)")
                    Divider()
                        .fixedSize()
                    Text("加入 \(diffDateNow(userInfo.data.createdAt)) 天")
                }
                .font(.footnote)
                Text(userInfo.data.signature)
                    .font(.caption)
                    .foregroundColor(.primary.opacity(0.6))
            }
            .lineLimit(1)
        }
        .onAppear {
            userInfo.fetchUserInfo(userId)
            refreshImage.toggle()
        }
    }
}


struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
            .environmentObject(userInfoShared())
    }
}
