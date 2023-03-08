//
//  frendMessageItem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/8.
//

import SwiftUI

struct frendMessageItem: View {
    var userAvatarUrl: String = "http://106.75.229.90:3980/picture/d793e3689a4caf4136650cb01ef13c9.jpg"
    var frendName: String = "this is frendName"
    var lastMessageTime: String = "2022-01-01"
    var lastMessage: String = "this is last message data"
    var messageNum: Int = 1222
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: userAvatarUrl)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                default :
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
            }
            VStack(alignment: .leading,spacing: 15){
                HStack{
                    Text(frendName)
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text(lastMessageTime)
                        .font(.caption2)
                }
                HStack{
                    Text(lastMessage)
                        .font(.caption)
                }
            }
            .overlay(alignment: .bottomTrailing) {
                if messageNum > 0 {
                    Text("\(messageNum)")
                        .foregroundColor(.white)
                        .font(.caption)
                        .padding(.all,3)
                        .background(.red.opacity(0.9))
                        .cornerRadius(10)
                        .padding([.bottom,.trailing],5)
                        
                }
            }
        }
        .lineLimit(1)
    }
}

struct frendMessageItem_Previews: PreviewProvider {
    static var previews: some View {
        frendMessageItem()
    }
}
