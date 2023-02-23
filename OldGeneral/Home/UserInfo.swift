//
//  UserInfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct UserInfo: View {
    private var UserName: String = "TestUserName"
    private var UserId: String = "TestUserId"
    private var Sex: String = "男"
    private var Days: Int = 10
    var body: some View {
        HStack{
            Image("turtlerock")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .clipShape(Circle())
                
            Spacer()
                .frame(width: 30.0)
            VStack(alignment: .leading){
                Text(UserName)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("id: \(UserId)")
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("性别：\(Sex)")
                    Divider()
                        .fixedSize()
                    Text("加入 \(Days) 天")
                }
                .font(.footnote)
                
            }
        }
    }
}

struct UserInfo_Previews: PreviewProvider {
    static var previews: some View {
        UserInfo()
    }
}
