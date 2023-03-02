//
//  UpdateUserNamePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UpdateUserNamePage: View {
    @State var username: String = "this is username"
    @State var noticeMessage: String = " "
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(){
            Text("编辑昵称")
            TextField("请输入您的用户名", text: $username)
                .textFieldStyle(.roundedBorder)
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
    }
}

struct UpdateUserNamePage_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUserNamePage(username: "this is username")
    }
}
