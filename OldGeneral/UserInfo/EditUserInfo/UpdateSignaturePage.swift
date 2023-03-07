//
//  UpdateSignaturePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UpdateSignaturePage: View {
    @EnvironmentObject var userInfo: userInfoShared
    @State var signature: String = ""
    @State var noticeMessage: String = " "
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(){
            Text("编辑签名")
                .padding()
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("原签名:")
                    Text(userInfo.data.userSignature)
                }
                .font(.footnote)
                .onTapGesture {
                    signature  = userInfo.data.userSignature
                }
                TextField("请输入您的个性签名", text: $signature)
                    .onChange(of: signature, perform: { newValue in
                        noticeMessage = " "
                    })
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        HStack{
                            Spacer()
                            if !signature.isEmpty {
                                Image(systemName: "x.circle")
                                    .onTapGesture {
                                        signature = ""
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
                guard !signature.isEmpty else {
                    noticeMessage = "签名为空"
                    return
                }
                
                if  userInfo.data.userSignature != signature  {
                    userInfo.data.userSignature = signature
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

struct UpdateSignaturePage_Previews: PreviewProvider {
    static var previews: some View {
        UpdateSignaturePage()
            .environmentObject(userInfoShared())
    }
}
