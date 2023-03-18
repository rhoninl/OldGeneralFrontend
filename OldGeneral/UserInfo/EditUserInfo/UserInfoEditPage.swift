//
//  UserInfoEditPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/26.
//

import SwiftUI

struct UserInfoEditPage: View {
    @EnvironmentObject var userInfo :userInfoShared
    var body: some View {
        VStack{
            Text("编辑信息")
                .padding()
                .font(.title2)
            List{
                NavigationLink(destination: UploadAvatarPage()) {
                    HStack{
                        Text("头像")
                        Spacer()
                        AsyncImage(url: URL(string: userInfo.data.avatar)) { phase in
                            switch phase {
                            case .success(let image):
                                image.resizable()
                                     .clipShape(Circle())
                                     .frame(width: 50,height: 50)
                                     .padding(.trailing,10)
                            default :
                                Image("avatar")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 50,height: 50)
                                    .padding(.trailing,10)
                            }
                        }
                    }
                }
                
                NavigationLink(destination: UpdateUserNamePage()) {
                    HStack{
                        Text("昵称")
                        Spacer()
                        Text(userInfo.data.name)
                            .padding(.trailing,10)
                            .lineLimit(1)
                    }
                }
                
                NavigationLink(destination: UploadSexPage()) {
                    HStack{
                        Text("性别")
                        Spacer()
                        Text(userInfo.data.gender)
                            .padding(.trailing,10)
                    }
                }
                
                NavigationLink(destination: UpdateSignaturePage()) {
                    HStack{
                        Text("个性签名")
                        Spacer()
                        Text(userInfo.data.signature)
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
    @Binding var userInfo:Cdr_UserBasicInfo
    static var previews: some View {
        UserInfoEditPage()
            .environmentObject(userInfoShared())
    }
}
