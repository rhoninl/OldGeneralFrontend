//
//  UserInfo.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/2/4.
//

import SwiftUI

struct UserInfo: View {
    var body: some View {
        HStack{
            Image("turtlerock")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .clipShape(Circle())
                
            Spacer()
                .frame(width: 30.0)
            VStack(alignment: .leading){
                Text("UserName")
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                Text("id: userid")
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("性别：男")
                    Divider()
                        .fixedSize()
                    Text("加入xx天")
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
