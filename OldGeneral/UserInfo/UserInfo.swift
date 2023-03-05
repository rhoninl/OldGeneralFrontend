//
//  UserInfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI
import UIKit

struct UserInfo: View {
    init(preview: Bool = false) {
        if preview {
            return
        }
        let data = getUserBasicInfo(userId)
        guard data != nil else {
            return
        }
        userInfo = data!
    }

    private var userInfo: Userinfo_UserBasicInfo = Userinfo_UserBasicInfo.with { my in
        my.userID = "TestUserId"
        my.userName = "TestUserName"
        my.userGender = "男"
        my.userBirthday = 1649439999000
        my.userSignature = "没有签名"
    }

    var body: some View {
        HStack{
//            present(myViewController, animated: true, completion: nil)
            AsyncImage(url: URL(string: userInfo.userAvatar)) { phase in
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
                Text(userInfo.userName)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("id: \(userInfo.userID)")
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("性别：\(userInfo.userGender)")
                    Divider()
                        .fixedSize()
                    Text("加入 \(diffDateNow(userInfo.userBirthday)) 天")
                }
                .font(.footnote)
                Text(userInfo.userSignature)
                    .font(.caption)
                    .foregroundColor(.primary.opacity(0.6))
                    .lineLimit(1)
            }
        }
    }
}


struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo(preview: true)
    }
}
