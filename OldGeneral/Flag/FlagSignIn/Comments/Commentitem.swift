//
//  commentitem.swift
//  OldGeneral
//
//  Created by 李毓琪 on 2023/3/13.
//

import SwiftUI

struct Commentitem: View {
    var comment: Cdr_CommentInfo
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: comment.userInfo.avatar)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                         .clipShape(Circle())
                         .frame(width: 40,height: 40)
                         .padding(.trailing,10)
                default :
                    Image("avatar")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                        .padding(.trailing,10)
                }
            }
            VStack(alignment: .leading,spacing: 10){
                Text(comment.userInfo.name)
                Text(comment.content)
            }
            .lineLimit(1)
            .font(.caption)
            Spacer()
            Text(timestampToTime(comment.createdAt))
                .font(.caption)
                
        }
        .padding(5)
    }
}

struct Commentitem_Previews: PreviewProvider {
    static var previews: some View {
        let comment = Cdr_CommentInfo.with{ my in
            my.id = "123"
            my.createdAt = getTimeStamp()
            my.content = "content"
            my.signinID = "id"
            my.userInfo.id = "userid"
            my.userInfo.name = "username"
            my.userInfo.avatar = "https://as1.ftcdn.net/v2/jpg/03/03/97/00/1000_F_303970065_Yi0UpuVdTb4uJiEtRdF8blJLwcT4Qd4p.jpg"
            
        }
        Commentitem(comment: comment)
    }
}
