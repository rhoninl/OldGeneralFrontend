//
//  UpdateSignaturePage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UpdateSignaturePage: View {
    @State var signature: String = "this is signature"
    @State var noticeMessage: String = " "
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(){
            Text("编辑签名")
            TextField("请输入您的个性签名", text: $signature)
                .onChange(of: signature, perform: { newValue in
                    noticeMessage = " "
                })
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

struct UpdateSignaturePage_Previews: PreviewProvider {
    static var previews: some View {
        UpdateSignaturePage()
    }
}
