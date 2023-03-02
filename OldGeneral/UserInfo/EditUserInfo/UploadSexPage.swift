//
//  UploadSexPage.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/2.
//

import SwiftUI

struct UploadSexPage: View {
    @State var currentSex: String = "男"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("选择性别")
                .padding()
            HStack(spacing: 50){
                SexItem(str: "♂",ischoose: currentSex == "男")
                    .onTapGesture {
                        currentSex = "男"
                    }
                SexItem(str: "♀",ischoose: currentSex == "女")
                    .onTapGesture {
                        currentSex = "女"
                    }
            }
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("确认")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(currentSex == "男" ? .blue : .pink )
            .padding()
            Spacer()
        }
    }
}

struct UploadSexPage_Previews: PreviewProvider {
    static var previews: some View {
        UploadSexPage()
    }
}
