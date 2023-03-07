//
//  UpdateUserNamePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UpdateUserNamePage: View {
    @EnvironmentObject var userInfo: userInfoShared
    @State var noticeMessage: String = " "
    @State var username: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(){
            Text("编辑昵称")
                .padding()
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("原昵称:")
                    Text(userInfo.data.userName)
                }
                    .onTapGesture {
                        username = userInfo.data.userName
                    }
                    .font(.footnote)
                    
                TextField("请输入您的用户名", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .overlay {
                        HStack{
                            Spacer()
                            if !username.isEmpty {
                                Image(systemName: "x.circle")
                                    .onTapGesture {
                                        username = ""
                                    }
                            }
                        }
                        .padding()
                    }
            }
            HStack{
                VStack(alignment: .leading){
                    Text("")
                    Text(noticeMessage)
                        .foregroundColor(.red)
                }
                Spacer()
            }
            Button {
                guard !username.isEmpty else {
                    noticeMessage = "用户名为空"
                    return
                }
                
                if username != userInfo.data.userName {
                    userInfo.data.userName = username
                }
                
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("确认修改")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow.opacity(0.8))
            Spacer()
        }
        .padding()
        .lineLimit(1)
    }
}

struct UpdateUserNamePage_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUserNamePage()
            .environmentObject(userInfoShared())
    }
}
