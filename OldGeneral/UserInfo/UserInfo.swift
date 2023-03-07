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
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: userInfo.data.userAvatar)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                default :
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
            }
            Spacer()
                .frame(width: 30.0)
            VStack(alignment: .leading){
                Text(userInfo.data.userName)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("id: \(userInfo.data.userID)")
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("性别：\(userInfo.data.userGender)")
                    Divider()
                        .fixedSize()
                    Text("加入 \(diffDateNow(userInfo.data.userBirthday)) 天")
                }
                .font(.footnote)
                Text(userInfo.data.userSignature)
                    .font(.caption)
                    .foregroundColor(.primary.opacity(0.6))
            }
            .lineLimit(1)
        }
        .onAppear {
            userInfo.fetchUserInfo(userId)
        }
    }
}


struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
            .environmentObject(userInfoShared())
    }
}
