//
//  UserInfoEditPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct UserInfoEditPage: View {
    var username: String = "This is username"
    var sex: String = "女"
    var Signature: String = "这个是 个性签名"
    var body: some View {
        VStack{
            Text("编辑信息")
                .padding()
                .font(.title2)
            List{
                NavigationLink(destination: UploadAvatarvPage()) {
                    HStack{
                        Text("头像")
                        Spacer()
                        Image("turtlerock")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .clipShape(Circle())
                            .padding(.trailing,10)
                    }
                }
                
                NavigationLink(destination: UpdateUserNamePage()) {
                    HStack{
                        Text("昵称")
                        Spacer()
                        Text(username)
                            .padding(.trailing,10)
                            .lineLimit(1)
                    }
                }
                
                NavigationLink(destination: UploadSexPage()) {
                    HStack{
                        Text("性别")
                        Spacer()
                        Text(sex)
                            .padding(.trailing,10)
                    }
                }
                
                NavigationLink(destination: UpdateSignaturePage()) {
                    HStack{
                        Text("个性签名")
                        Spacer()
                        Text(Signature)
                            .padding(.trailing,10)
                            .lineLimit(1)
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}

struct UserInfoEditPage_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoEditPage()
    }
}
